#include "minias.h"
const char *internstring(const char *s);
/* Parsed assembly */
static AsmLine *allasm;

/* Symbol table. */
static struct hashtable *symbols;

/* Array of all relocations before adding to the rel section. */
static Relocation *relocs;
static size_t nrelocs;
static size_t reloccap;

#define MAXSECTIONS 32
static Section sections[MAXSECTIONS];
static size_t nsections; // first is reserved.

static Section *cursection;
static Section *shstrtab;
static Section *strtab;
static Section *symtab;
static Section *bss;
static Section *text;
static Section *data;
static Section *textrel;
static Section *datarel;

static char *infilename = "<stdin>";
static size_t curlineno;
static size_t reloclabelno;

#define MAXFIXRELOCS 100
int fixrelarr[MAXFIXRELOCS];
int fixrelno;
int curfixrelno;

static void resglobs(){
    allasm = NULL;
    symbols = NULL;
    relocs = NULL;
    nrelocs = 0;
    reloccap = 0;
    nsections = 1;
    cursection = NULL;
    shstrtab = NULL;
    strtab = NULL;
    symtab = NULL;
    bss = NULL;
    text = NULL;
    data = NULL;
    textrel = NULL;
    datarel = NULL;
    curlineno = 0;
    reloclabelno = 0;
    curfixrelno = 0;
    memset(&sections, 0 , sizeof(sections));
}

static void lfatal(const char *fmt, ...) {
  va_list ap;
  fprintf(stderr, "%s:%ld: ", infilename, curlineno);
  va_start(ap, fmt);
  vwarn(fmt, ap);
  va_end(ap);
  exit(1);
}

static Symbol *getsym(const char *name) {
  Symbol **ps, *s;
  struct hashtablekey htk;

  htabkey(&htk, name, strlen(name));
  ps = (Symbol **)htabput(symbols, &htk);
  if (!*ps) {
    *ps = zalloc(sizeof(Symbol));
    (*ps)->name = name;
  }
  s = *ps;
  return s;
}

static void secaddbytes(Section *s, const void *bytes, size_t n) {

  if (s->hdr.sh_type == SHT_NOBITS) {
    s->hdr.sh_size += n;
    return;
  }

  while (s->capacity < s->hdr.sh_size + n) {
    s->capacity = s->capacity ? (s->capacity * 2) : 512;
    s->data = xrealloc(s->data, s->capacity);
  }
  memcpy(s->data + s->hdr.sh_size, bytes, n);

  s->hdr.sh_size += n;
}

static void secaddbyte(Section *s, uint8_t b) { secaddbytes(s, &b, 1); }

static Elf32_Word elfstr(Section *sec, const char *s) {
  Elf32_Word i = sec->hdr.sh_size;
  secaddbytes(sec, s, strlen(s) + 1);
  return i;
}

static Section *newsection() {
  Section *s;
  if (nsections >= MAXSECTIONS)
    fatal("too many sections");
  s = &sections[nsections];
  s->idx = nsections;
  nsections += 1;
  return s;
}

static Section *getsection(const char *name) {
  size_t i;
  char *secname;
  Section *s;

  for (i = 0; i < nsections; i++) {
    secname = (char *)shstrtab->data + sections[i].hdr.sh_name;
    if (strcmp(secname, name) == 0)
      return &sections[i];
  }
  s = newsection();
  s->hdr.sh_name = elfstr(shstrtab, name);
  return s;
}

static void initsections(void) {
  Elf32_Sym elfsym;

  shstrtab = newsection();
  secaddbyte(shstrtab, 0);
  shstrtab->hdr.sh_name = elfstr(shstrtab, ".shstrtab");
  shstrtab->hdr.sh_type = SHT_STRTAB;

  strtab = newsection();
  secaddbyte(strtab, 0);
  strtab->hdr.sh_name = elfstr(shstrtab, ".strtab");
  strtab->hdr.sh_type = SHT_STRTAB;

  symtab = newsection();
  symtab->hdr.sh_name = elfstr(shstrtab, ".symtab");
  symtab->hdr.sh_type = SHT_SYMTAB;
  symtab->hdr.sh_link = strtab->idx;
  symtab->hdr.sh_entsize = sizeof(Elf32_Sym);
  memset(&elfsym, 0, sizeof(elfsym));
  secaddbytes(symtab, &elfsym, sizeof(Elf32_Sym));

  bss = newsection();
  bss->hdr.sh_name = elfstr(shstrtab, ".bss");
  bss->hdr.sh_type = SHT_NOBITS;
  bss->hdr.sh_flags = SHF_ALLOC | SHF_WRITE;
  bss->hdr.sh_addralign = 16; // XXX right value?

  data = newsection();
  data->hdr.sh_name = elfstr(shstrtab, ".data");
  data->hdr.sh_type = SHT_PROGBITS;
  data->hdr.sh_flags = SHF_ALLOC | SHF_WRITE;
  data->hdr.sh_addralign = 16; // XXX right value?

  text = newsection();
  text->hdr.sh_name = elfstr(shstrtab, ".text");
  text->hdr.sh_type = SHT_PROGBITS;
  text->hdr.sh_flags = SHF_EXECINSTR | SHF_ALLOC;
  text->hdr.sh_addralign = 4;

  textrel = newsection();
  textrel->hdr.sh_name = elfstr(shstrtab, ".rela.text");
  textrel->hdr.sh_type = SHT_RELA;
  textrel->hdr.sh_info = text->idx;
  textrel->hdr.sh_link = symtab->idx;
  textrel->hdr.sh_entsize = sizeof(Elf32_Rela);

  datarel = newsection();
  datarel->hdr.sh_name = elfstr(shstrtab, ".rela.data");
  datarel->hdr.sh_type = SHT_RELA;
  datarel->hdr.sh_info = data->idx;
  datarel->hdr.sh_link = symtab->idx;
  datarel->hdr.sh_entsize = sizeof(Elf32_Rela);
}

static Relocation *newreloc() {
  if (nrelocs == reloccap) {
    reloccap = nrelocs ? nrelocs * 2 : 64;
    relocs = xreallocarray(relocs, reloccap, sizeof(Relocation));
  }
  return &relocs[nrelocs++];
}

/* Shorthand helpers to write section data. */

static void sb(uint8_t b) { secaddbyte(cursection, b); }

static void sb2(uint8_t b1, uint8_t b2) {
  uint8_t buf[2] = {b1, b2};
  secaddbytes(cursection, buf, sizeof(buf));
}

static void sbn(uint8_t *bytes, size_t n) { secaddbytes(cursection, bytes, n); }

static void su16(uint16_t w) {
  uint8_t buf[2] = {w & 0xff, (w & 0xff00) >> 8};
  secaddbytes(cursection, buf, sizeof(buf));
}

static void su32(uint32_t l) {
  uint8_t buf[4] = {
      l & 0xff,
      (l & 0xff00) >> 8,
      (l & 0xff0000) >> 16,
      (l & 0xff000000) >> 24,
  };
  secaddbytes(cursection, buf, sizeof(buf));
}

static void su64(uint64_t l) {
  uint8_t buf[8] = {
      l & 0xff,
      (l & 0xff00) >> 8,
      (l & 0xff0000) >> 16,
      (l & 0xff000000) >> 24,
      (l & 0xff00000000) >> 32,
      (l & 0xff0000000000) >> 40,
      (l & 0xff000000000000) >> 48,
      (l & 0xff00000000000000) >> 56,
  };
  secaddbytes(cursection, buf, sizeof(buf));
}

/* Convert an AsmKind to register bits in reg/rm style.  */
static uint8_t regbits(AsmKind k) { return (k - (ASM_REG_BEGIN + 1)) % 32; }




void assembleconstant(int64_t c, int nbytes) {
  switch (nbytes) {
  case 0:
    break;
  case 1:
    sb((uint8_t)c);
    break;
  case 2:
    su16((uint16_t)c);
    break;
  case 4:
    su32((uint32_t)c);
    break;
  case 8:
    su64((uint64_t)c);
    break;
  default:
    unreachable();
  }
}

/* The VarBytes type encodes a variadic number of bytes.
   The top byte is how many bytes we encode less 1.

   examples:
   <nothing> encodes as -1
   0c encodes as 0x0000000c
   02 03  encodes as 0x01000203
*/
typedef int32_t VarBytes;

static void assemblevbytes(VarBytes bytes) {
  int i, n;
  uint8_t b, shift;

  n = (int8_t)(uint8_t)((bytes & 0xff000000) >> 24);
  for (i = n; i >= 0; i--) {
    shift = i * 8;
    b = (bytes & (0xff << shift)) >> shift;
    sb(b);
  }
}


/* Assemble a symbolic value. */
static int assemblereloc(const char *l, int64_t c, int nbytes, int type) {
  Relocation *reloc;
  Symbol *sym;
  if (l != NULL) {
    if(fixrelno && nrelocs == fixrelarr[curfixrelno]) {
      curfixrelno += 1;
      return 1;
    }
    reloc = newreloc();
    sym = getsym(l);
    reloc->type = type;
    reloc->section = cursection;
    reloc->sym = sym;
    reloc->offset = cursection->hdr.sh_size;
    reloc->addend = c;
    c = 0;
  }
  assembleconstant(c, nbytes);
  return 0;
}

static void addsymbol(const char* name) {
  Symbol *sym;
  sym = getsym(name);
  sym->section = cursection;
  sym->offset = cursection->hdr.sh_size;
  if (sym->defined)
    lfatal("%s already defined", sym->name);
   sym->defined = 1;
}

static void assemble_utype(const Instr *instr, uint8_t opcode) {
  uint8_t rd;
  const Imm *imm;
  uint32_t imm32u;
  imm = &instr->arg2->imm;
  imm32u = (imm->v.c & 0xfffff);
  rd =  regbits(instr->arg1->kind);
  su32( imm32u << 12 | rd << 7 | opcode);
}

static void assemble_rtype(const Instr *instr, uint8_t funct7, uint8_t funct3, uint8_t opcode) {
  uint8_t rd, rs1, rs2;
  rd =  regbits(instr->arg1->kind);
  rs1 = regbits(instr->arg2->kind);
  rs2 = regbits(instr->arg3->kind);
  su32(funct7 << 25 | rs2 << 20 | rs1 << 15 | funct3 << 12 | rd << 7 | opcode);
}

static void assemble_itype(const Instr *instr, uint8_t funct3, uint8_t opcode) {
  uint8_t rd, rs1;
  const Imm *imm;
  uint32_t imm32u;
  uint32_t val;
  char buf[6];
  Symbol *auipc;
  Symbol *sym;
  const char *relname;
  rd =  regbits(instr->arg1->kind);
  if(instr->variant == 0) {   
    rs1 = regbits(instr->arg2->kind);
    imm = &instr->arg3->imm;
    val = imm->v.c;
  } else if(instr->variant == 1) {
    // li = lui + addi
    imm = &instr->arg2->imm;
    val = imm->v.c;
    imm32u = imm->v.c;
    if((imm32u & 0x800) != 0) imm32u += 0x1000;
    su32((imm32u & 0xfffff000) | rd << 7 | 0x37);
    rs1 = rd;
  } else {
    // la = auipc + addi
    imm = &instr->arg2->imm;
    rs1 = rd;
    sprintf(buf,".R%d",reloclabelno);
    relname = internstring(buf);
    auipc = getsym(relname);
    auipc->section = cursection;
    auipc->offset = cursection->hdr.sh_size;
    if (auipc->defined)
     lfatal("%s already defined", auipc->name);
    auipc->defined = 1;
    reloclabelno++;
    assemblereloc(imm->v.l, imm->v.c, 0, R_RISCV_PCREL_HI20);
    su32(0 | rd << 7 | 0x17);
    assemblereloc(relname, 0, 0,  R_RISCV_PCREL_LO12_I);
    val = 0;
  }
  su32((val & 0xfff) << 20 | rs1 << 15 | funct3 << 12 | rd << 7 | opcode);
}

static void assemble_itype_shift(const Instr *instr, uint8_t funct3, uint8_t funct5) {
  uint8_t rd, rs1;
  const Imm *shamt;
  rd =  regbits(instr->arg1->kind);
  rs1 = regbits(instr->arg2->kind);
  shamt = &instr->arg3->imm;
  su32((funct5 & 0x1f) << 27 | ((shamt->v.c) & 0x1f) << 20 | rs1 << 15 | funct3 << 12 | rd << 7 | 0x13);
}

static void assemble_itype_load(const Instr *instr, uint8_t funct3, bool fval) {
  uint8_t rd, rda, rs1;
  const Imm *imm;
  uint32_t val;
  char buf[6];
  Symbol *auipc;
  Symbol *sym;
  uint8_t opc;
  const char *relname;
  rd =  regbits(instr->arg1->kind);
  if(instr->variant == 0) {   
    rs1 = regbits(instr->arg2->kind);
    imm = &instr->arg3->imm;
    val = imm->v.c;
  } else {
    // load symbol
    imm = &instr->arg2->imm;
    if(!fval) rs1 = rd; 
        else rs1 = regbits(instr->arg3->kind);
    sprintf(buf,".R%d",reloclabelno);
    relname = internstring(buf);
    auipc = getsym(relname);
    auipc->section = cursection;
    auipc->offset = cursection->hdr.sh_size;
    if (auipc->defined)
     lfatal("%s already defined", auipc->name);
    auipc->defined = 1;
    reloclabelno++;
    assemblereloc(imm->v.l, imm->v.c, 0, R_RISCV_PCREL_HI20);
    if(!fval) rda = rd;
        else rda = rs1;
    su32(0 | rda << 7 | 0x17);
    assemblereloc(relname, 0, 0,  R_RISCV_PCREL_LO12_I);
    val = 0;
  }
  if(!fval) opc = 3; else opc = 7;
  su32((val & 0xfff) << 20 | rs1 << 15 | funct3 << 12 | rd << 7 | opc);
}

static void assemble_stype(const Instr *instr, uint8_t funct3, bool fval) {
  uint8_t rs2, rs1, opc;
  const Imm *imm;
  uint32_t val;
  char buf[6];
  Symbol *auipc;
  Symbol *sym;
  const char *relname;
  rs2 =  regbits(instr->arg1->kind);
  if(instr->variant == 0) {     
    rs1 = regbits(instr->arg2->kind);
    imm = &instr->arg3->imm;
    val = imm->v.c;
  } else {
    // store symbol
    imm = &instr->arg2->imm;
    rs1 = regbits(instr->arg3->kind);
    sprintf(buf,".R%d",reloclabelno);
    relname = internstring(buf);
    auipc = getsym(relname);
    auipc->section = cursection;
    auipc->offset = cursection->hdr.sh_size;
    if (auipc->defined)
     lfatal("%s already defined", auipc->name);
    auipc->defined = 1;
    reloclabelno++;
    assemblereloc(imm->v.l, imm->v.c, 0, R_RISCV_PCREL_HI20);
    su32(0 | rs1 << 7 | 0x17);
    assemblereloc(relname, 0, 0,  R_RISCV_PCREL_LO12_S);
    val = 0;
  }
  if(!fval) opc = 0x23; else opc = 0x27;
  su32(((val >> 5) & 0x7f) << 25 | rs2 << 20 | rs1 << 15 | funct3 << 12 | (val & 0x1f) << 7 | opc);
}

int insrange(int bits, int val) {
  int msb = 1<<(bits-1);
  int ll = -msb;
  return((val<=(msb-1) && val>=ll) ? 1 : 0);
}

static uint32_t encbsimm(int32_t simm) {
   if(!insrange(13, simm)) fprintf(stderr,"branch relocation value invalid:%d!\r\n", simm);
   return ((simm >> 12) & 1) << 31 | ((simm >> 5) & 0x3f) << 25 | ((simm >> 1) & 0xf) << 8 | ((simm >> 11) & 1) << 7;
}

static uint32_t enchi20(int32_t simm) {
   uint32_t val;
   val = simm;
   if(val & 0x800) val += 0x1000;
   val &= 0xFFFFF000;
   return val;
}

static uint32_t encs12(int32_t simm) {
   uint32_t val;
   val = simm;
   val = (val&0x1F)<<7 | (val>>5)<<25; ;
   return val;
}

static uint32_t enci12(int32_t simm) {
   uint32_t val;
   val = simm;
   val &= 0xFFF;
   val = val << 20;
   return val;
}



static uint32_t encj(int32_t simm) {
   uint32_t val;
   val = simm;
   return  ((val >> 20) & 0x1) << 31 | ((val >> 1) & 0x3FF) << 21 | (( val >> 11) & 0x1)<<20 | ((val >> 12) & 0xFF) << 12; 
}

static void assemble_jtype(const Instr *instr) {
  uint8_t rd;
  const Imm *imm; 
  uint32_t simm;
  if(instr->variant == 0) {    
    rd =  regbits(instr->arg1->kind);
    imm = &instr->arg2->imm;
  } else if(instr->variant == 1) {
    rd = 1;
    imm = &instr->arg1->imm;      
  } else {
    rd = 0;
    imm = &instr->arg1->imm;    
  }
  simm = encj(imm->v.c) | rd << 7  | 0x6f;
  assemblereloc(imm->v.l, 0, 0, R_RISCV_JAL);
  su32(simm);  
}

static void assemble_sbtype(const Instr *instr, uint8_t funct3) {
  uint8_t rs2, rs1;
  const Imm *imm;
  Instr jmpinstr;
  uint32_t simm;
  rs1 =  regbits(instr->arg1->kind);
  rs2 = regbits(instr->arg2->kind);
  imm = &instr->arg3->imm;
  simm = encbsimm(imm->v.c) | rs2 << 20 |  rs1 << 15 | (funct3 & 0x7) << 12  | 0x63;
  if(assemblereloc(imm->v.l, 0, 0, R_RISCV_BRANCH)) {
    simm = encbsimm(8) | rs2 << 20 |  rs1 << 15 | ((funct3 & 0x7) ^ 1) << 12  | 0x63;
    su32(simm);
    jmpinstr = *instr;
    jmpinstr.variant = 2;
    jmpinstr.arg1 = (Parsev *)imm;
    assemble_jtype(&jmpinstr);
  } else su32(simm);
}

static void assemble_csrtype(const Instr *instr, uint8_t opcode) {
  uint8_t rd, rs1;
  const Imm *imm;
  uint32_t imm32u;
  rd =  regbits(instr->arg1->kind);
  imm = &instr->arg2->imm;
  rs1 =  regbits(instr->arg3->kind); 
  imm32u = imm->v.c & 0xfffff;
  su32( imm32u << 20 | rs1 << 15 | opcode << 12 | rd << 7 | 0x73);
}

static void assemble_csritype(const Instr *instr, uint8_t opcode) {
  uint8_t rd;
  const Imm *csr;
  const Imm *zimm; 
  uint32_t csrimm32u;
  uint8_t zimm8u;
  rd =  regbits(instr->arg1->kind);
  csr = &instr->arg2->imm;
  zimm = &instr->arg3->imm;
  csrimm32u = csr->v.c & 0xfffff;
  zimm8u = zimm->v.c & 0x1f;
  su32( csrimm32u << 20 | zimm8u << 15 | opcode << 12 | rd << 7 | 0x73);
}

static void assemble(void) {
  Symbol *sym;
  AsmLine *l;
  const Parsev *v;

  cursection = text;
  curlineno = 0;
  for (l = allasm; l; l = l->next) {
    curlineno++;
    v = l->v;
    switch (v->kind) {
    case ASM_SYNTAX_ERROR:
      lfatal("syntax error");
      break;
    case ASM_BLANK:
      break;
    case ASM_DIR_GLOBL:
      sym = getsym(v->globl.name);
      sym->global = 1;
      break;
    case ASM_DIR_SECTION: {
      const char *fp;
      Section *s;
      if (strcmp(v->section.name, ".rodata") == 0) s = data;
      else s = getsection(v->section.name);
      s->hdr.sh_type = v->section.type;
      fp = v->section.flags;
      while (fp && *fp) {
        switch (*(fp++)) {
        case 'a':
          s->hdr.sh_flags |= SHF_ALLOC;
          break;
        case 'w':
          s->hdr.sh_flags |= SHF_WRITE;
          break;
        case 'x':
          s->hdr.sh_flags |= SHF_EXECINSTR;
          break;
        default:
          unreachable();
        }
      }
      cursection = s;
      break;
    }
    case ASM_DIR_DATA:
      cursection = data;
      break;
    case ASM_DIR_TEXT:
      cursection = text;
      break;
    case ASM_DIR_BSS:
      cursection = bss;
      break;
    case ASM_DIR_ASCII:
      sbn(v->ascii.data, v->ascii.len);
      break;
    case ASM_DIR_ASCIIZ:
      sbn(v->asciiz.data, v->asciiz.len);
      sb(0x00);
      break;
    case ASM_DIR_FILE:
      break;
    case ASM_DIR_TYPE:
      break;
    case ASM_DIR_SIZE:
      break;
    case ASM_DIR_BALIGN: {
      int64_t i, rem, amnt;
      amnt = 0;
      rem = cursection->hdr.sh_size % v->balign.align;
      if (rem)
        amnt = v->balign.align - rem;
      for (i = 0; i < amnt; i++) {
        sb(0x00);
      }
      break;
    }
    case ASM_DIR_FILL: {
      ssize_t i = 0;

      for (i = 0; i < v->fill.repeat; i++) {
        switch (v->fill.size) {
        case 1:
        case 2:
        case 4:
        case 8:
          assembleconstant(v->fill.value, v->fill.size);
          break;
        default:
          lfatal("unsupported fill size '%d'", v->fill.size);
        }
      }
      break;
    }
    case ASM_DIR_BYTE:
      assemblereloc(v->dirbyte.value.l, v->dirbyte.value.c, 1, R_RISCV_32);
      break;
    case ASM_DIR_SHORT:
      assemblereloc(v->dirshort.value.l, v->dirshort.value.c, 2, R_RISCV_32);
      break;
    case ASM_DIR_INT:
      assemblereloc(v->dirint.value.l, v->dirint.value.c, 4, R_RISCV_32);
      break;
    case ASM_DIR_WORD:
      assemblereloc(v->dirint.value.l, v->dirint.value.c, 4, R_RISCV_32);
      break;
    case ASM_DIR_QUAD:
      assemblereloc(v->dirquad.value.l, v->dirquad.value.c, 8, R_RISCV_32);
      break;
    case ASM_LABEL:
      addsymbol(v->label.name);
      break;
    case ASM_NOP:
      su32(0x13);
      break;
    case ASM_ADD:
      assemble_rtype(&v->instr, 0x0, 0x0, 0x33);
      break;
    case ASM_FADD:
      assemble_rtype(&v->instr, 0x0, 0x7, 0x53);
      break;
    case ASM_FSUB:
      assemble_rtype(&v->instr, 0x4, 0x7, 0x53);
      break;
    case ASM_FMUL:
      assemble_rtype(&v->instr, 0x8, 0x7, 0x53);
      break;
    case ASM_FDIV:
      assemble_rtype(&v->instr, 0xC, 0x7, 0x53);
      break;
    case ASM_FMIN:
      assemble_rtype(&v->instr, 0x14, 0x0, 0x53);
      break;
    case ASM_FMAX:
      assemble_rtype(&v->instr, 0x14, 0x1, 0x53);
      break;
    case ASM_FSGNJ:
      assemble_rtype(&v->instr, 0x10, 0x0, 0x53);
      break;
    case ASM_FSGNJN:
      assemble_rtype(&v->instr, 0x10, 0x1, 0x53);
      break;
    case ASM_FSGNJX:
      assemble_rtype(&v->instr, 0x10, 0x2, 0x53);
      break;
    case ASM_FSQRT:
      assemble_rtype(&v->instr, 0x2C, 0x7, 0x53);
      break;
    case ASM_FEQ:
      assemble_rtype(&v->instr, 0x50, 0x2, 0x53);
      break;
    case ASM_FLT:
      assemble_rtype(&v->instr, 0x50, 0x1, 0x53);
      break;
    case ASM_FLE:
      assemble_rtype(&v->instr, 0x50, 0x0, 0x53);
      break;
    case ASM_FCLASS:
      assemble_rtype(&v->instr, 0x70, 0x1, 0x53);
      break;
    case ASM_FMVXS:
      assemble_rtype(&v->instr, 0x70, 0x0, 0x53);
      break;
    case ASM_FMVSX:
      assemble_rtype(&v->instr, 0x78, 0x0, 0x53);
      break;
    case ASM_FCVTWS:
      assemble_rtype(&v->instr, 0x60, 0x7, 0x53);
      break;
    case ASM_FCVTSW:
      assemble_rtype(&v->instr, 0x68, 0x7, 0x53);
      break;
    case ASM_SUB:
      assemble_rtype(&v->instr, 0x20, 0x0, 0x33);
      break;
    case ASM_XOR:
      assemble_rtype(&v->instr, 0x0, 0x4, 0x33);
      break;
    case ASM_OR:
      assemble_rtype(&v->instr, 0x0, 0x6, 0x33);
      break;
    case ASM_AND:
      assemble_rtype(&v->instr, 0x0, 0x7, 0x33);
      break;
    case ASM_SLL:
      assemble_rtype(&v->instr, 0x0, 0x1, 0x33);
      break;
    case ASM_SRL:
      assemble_rtype(&v->instr, 0x0, 0x5, 0x33);
      break;
    case ASM_SRA:
      assemble_rtype(&v->instr, 0x20, 0x5, 0x33);
      break;
    case ASM_SLT:
      assemble_rtype(&v->instr, 0x0, 0x2, 0x33);
      break;
    case ASM_SLTU:
      assemble_rtype(&v->instr, 0x0, 0x3, 0x33);
      break;
    case ASM_ADDI:
      assemble_itype(&v->instr, 0x0, 0x13);
      break;
    case ASM_XORI:
      assemble_itype(&v->instr, 0x4, 0x13);
      break;;
    case ASM_ORI:
      assemble_itype(&v->instr, 0x6, 0x13);
      break;
    case ASM_ANDI:
      assemble_itype(&v->instr, 0x7, 0x13);
      break;
    case ASM_SLTI:
      assemble_itype(&v->instr, 0x2, 0x13);
      break;
    case ASM_SLTIU:
      assemble_itype(&v->instr, 0x3, 0x13);
      break;
    case ASM_SLLI:
      assemble_itype_shift(&v->instr, 0x1, 0x0);
      break;
    case ASM_SRLI:
      assemble_itype_shift(&v->instr, 0x5, 0x0);
      break;
    case ASM_SRAI:
      assemble_itype_shift(&v->instr, 0x5, 0x8);
      break;
    case ASM_LB:
      assemble_itype_load(&v->instr, 0x0, false);
      break;
    case ASM_LH:
      assemble_itype_load(&v->instr, 0x1, false);
      break;
    case ASM_LW:
      assemble_itype_load(&v->instr, 0x2, false);
      break;
    case ASM_FLW:
      assemble_itype_load(&v->instr, 0x2, true);
      break;
    case ASM_LBU:
      assemble_itype_load(&v->instr, 0x4, false);
      break;
    case ASM_LHU:
      assemble_itype_load(&v->instr, 0x5, false);
      break;
    case ASM_SB:
      assemble_stype(&v->instr, 0x0, false);
      break;  
    case ASM_SH:
      assemble_stype(&v->instr, 0x1, false);
      break;
    case ASM_SW:
      assemble_stype(&v->instr, 0x2, false);
      break;
    case ASM_FSW:
      assemble_stype(&v->instr, 0x2, true);
      break;
    case ASM_BEQ:
      assemble_sbtype(&v->instr, 0x0);
      break;
    case ASM_BNE:
      assemble_sbtype(&v->instr, 0x1);
      break;
    case ASM_BLT:
      assemble_sbtype(&v->instr, 0x4);
      break;
    case ASM_BGE:
      assemble_sbtype(&v->instr, 0x5);
      break;
    case ASM_BLTU:
      assemble_sbtype(&v->instr, 0x6);
      break;
    case ASM_BGEU:
      assemble_sbtype(&v->instr, 0x7);
      break;
    case ASM_JAL:
      assemble_jtype(&v->instr);
      break;
    case ASM_JALR:
      assemble_itype(&v->instr, 0x0, 0x67);
      break;
    case ASM_LUI:
      assemble_utype(&v->instr, 0x37);
      break;
    case ASM_AUIPC:
      assemble_utype(&v->instr, 0x17);
      break;
    case ASM_CSRRW:
      assemble_csrtype(&v->instr, 0x1);
      break;
    case ASM_CSRRS:
      assemble_csrtype(&v->instr, 0x2);
      break;
    case ASM_CSRRC:
      assemble_csrtype(&v->instr, 0x3);
      break;
    case ASM_CSRRWI:
      assemble_csritype(&v->instr, 0x5);
      break;
    case ASM_CSRRSI:
      assemble_csritype(&v->instr, 0x6);
      break;
    case ASM_CSRRCI:
      assemble_csritype(&v->instr, 0x7);
      break;
    case ASM_EBREAK:
      su32(0x100073);
      break;
    case ASM_MUL:
      assemble_rtype(&v->instr, 0x1, 0x0, 0x33);
      break;
    case ASM_MULH:
      assemble_rtype(&v->instr, 0x1, 0x1, 0x33);
      break;
    case ASM_MULHSU:
      assemble_rtype(&v->instr, 0x1, 0x2, 0x33);
      break;
    case ASM_MULHU:
      assemble_rtype(&v->instr, 0x1, 0x3, 0x33);
      break;
    case ASM_DIV:
      assemble_rtype(&v->instr, 0x1, 0x4, 0x33);
      break;
    case ASM_DIVU:
      assemble_rtype(&v->instr, 0x1, 0x5, 0x33);
      break;
    case ASM_REM:
      assemble_rtype(&v->instr, 0x1, 0x6, 0x33);
      break;
    case ASM_REMU:
      assemble_rtype(&v->instr, 0x1, 0x7, 0x33);
      break;
    default:
      lfatal("assemble: unexpected kind: %d", v->kind);
    }
  }
}

static void addtosymtab(Symbol *sym) {
  Elf32_Sym elfsym;
  int stype;
  int sbind;

  stype = 0;
  if (sym->defined) {
    sbind = sym->global ? STB_GLOBAL : STB_LOCAL;
  } else {
    sbind = STB_GLOBAL;
  }

  sym->idx = symtab->hdr.sh_size / symtab->hdr.sh_entsize;

  elfsym.st_name = elfstr(strtab, sym->name);
  elfsym.st_value = sym->offset;
  elfsym.st_size = sym->size;
  elfsym.st_info = ELF32_ST_INFO(sbind, stype);
  elfsym.st_shndx = sym->section ? sym->section->idx : SHN_UNDEF;
  elfsym.st_other = 0;
  secaddbytes(symtab, &elfsym, sizeof(Elf32_Sym));
}

static void fillsymtab(void) {
  Symbol *sym, *symb;
  Elf32_Sym *elfsym;
  size_t i;
  int l;
  struct hashtablekey htk;

  // Local symbols
  for (i = 0; i < symbols->cap; i++) {
    if (!symbols->keys[i].str)
      continue;
    sym = symbols->vals[i];
    if (!sym->defined || sym->global)
      continue;
    addtosymtab(sym);
  }

  // Global symbols

  // Set start of global symbols.
  symtab->hdr.sh_info = symtab->hdr.sh_size / symtab->hdr.sh_entsize;
  for (i = 0; i < symbols->cap; i++) {
    if (!symbols->keys[i].str)
      continue;
    sym = symbols->vals[i];
    if (sym->defined && !sym->global)
      continue;
    addtosymtab(sym);
  }

  for (i = 0; i < symbols->cap; i++) {
    if (!symbols->keys[i].str)
      continue;
    sym = symbols->vals[i];
    if (sym->defined && !sym->global)
      continue;
    l = strlen(sym->name);
    if(l>3 && (strcmp(&sym->name[l-4], "_end") == 0)) {
        htabkey(&htk, sym->name, l-4);
        symb = (Symbol*)htabget(symbols, &htk);
        elfsym = (Elf32_Sym *) (symtab->data + symb->idx*symtab->hdr.sh_entsize);
        elfsym->st_size =  sym->offset - symb->offset;
    }
  }
}

static int resolvereloc(Relocation *reloc) {
  Symbol *sym;
  uint32_t *rdata;
  int64_t value;
  static int32_t hi20_reloc_offset;
  static int32_t hi20_reloc_add;
  static int32_t hi20_sym_offset;
  static uint8_t hi20valid = 0;
  sym = reloc->sym;

  if (sym->section != reloc->section || reloc->section == data)
    return 0;

  switch (reloc->type) {
  case R_RISCV_BRANCH:
    rdata = (uint32_t *)&reloc->section->data[reloc->offset];
    *rdata = *rdata | encbsimm(sym->offset - reloc->offset + reloc->addend);
    return 1;
  case R_RISCV_PCREL_HI20:
    if(sym->global) return 0;
    rdata = (uint32_t *)&reloc->section->data[reloc->offset];
    *rdata = *rdata | enchi20(sym->offset - reloc->offset + reloc->addend);
    hi20_reloc_offset = reloc->offset;
    hi20_sym_offset = sym->offset;
    hi20_reloc_add = reloc->addend;
    hi20valid = 1;
    return 1;
  case R_RISCV_PCREL_LO12_I:
    if(sym->global) return 0;
    if(!hi20valid) return 0;
    rdata = (uint32_t *)&reloc->section->data[reloc->offset];
    *rdata = *rdata | enci12(hi20_sym_offset - hi20_reloc_offset + hi20_reloc_add);
    hi20valid = 0;
    return 1;
  case R_RISCV_PCREL_LO12_S:
    if(sym->global) return 0;
    if(!hi20valid) return 0;
    rdata = (uint32_t *)&reloc->section->data[reloc->offset];
    *rdata = *rdata | encs12(hi20_sym_offset - hi20_reloc_offset +  hi20_reloc_add);
    hi20valid = 0;
    return 1;
  case R_RISCV_JAL:
    rdata = (uint32_t *)&reloc->section->data[reloc->offset];
    *rdata = *rdata | encj(sym->offset - reloc->offset + reloc->addend);
    return 1;
  case R_RISCV_32:
    if(sym->global) return 0;
    rdata = (uint32_t *)&reloc->section->data[reloc->offset];
    *rdata = *rdata | (sym->offset + reloc->addend);
    return 1;
  default:
    unreachable();
    return 0;
  }
}

static void appendreloc(Relocation *reloc) {
  Symbol *sym;
  Section *relsection;
  Elf32_Rela elfrel;

  memset(&elfrel, 0, sizeof(elfrel));

  sym = reloc->sym;
  if (reloc->section == text)
    relsection = textrel;
  else if (reloc->section == data)
    relsection = datarel;
  else {
    fatal("unexpected relocation for symbol '%s'", sym->name);
    return;
  }

  switch (reloc->type) {
  case R_RISCV_PCREL_LO12_I:
  case R_RISCV_PCREL_LO12_S:
  case R_RISCV_PCREL_HI20:
  case R_RISCV_BRANCH:
  case R_RISCV_JAL:
  case R_RISCV_32:
    elfrel.r_info = ELF32_R_INFO(sym->idx, reloc->type);
    elfrel.r_offset = reloc->offset;
    elfrel.r_addend = reloc->addend;
    break;
  default:
    unreachable();
  }

  secaddbytes(relsection, &elfrel, sizeof(elfrel));
}

static void handlerelocs(void) {
  Relocation *reloc;
  size_t i;
  for (i = 0; i < nrelocs; i++) {
    reloc = &relocs[i];
    if (resolvereloc(reloc))
      continue;
    appendreloc(reloc);
  }
}



static int checkrelocs(void) {
  Relocation *reloc;
  Symbol *sym;
  int i;
  fixrelno = 0;
  for (i = 0; i < nrelocs; i++) {
    reloc = &relocs[i];
    sym = reloc->sym;
    if(reloc->type == R_RISCV_BRANCH) {
        if(!insrange(13, sym->offset - reloc->offset + reloc->addend))
            fixrelarr[fixrelno++] = i;
    }
  }
  return fixrelno ? 1 : 0;
}


static void out(const void *buf, size_t n) {
  fwrite(buf, 1, n, stdout);
  if (ferror(stdout))
    fatal("fwrite:");
}

static void outelf(void) {
  size_t i;
  uint64_t offset;
  Elf32_Ehdr ehdr;

  memset(&ehdr, 0, sizeof(ehdr));
  ehdr.e_ident[0] = 0x7f;
  ehdr.e_ident[1] = 'E';
  ehdr.e_ident[2] = 'L';
  ehdr.e_ident[3] = 'F';
  ehdr.e_ident[4] = ELFCLASS32;
  ehdr.e_ident[5] = ELFDATA2LSB;
  ehdr.e_ident[6] = 1;
  ehdr.e_type = ET_REL;
  ehdr.e_machine = EM_RISCV;
  ehdr.e_flags = 0;
  ehdr.e_version = 1;
  ehdr.e_ehsize = sizeof(Elf32_Ehdr);
  ehdr.e_shoff = sizeof(Elf32_Ehdr);
  ehdr.e_shentsize = sizeof(Elf32_Shdr);
  ehdr.e_shnum = nsections;
  ehdr.e_shstrndx = 1;

  out(&ehdr, sizeof(ehdr));
  offset = sizeof(Elf32_Ehdr) + sizeof(Elf32_Shdr) * nsections;

  for (i = 0; i < nsections; i++) {
    sections[i].hdr.sh_offset = offset;
    out(&sections[i].hdr, sizeof(Elf32_Shdr));
    if (sections[i].hdr.sh_type == SHT_NOBITS)
      continue;
    offset += sections[i].hdr.sh_size;
  }
  for (i = 0; i < nsections; i++) {
    if (sections[i].hdr.sh_type == SHT_NOBITS)
      continue;
    out(sections[i].data, sections[i].hdr.sh_size);
  }
  if (fflush(stdout) != 0)
    fatal("fflush:");
}

static void usage(char *argv0) {
  fprintf(stderr, "minias - a mini assembler.");
  fprintf(stderr, "usage: %s [-o out] [input]\n", argv0);
  exit(2);
}

static void parseargs(int argc, char *argv[]) {
  char *a, *argv0, *outfname;

  argv0 = argv[0];

  for (++argv; *argv; argv++) {
    if (argv[0][0] != '-')
      break;
    for (a = &argv[0][1]; *a; a++) {
      switch (*a) {
      case '-':
      case 'h':
        usage(argv0);
        break;
      case 'o':
        if (argv[1] == NULL)
          usage(argv0);
        outfname = *++argv;
        if (!freopen(outfname, "w", stdout))
          fatal("unable to open %s:", outfname);
        break;
      default:
        usage(argv0);
      }
    }
  }

  if (argv[0]) {
    if (argv[1])
      usage(argv0);
    infilename = argv[0];
    if (!freopen(infilename, "r", stdin))
      fatal("unable to open %s:", infilename);
  }
}

int main(int argc, char *argv[]) {
    fixrelno = 0;
start:
    resglobs();
    fixrelarr[fixrelno]=-1;
    symbols = mkhtab(256);
    parseargs(argc, argv);
    allasm = parseasm();
    initsections();
    assemble();
    if(checkrelocs()) goto start;
    fillsymtab();
    handlerelocs();
    outelf();
    return 0;
}
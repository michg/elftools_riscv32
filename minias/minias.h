#include <assert.h>
#include <ctype.h>
#include <elf.h>
#include <errno.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define ELF_RELOC(name, value) name = value, 
enum {
  #include "riscv.def" 
};

typedef struct {
  Elf32_Shdr hdr;
  int16_t idx;
  int64_t wco;
  int64_t offset;
  size_t capacity;
  uint8_t *data;
} Section;

typedef struct {
  const char *name;
  int32_t idx;
  int64_t offset;
  int64_t size;
  int global;
  int defined;
  Section *section;
} Symbol;

typedef struct {
  Section *section;
  Symbol *sym;
  int type;
  int64_t offset;
  int64_t addend;
} Relocation;

typedef enum {
  // Misc
  ASM_SYNTAX_ERROR,
  ASM_BLANK,
  ASM_LABEL,
  ASM_IMM,
  ASM_STRING,
  ASM_MEMARG,
  // Directives
  ASM_DIR_GLOBL,
  ASM_DIR_SECTION,
  ASM_DIR_ASCII,
  ASM_DIR_ASCIIZ,
  ASM_DIR_DATA,
  ASM_DIR_TEXT,
  ASM_DIR_BSS,
  ASM_DIR_FILL,
  ASM_DIR_BYTE,
  ASM_DIR_SHORT,
  ASM_DIR_INT,
  ASM_DIR_WORD,
  ASM_DIR_QUAD,
  ASM_DIR_BALIGN,
  // Instructions
  ASM_NOP,
  ASM_RET,
  ASM_ADD,
  ASM_AND,
  ASM_MOV,
  ASM_NEG,
  ASM_OR,
  ASM_SLL,
  ASM_SRL,
  ASM_SRA,
  ASM_SLT,
  ASM_SLTU,
  ASM_ADDI,
  ASM_XORI,
  ASM_ORI,
  ASM_ANDI,
  ASM_SLLI,
  ASM_SRLI,
  ASM_SRAI,
  ASM_SLTI,
  ASM_SLTIU,
  ASM_LB,
  ASM_LH,
  ASM_LW,
  ASM_LBU,
  ASM_LHU,
  ASM_SB,
  ASM_SH,
  ASM_SW,
  ASM_BEQ,
  ASM_BNE,
  ASM_BLT,
  ASM_BGE,
  ASM_BLTU,
  ASM_BGEU,
  ASM_JAL,
  ASM_JALR,
  ASM_SUB,
  ASM_XOR,
  ASM_LUI,
  ASM_AUIPC,
  ASM_CSRRW,
  ASM_CSRRS,
  ASM_CSRRC,
  ASM_CSRRWI,
  ASM_CSRRSI,
  ASM_CSRRCI,
  ASM_EBREAK,
  ASM_MUL,
  ASM_MULH,
  ASM_MULHSU,
  ASM_MULHU,
  ASM_DIV,
  ASM_DIVU,
  ASM_REM,
  ASM_REMU,
  // Registers, order matters.
  ASM_REG_BEGIN,
  ASM_R0,
  ASM_R1,
  ASM_R2,
  ASM_R3,
  ASM_R4,
  ASM_R5,
  ASM_R6,
  ASM_R7,
  ASM_R8,
  ASM_R9,
  ASM_R10,
  ASM_R11,
  ASM_R12,
  ASM_R13,
  ASM_R14,
  ASM_R15,
  ASM_R16,
  ASM_R17,
  ASM_R18,
  ASM_R19,
  ASM_R20,
  ASM_R21,
  ASM_R22,
  ASM_R23,
  ASM_R24,
  ASM_R25,
  ASM_R26,
  ASM_R27,
  ASM_R28,
  ASM_R29,
  ASM_R30,
  ASM_R31,
  
  /* RIP is in a special class of its own. */
  ASM_RIP,
  ASM_NO_REG,

  ASM_REG_END,
} AsmKind;

typedef union Parsev Parsev;

typedef struct Label {
  AsmKind kind;
  const char *name;
} Label;

typedef struct Globl {
  AsmKind kind;
  const char *name;
} Globl;

typedef struct DirSection {
  AsmKind kind;
  int32_t type;
  const char *name;
  const char *flags;
} DirSection;

typedef struct {
  int64_t c;
  const char *l;
} Value;

typedef struct Byte {
  AsmKind kind;
  Value value;
} Byte;

typedef struct Short {
  AsmKind kind;
  Value value;
} Short;

typedef struct Int {
  AsmKind kind;
  Value value;
} Int;

typedef struct Quad {
  AsmKind kind;
  Value value;
} Quad;

typedef struct Balign {
  AsmKind kind;
  uint64_t align;
} Balign;

typedef struct Fill {
  AsmKind kind;
  int32_t size;
  int32_t repeat;
  int64_t value;
} Fill;

typedef struct Imm {
  AsmKind kind;
  uint32_t nbytes;
  Value v;
} Imm;

typedef struct Memarg {
  AsmKind kind;
  AsmKind base;
  AsmKind index;
  uint32_t scale;
  Value disp;
} Memarg;

typedef struct String {
  AsmKind kind;
  size_t len;
  uint8_t *data;
} String;
typedef String Ascii;
typedef String Asciiz;

typedef struct Call {
  AsmKind kind;
  uint32_t indirect;
  union {
    const Parsev *indirect;
    Value direct;
  } target;
} Call;

typedef struct Jmp {
  AsmKind kind;
  uint32_t variant;
  const char *target;
} Jmp;

typedef struct Instr {
  AsmKind kind;
  uint32_t variant;
  const Parsev *arg1;
  const Parsev *arg2;
  const Parsev *arg3;
} Instr;

union Parsev {
  AsmKind kind;
  Label label;
  Globl globl;
  DirSection section;
  Balign balign;
  Ascii ascii;
  Asciiz asciiz;
  Memarg memarg;
  Instr instr;
  Call call;
  Jmp jmp;
  Fill fill;
  Byte dirbyte;
  Short dirshort;
  Int dirint;
  Quad dirquad;
  Imm imm;
  String string;
  // Temporary values.
  Value value;
  const char *charptr;
  int64_t i64;
};

/* parse.c */

typedef struct AsmLine AsmLine;
struct AsmLine {
  int64_t lineno;
  const Parsev *v;
  AsmLine *next;
};

AsmLine *parseasm(void);

/* util.c */

void vwarn(const char *fmt, va_list ap);
void fatal(const char *fmt, ...);
void unreachable(void);

void *xmalloc(size_t);
void *xrealloc(void *, size_t);
void *xreallocarray(void *, size_t, size_t);
char *xmemdup(const char *, size_t);
char *xstrdup(const char *s);
void *zalloc(size_t n);

struct hashtable {
  size_t len, cap;
  struct hashtablekey *keys;
  void **vals;
};

struct hashtablekey {
  uint64_t hash;
  const char *str;
  size_t len;
};

void htabkey(struct hashtablekey *, const char *, size_t);
struct hashtable *mkhtab(size_t);
void delhtab(struct hashtable *, void(void *));
void **htabput(struct hashtable *, struct hashtablekey *);
void *htabget(struct hashtable *, struct hashtablekey *);
uint64_t murmurhash64a(const void *, size_t);
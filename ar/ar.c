#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h> 
#include <elf.h>

#define Elf_Phdr	Elf32_Phdr
#define Elf_Ehdr	Elf32_Ehdr
#define Elf_Shdr	Elf32_Shdr
#define Elf_Sym	    Elf32_Sym
 
typedef uint8_t  u8;
typedef  int8_t  i8;
typedef uint16_t u16;
typedef  int16_t i16;
typedef uint32_t u32;
typedef  int32_t i32;
typedef uint64_t u64;
typedef  int64_t i64; 
static u32 symtabofs[16384];

#define AR_GLOBAL_HEADER "!<arch>\n"

typedef struct ArFileHeader
{
	char name[16];
	char modification_timestamp_decimal[12];
	char owner_id_decimal[6];
	char group_id_decimal[6];
	char mode_octal[8];
	char size_bytes_decimal[10];
	char magic[2];
} __attribute__((packed)) ArFileHeader; 

static Elf_Ehdr *ehdr;
static Elf_Shdr *shdr;
static Elf_Sym *syms;
static int nsyms;
static char *symstr;

static void init_data(void *mem)
{
	int i;
	ehdr = mem;
	shdr = ehdr->e_shnum ? mem + ehdr->e_shoff : NULL;

	for (i = 0; i < ehdr->e_shnum; i++) {
		if (shdr[i].sh_type == SHT_SYMTAB) {
			syms = mem + shdr[i].sh_offset;
			nsyms = shdr[i].sh_size / sizeof(syms[0]);
			symstr = mem + shdr[shdr[i].sh_link].sh_offset;
		}
	}
}

static long get_fsize(FILE *f) {
    long file_size, curpos;
    curpos = ftell(f);
    fseek(f, 0, SEEK_END);
    file_size = ftell(f);
    fseek(f, curpos, SEEK_SET);
    return file_size;
}

static void wr32be(FILE *f, uint32_t w) {
   w = ( w >> 24 ) | (( w << 8) & 0x00ff0000 )| ((w >> 8) & 0x0000ff00) | ( w << 24); 
   fwrite(&w, 4, 1, f);
}

static long write_header(FILE* fo, char* name, long file_size) {
    ArFileHeader file_header;
    long pad = 0;
    if (ftell(fo) % 2 == 1) {
			fseek(fo, 1, SEEK_CUR);
			pad = 1;
    }
    memset(&file_header, ' ', sizeof file_header);
    u32 n = snprintf(file_header.name,
					sizeof file_header.name + 1,
					"%s/", name);
		file_header.name[n] = ' ';
		
		file_header.modification_timestamp_decimal[0] = '0';
		file_header.owner_id_decimal[0] = '0';
		file_header.group_id_decimal[0] = '0';
		file_header.mode_octal[0] = '6';
		file_header.mode_octal[1] = '4';
		file_header.mode_octal[2] = '4';
		n = snprintf(file_header.size_bytes_decimal,
				sizeof file_header.size_bytes_decimal + 1,
				"%ld", file_size);
		file_header.size_bytes_decimal[n] = ' ';
		file_header.magic[0] = '\x60';
		file_header.magic[1] = '\x0A';
		fwrite(&file_header, 1, sizeof file_header, fo);
		return pad;
}

 
int main(int argc, char *argv[])
{
	if (argc < 3) {
		fprintf(stderr, "Usage: %s -rcs <archive name> <input files>...\n", argv[0]);
		return 1;
	}
	if (strcmp(argv[1], "-rcs")) {
		fprintf(stderr, "Sorry, we only support '-rcs' at the moment, not '%s'\n",
				argv[1]);
		return 2;
	}

	char *ar_filename = argv[2];
	int input_files_start = 3;
	char *buf;
	char *name;
	int i, j, symno = 0;
	long arfpos = 0;
	long file_size, sym_size, str_size, obj_size, pad_size;
	FILE *obj_file = tmpfile();
	FILE *str_file = tmpfile();
		
	for (i = input_files_start; i < argc; i++) {
		char *input_filename = argv[i];
		char *fbname = strrchr(input_filename, '/');
		if (!fbname) fbname = input_filename;
		 else fbname++;
		  
		FILE *input_file = fopen(input_filename, "rb");

		file_size = get_fsize(input_file);
        pad_size = write_header(obj_file, fbname, file_size);
		buf = malloc(file_size); 
        fread(buf, 1, file_size, input_file);
        init_data(buf);
        for (j = 0; j < nsyms; j++) {
            name =symstr + syms[j].st_name;   	   
            if(syms[j].st_shndx != SHN_UNDEF && syms[j].st_info != STB_LOCAL) {
                fwrite(name, 1, strlen(name) + 1, str_file);
                symtabofs[symno] = arfpos + pad_size;
                symno++;
            }
	    } 
        fwrite(buf, 1, file_size, obj_file);
        arfpos += file_size + sizeof(ArFileHeader) + pad_size;
        free(buf);
		fclose(input_file);
	}
	FILE *ar_file = fopen(ar_filename, "wb");
	fwrite(AR_GLOBAL_HEADER, sizeof AR_GLOBAL_HEADER - 1, 1, ar_file);
    if (ftell(str_file) % 2 == 1) {
			fputc(0, str_file);
	}
    fflush(str_file);
    str_size = get_fsize(str_file);
    sym_size = str_size + 4*(symno + 1);
    write_header(ar_file, "", sym_size);  
    wr32be(ar_file, symno);
    for(i = 0; i < symno; i++) 
        wr32be(ar_file, symtabofs[i] + sym_size + sizeof(ArFileHeader) + sizeof(AR_GLOBAL_HEADER) - 1);
    buf = malloc(str_size);
    
    fseek(str_file, 0, SEEK_SET);
    fread(buf, 1, str_size, str_file);
    fwrite(buf, 1, str_size, ar_file);
    fclose(str_file);
    free(buf);
    obj_size = get_fsize(obj_file);
    buf = malloc(obj_size);
    fseek(obj_file, 0, SEEK_SET);
    fread(buf, 1, obj_size, obj_file);
    fclose(obj_file);
    fwrite(buf, 1, obj_size, ar_file);
    free(buf);
    fclose(ar_file);
    
	return 0;
}


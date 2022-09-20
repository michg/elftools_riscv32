.POSIX:
.PHONY: all clean

CFLAGS+=-D _GNU_SOURCE

-include config.mk

OBJ=\
	main.o\
	parse.o\
	util.o

all: minias

bootstrap-minipeg: minipeg.c
	$(CC) $(CFLAGS) -o $@ minipeg.c

peg.c: peg.peg bootstrap-minipeg
	./bootstrap-minipeg -o $@ peg.peg

minipeg: compile.o tree.o peg.o
	$(CC) $(CFLAGS) -o $@ compile.o tree.o peg.o

minias: $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $(OBJ)

asm.peg.inc: asm.peg minipeg
	./minipeg -o $@ asm.peg

compile.o tree.o peg.o: tree.h version.h
parse.o: asm.peg.inc
main.o parse.o util.o: minias.h

fmt:
	clang-format -i *.c *.h

check:
	sh test/test.sh

clean:
	rm -f $(OBJ)  minias minipeg bootstrap-minipeg asm.peg.inc

CC = cc
AS = ../minias/minias
CFLAGS = -I. -Wall -O2
LDFLAGS =

all: bss_start.h bss_fin.h nld
.c.o:
	$(CC) -c $(CFLAGS) $<
bss_start.h: bss_start.s
	$(AS) -o bss_start.o bss_start.s
	python mkinc.py bss_start
bss_fin.h: bss_fin.s
	$(AS) -o bss_fin.o bss_fin.s
	python mkinc.py bss_fin
nld: nld.o
	$(CC) $(LDFLAGS) -o $@ $^
clean:
	rm -f nld *.o

CC = cc
CFLAGS = -I. -Wall -O2
LDFLAGS =

all: nld
.c.o:
	$(CC) -c $(CFLAGS) $<
nld: nld.o
	$(CC) $(LDFLAGS) -o $@ $^
clean:
	rm -f nld *.o

CC = cc
CFLAGS = -I. -Wall -O2
LDFLAGS =

all: ar
.c.o:
	$(CC) -c $(CFLAGS) $<
ar: ar.o
	$(CC) $(LDFLAGS) -o $@ $^
clean:
	rm -f ar *.o

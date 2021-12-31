RESDIR = result
SRCDIR = src
AS = ../../minias/minias
AR = ../../ar/ar
LD = ../../neatld/nld

LSRC = $(SRCDIR)/loader.s $(SRCDIR)/sdmm.s $(SRCDIR)/ff.s
LOBJ = $(RESDIR)/loader.o $(RESDIR)/sdmm.o $(RESDIR)/ff.o

SRC = $(SRCDIR)/start.s $(SRCDIR)/xprintf.s
OBJ = $(RESDIR)/start.o $(RESDIR)/xprintf.o

LIB =  $(RESDIR)/sd.a 
BIN = $(RESDIR)/firmware.bin

.PHONY:		all

.PRECIOUS: $(RESDIR)/%.s

all: $(RESDIR) $(LIB) $(BIN)

$(RESDIR):
	mkdir -p $@

$(RESDIR)/%.o:$(SRCDIR)/%.s
	$(AS) -o $@ $<

$(LIB):$(LOBJ)
	$(AR) -rcs $@ $^

$(BIN):$(OBJ) $(LIB)
	$(LD) -s -e -p -mc=0 -o $@ $(OBJ) $(LIB)
	python3 mkhex.py $(RESDIR)/firmware
	 
clean:
	rm -f -r $(RESDIR)

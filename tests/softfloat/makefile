RESDIR = result
AS = ../../minias/minias
AR = ../../ar/ar
LD = ../../neatld/nld

LIBS = $(RESDIR)/libfloat.a $(RESDIR)/libmathsf.a

ASRCS = start.s bsp.s main.s es.s
OSRCS = start.o bsp.o main.o es.o
OBJS = $(addprefix $(RESDIR)/, $(OSRCS))
BIN = $(RESDIR)/firmware.bin

.PHONY:		all

.PRECIOUS: $(RESDIR)/%.s

all: $(RESDIR) $(LIBS) $(BIN)

$(LIBS):
	make -r -C libfloat
	make -r -C libmath
    
$(RESDIR):
	mkdir -p $@ 

$(RESDIR)/%.o:%.s
	$(AS) -o $@ $<

$(RESDIR)/%.o:%.s
	$(AS) -o $@ $<

$(BIN):$(OBJS)
	$(LD) -ns -ne -p -mc=0 -o $@ $^ $(RESDIR)/libmath.a $(RESDIR)/softfloat.a
	python3 mkhex.py $(RESDIR)/firmware
	 
clean:
	rm -f -r $(RESDIR)

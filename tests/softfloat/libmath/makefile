#
# Makefile for Libs
RESDIR = ../result
AS = ../../../minias/minias
AR = ../../../ar/ar



CSRCS = $(wildcard *.c)
ASRCS = $(patsubst %.c,%.s,$(CSRCS))
OSRCS = $(patsubst %.c,%.o,$(CSRCS))
OBJS = $(addprefix $(RESDIR)/, $(OSRCS)) 
BIN = $(RESDIR)/libmath.a

.PHONY:		all

.PRECIOUS: %.s

all:		$(BIN)

$(RESDIR)/%.o:%.s
	$(AS) -o $@ $<

$(BIN):$(OBJS)
	$(AR) -rcs $@ $^

clean:
		rm -f *~ $(OBJS) $(BIN)

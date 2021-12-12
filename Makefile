#
# Makefile for building the assembler and linker
#

DIRS = minias neatld

.PHONY:		all clean

all:
		for i in $(DIRS) ; do \
		  $(MAKE) -C $$i all ; \
		done

clean:
		for i in $(DIRS) ; do \
		  $(MAKE) -C $$i clean ; \
		done
		rm -f *~

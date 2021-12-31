

all: Vsystem

obj_dir/Vsystem.mk:
	verilator  -cc  --trace --exe tb.cpp picorv32.v system.v --Wno-lint --Wno-unoptflat --Wno-combdly --Wno-redefmacro --top-module system --o Vsystem --Mdir obj_dir

Vsystem: obj_dir/Vsystem.mk
	make -C obj_dir -f Vsystem.mk
	cp obj_dir/Vsystem ../result

clean:
	rm -rf obj_dir
	rm -f Vsystem


### Tiny assembler and static linker for elf32-riscv
The assembler is based on [minias](https://github.com/andrewchambers/minias), the linker on  [neatld](https://github.com/aligrudi/neatld).

##### Prequisites:
* for minias  [peg/leg](https://www.piumarta.com/software/peg/) installation is needed
* for testcase fatfs [verilator](https://www.veripool.org/wiki/verilator) is necessary  

##### Building minias and nld:      

>make

##### Running the testcases:      
single instruction testcases:  

>cd tests/ins  
>./test_ins.sh  

Results including a summary of the results will be in ./result.  

FatFs testcase:  
> cd tests/fatfs
>
> Build the firmware:     
> ./mkfw.sh  
>
> Build the verilator simulation:
> cd verilator
> ./buildsim.sh
>
> Execute the simulation:
> cd ../result
> ./vsystem


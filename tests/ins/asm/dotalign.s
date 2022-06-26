.text
.globl _start
_start:
xori x3, x2, 10
.data
.balign 1
.ascii "greets.txt" 
.balign 8
.globl dat
dat:
.quad 536870912 
.text
addi x3, x2, 10


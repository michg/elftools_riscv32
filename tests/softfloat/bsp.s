	.align 4
	.text
	.align 4
	.data
	.globl uart1
	.align	4
uart1:
	.word	0x20000000
	.globl bsp_putc
	.align 4
	.text
	.align	4
bsp_putc:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	la x30,uart1
	lw x30,0(x30)
	slli x29,x12,8*(4-1)
	srai x29,x29,8*(4-1)
	sw x29,0(x30)
L.1:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align 4

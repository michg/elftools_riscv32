	.align 4
	.text
	.globl _xpoly
	.align	4
_xpoly:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	mv x26,x13
	sw x14,24(x8)
	li x30,2
	sll x30,x27,x30
	add x26,x30,x26
	addi x30,x26,0
	li x29,-4
	add x26,x30,x29
	lw x25,0(x30)
	jal x0,L.9
L.8:
	addi x30,x26,0
	sw x30,-8+16(x8)
	li x29,-4
	add x26,x30,x29
	lw x12,8+16(x8)
	addi x13,x25,0
	jal x1,float32_mul
	addi x30,x10,0
	lw x29,-8+16(x8)
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x25,x10,0
L.9:
	addi x30,x27,0
	addi x27,x30,-1
	bgt x30,x0,L.8
	addi x10,x25,0
L.7:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align 4

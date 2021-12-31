	.align 4
	.text
	.globl tanh
	.align	4
tanh:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	addi x12,x27,0
	jal x1,float32_is_nan
	beq x10,x0,L.8
	la x30,errno
	li x29,33
	sw x29,0(x30)
	addi x10,x27,0
	jal x0,L.7
L.8:
	addi x12,x27,0
	la x30,L.13
	lw x13,0(x30)
	jal x1,float32_gt
	bne x10,x0,L.12
	addi x12,x27,0
	la x30,L.14
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.10
L.12:
	addi x12,x27,0
	la x30,L.18
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.16
	la x30,L.19
	lw x26,0(x30)
	jal x0,L.17
L.16:
	la x30,L.20
	lw x26,0(x30)
L.17:
	addi x10,x26,0
	jal x0,L.7
L.10:
	addi x12,x27,0
	jal x1,sinh
	addi x30,x10,0
	sw x30,-8+16(x8)
	addi x12,x27,0
	jal x1,cosh
	addi x30,x10,0
	lw x29,-8+16(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_div
	addi x30,x10,0
L.7:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.20:
	.word	0xbf800000
	.align	4
L.19:
	.word	0x3f800000
	.align	4
L.18:
	.word	0x0
	.align	4
L.14:
	.word	0xc10aa123
	.align	4
L.13:
	.word	0x410aa123
	.align 4

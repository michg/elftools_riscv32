	.align 4
	.text
	.globl floor
	.align	4
floor:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	lw x12,0+16(x8)
	jal x1,float32_is_nan
	beq x10,x0,L.8
	la x30,errno
	li x29,33
	sw x29,0(x30)
	lw x10,0+16(x8)
	jal x0,L.7
L.8:
	lw x30,0+16(x8)
	sw x30,-8+16(x8)
	addi x12,x30,0
	la x29,_pInfinity
	lw x13,0(x29)
	jal x1,float32_eq
	bne x10,x0,L.12
	lw x30,-8+16(x8)
	addi x12,x30,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.10
L.12:
	lw x10,0+16(x8)
	jal x0,L.7
L.10:
	lw x12,0+16(x8)
	addi x13,x8,0+16
	jal x1,modf
	addi x12,x10,0
	la x30,L.16
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.14
	lw x12,0+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_sub
	addi x30,x10,0
	addi x27,x30,0
	jal x0,L.15
L.14:
	lw x27,0+16(x8)
L.15:
	addi x10,x27,0
L.7:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.17:
	.word	0x3f800000
	.align	4
L.16:
	.word	0x0
	.align 4

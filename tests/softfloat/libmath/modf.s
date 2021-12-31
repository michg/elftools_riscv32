	.align 4
	.text
	.globl modf
	.align	4
modf:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x12,0+16(x8)
	jal x1,float32_is_nan
	beq x10,x0,L.8
	la x30,errno
	li x29,33
	sw x29,0(x30)
	lw x30,4+16(x8)
	lw x29,0+16(x8)
	sw x29,0(x30)
	lw x10,0+16(x8)
	jal x0,L.7
L.8:
	lw x30,0+16(x8)
	sw x30,-12+16(x8)
	addi x12,x30,0
	la x29,_pInfinity
	lw x13,0(x29)
	jal x1,float32_eq
	bne x10,x0,L.12
	lw x30,-12+16(x8)
	addi x12,x30,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.10
L.12:
	lw x30,4+16(x8)
	lw x29,0+16(x8)
	sw x29,0(x30)
	la x30,L.13
	lw x10,0(x30)
	jal x0,L.7
L.10:
	lw x30,0+16(x8)
	sw x30,-16+16(x8)
	addi x12,x30,0
	la x29,L.16
	lw x13,0(x29)
	jal x1,float32_lt
	bne x10,x0,L.14
	lw x30,-16+16(x8)
	addi x12,x30,0
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_gt
	bne x10,x0,L.14
	lw x12,0+16(x8)
	jal x1,float32_to_int32
	addi x30,x10,0
	addi x12,x30,0
	jal x1,int32_to_float32
	lw x29,4+16(x8)
	sw x10,0(x29)
	lw x12,0+16(x8)
	lw x30,4+16(x8)
	lw x13,0(x30)
	jal x1,float32_sub
	addi x30,x10,0
	jal x0,L.7
L.14:
	lw x30,0+16(x8)
	sw x30,-8+16(x8)
	lw x30,-8+16(x8)
	li x29,23
	srl x30,x30,x29
	li x29,255
	and x30,x30,x29
	li x29,127
	sub x30,x30,x29
	addi x27,x30,0
	li x30,24
	blt x27,x30,L.18
	lw x30,4+16(x8)
	lw x29,0+16(x8)
	sw x29,0(x30)
	la x30,L.13
	lw x10,0(x30)
	jal x0,L.7
L.18:
	la x30,L.13
	lw x10,0(x30)
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
	.word	0x4f000000
	.align	4
L.16:
	.word	0xcf000000
	.align	4
L.13:
	.word	0x0
	.align 4

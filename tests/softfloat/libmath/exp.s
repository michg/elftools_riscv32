	.align 4
	.text
	.align 4
	.data
	.align	4
P:
	.word	0x40e6e3a6
	.word	0x3d6c4c6d
	.align	4
Q:
	.word	0x41a68d28
	.word	0x3f800000
	.globl exp
	.align 4
	.text
	.align	4
exp:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	sw x12,32(x8)
	lw x12,0+32(x8)
	jal x1,float32_is_nan
	beq x10,x0,L.8
	la x30,errno
	li x29,33
	sw x29,0(x30)
	lw x10,0+32(x8)
	jal x0,L.7
L.8:
	lw x12,0+32(x8)
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.10
	lw x10,0+32(x8)
	jal x0,L.7
L.10:
	lw x12,0+32(x8)
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.12
	la x30,L.14
	lw x10,0(x30)
	jal x0,L.7
L.12:
	lw x12,0+32(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.15
	la x30,errno
	li x29,34
	sw x29,0(x30)
	la x30,_pInfinity
	lw x10,0(x30)
	jal x0,L.7
L.15:
	lw x12,0+32(x8)
	la x30,L.20
	lw x13,0(x30)
	jal x1,float32_gt
	bne x10,x0,L.18
	la x30,errno
	li x29,34
	sw x29,0(x30)
	la x30,L.14
	lw x10,0(x30)
	jal x0,L.7
L.18:
	la x30,L.21
	lw x12,0(x30)
	lw x13,0+32(x8)
	jal x1,float32_mul
	addi x30,x10,0
	addi x12,x30,0
	addi x13,x8,-8+32
	jal x1,modf
	la x30,L.21
	lw x12,0(x30)
	lw x13,0+32(x8)
	jal x1,float32_mul
	addi x30,x10,0
	addi x12,x30,0
	lw x13,-8+32(x8)
	jal x1,float32_sub
	sw x10,0+32(x8)
	lw x12,0+32(x8)
	la x30,L.14
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.22
	la x30,L.24
	lw x30,0(x30)
	sw x30,-16+32(x8)
	lw x12,0+32(x8)
	addi x13,x30,0
	jal x1,float32_add
	sw x10,0+32(x8)
	lw x12,-8+32(x8)
	lw x30,-16+32(x8)
	addi x13,x30,0
	jal x1,float32_sub
	sw x10,-8+32(x8)
L.22:
	lw x12,0+32(x8)
	la x30,L.27
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.25
	la x30,L.28
	lw x30,0(x30)
	sw x30,-12+32(x8)
	lw x12,0+32(x8)
	la x30,L.27
	lw x13,0(x30)
	jal x1,float32_sub
	sw x10,0+32(x8)
	jal x0,L.26
L.25:
	la x30,L.24
	lw x30,0(x30)
	sw x30,-12+32(x8)
L.26:
	lw x30,0+32(x8)
	sw x30,-16+32(x8)
	addi x12,x30,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x27,x10,0
	addi x12,x27,0
	la x30,Q+4
	lw x13,0(x30)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,Q
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x26,x10,0
	addi x12,x27,0
	la x30,P+4
	lw x13,0(x30)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,P
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-16+32(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	addi x25,x30,0
	addi x12,x26,0
	addi x13,x25,0
	jal x1,float32_add
	addi x30,x10,0
	lw x12,-12+32(x8)
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	sw x30,-20+32(x8)
	addi x12,x26,0
	addi x13,x25,0
	jal x1,float32_sub
	addi x30,x10,0
	lw x29,-20+32(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_div
	addi x30,x10,0
	sw x30,-24+32(x8)
	lw x12,-8+32(x8)
	jal x1,float32_to_int32
	addi x30,x10,0
	lw x29,-24+32(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,ldexp
	addi x30,x10,0
L.7:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.28:
	.word	0x3fb504f3
	.align	4
L.27:
	.word	0x3f000000
	.align	4
L.24:
	.word	0x3f800000
	.align	4
L.21:
	.word	0x3fb8aa3b
	.align	4
L.20:
	.word	0xc2aeac50
	.align	4
L.17:
	.word	0x42b17218
	.align	4
L.14:
	.word	0x0
	.align 4

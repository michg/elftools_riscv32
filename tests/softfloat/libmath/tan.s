	.align 4
	.text
	.align 4
	.data
	.align	4
P:
	.word	0x4353d970
	.word	0xc1487654
	.align	4
Q:
	.word	0x4386de15
	.word	0xc28ed43d
	.word	0x3f800000
	.globl tan
	.align 4
	.text
	.align	4
tan:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
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
	lw x30,0+32(x8)
	sw x30,-12+32(x8)
	addi x12,x30,0
	la x29,_pInfinity
	lw x13,0(x29)
	jal x1,float32_eq
	bne x10,x0,L.12
	lw x30,-12+32(x8)
	addi x12,x30,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.10
L.12:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,L.13
	lw x10,0(x30)
	jal x0,L.7
L.10:
	addi x26,x0,0
	addi x27,x0,0
	lw x12,0+32(x8)
	la x30,L.14
	lw x13,0(x30)
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x30,0
	addi x13,x8,-8+32
	jal x1,modf
	sw x10,0+32(x8)
	lw x12,0+32(x8)
	la x30,L.13
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.15
	lw x12,0+32(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_add
	sw x10,0+32(x8)
L.15:
	lw x12,0+32(x8)
	la x30,L.20
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.18
	addi x26,x26,1
	la x30,L.17
	lw x12,0(x30)
	lw x13,0+32(x8)
	jal x1,float32_sub
	sw x10,0+32(x8)
L.18:
	lw x12,0+32(x8)
	la x30,L.23
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.21
	addi x27,x27,1
	la x30,L.20
	lw x12,0(x30)
	lw x13,0+32(x8)
	jal x1,float32_sub
	sw x10,0+32(x8)
L.21:
	la x30,L.24
	lw x12,0(x30)
	lw x13,0+32(x8)
	jal x1,float32_mul
	sw x10,0+32(x8)
	lw x30,0+32(x8)
	sw x30,-16+32(x8)
	addi x12,x30,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x25,x10,0
	addi x12,x25,0
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
	sw x30,-20+32(x8)
	addi x12,x25,0
	la x29,Q+8
	lw x13,0(x29)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,Q+4
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	addi x12,x25,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,Q
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-20+32(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_div
	sw x10,-8+32(x8)
	beq x27,x0,L.37
	lw x12,-8+32(x8)
	la x30,L.13
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.39
	la x30,errno
	li x29,34
	sw x29,0(x30)
	beq x26,x0,L.42
	la x30,_pInfinity
	lw x12,0(x30)
	jal x1,float32_neg
	addi x30,x10,0
	addi x24,x30,0
	jal x0,L.43
L.42:
	la x30,_pInfinity
	lw x24,0(x30)
L.43:
	addi x10,x24,0
	jal x0,L.7
L.39:
	la x30,L.17
	lw x12,0(x30)
	lw x13,-8+32(x8)
	jal x1,float32_div
	sw x10,-8+32(x8)
L.37:
	beq x26,x0,L.45
	lw x12,-8+32(x8)
	jal x1,float32_neg
	addi x30,x10,0
	addi x24,x30,0
	jal x0,L.46
L.45:
	lw x24,-8+32(x8)
L.46:
	addi x10,x24,0
L.7:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.24:
	.word	0x40800000
	.align	4
L.23:
	.word	0x3e800000
	.align	4
L.20:
	.word	0x3f000000
	.align	4
L.17:
	.word	0x3f800000
	.align	4
L.14:
	.word	0x40490fdb
	.align	4
L.13:
	.word	0x0
	.align 4

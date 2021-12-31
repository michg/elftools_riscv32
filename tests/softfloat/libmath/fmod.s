	.align 4
	.text
	.globl fmod
	.align	4
fmod:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,float32_is_nan
	addi x30,x10,0
	bne x30,x0,L.13
	addi x12,x26,0
	jal x1,float32_is_nan
	bne x10,x0,L.13
	addi x12,x27,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.12
	addi x12,x27,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.8
L.12:
	addi x12,x26,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.13
	addi x12,x26,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.8
L.13:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.8:
	la x30,_pInfinity
	lw x30,0(x30)
	sw x30,-12+16(x8)
	addi x12,x27,0
	addi x13,x30,0
	jal x1,float32_eq
	bne x10,x0,L.17
	la x30,_mInfinity
	lw x30,0(x30)
	sw x30,-16+16(x8)
	addi x12,x27,0
	addi x13,x30,0
	jal x1,float32_eq
	bne x10,x0,L.17
	addi x12,x26,0
	lw x30,-12+16(x8)
	addi x13,x30,0
	jal x1,float32_eq
	bne x10,x0,L.17
	addi x12,x26,0
	lw x30,-16+16(x8)
	addi x13,x30,0
	jal x1,float32_ne
	bne x10,x0,L.14
L.17:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	addi x12,x27,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.21
	addi x12,x27,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.19
L.21:
	la x30,L.22
	lw x25,0(x30)
	jal x0,L.20
L.19:
	addi x25,x27,0
L.20:
	addi x10,x25,0
	jal x0,L.7
L.14:
	addi x12,x26,0
	la x30,L.22
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.23
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.23:
	addi x12,x27,0
	addi x13,x26,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x30,0
	addi x13,x8,-8+16
	jal x1,modf
	addi x12,x26,0
	lw x13,-8+16(x8)
	jal x1,float32_mul
	addi x30,x10,0
	addi x12,x27,0
	addi x13,x30,0
	jal x1,float32_sub
	addi x30,x10,0
L.7:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.22:
	.word	0x0
	.align 4

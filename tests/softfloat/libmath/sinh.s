	.align 4
	.text
	.globl sinh
	.align	4
sinh:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
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
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.12
	addi x12,x27,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.10
L.12:
	addi x10,x27,0
	jal x0,L.7
L.10:
	addi x12,x27,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.13
	la x30,errno
	li x29,34
	sw x29,0(x30)
	la x30,_pInfinity
	lw x10,0(x30)
	jal x0,L.7
L.13:
	addi x12,x27,0
	la x30,L.18
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.16
	la x30,errno
	li x29,34
	sw x29,0(x30)
	la x30,_pInfinity
	lw x12,0(x30)
	jal x1,float32_neg
	addi x30,x10,0
	jal x0,L.7
L.16:
	addi x12,x27,0
	jal x1,exp
	addi x27,x10,0
	la x30,L.20
	lw x12,0(x30)
	addi x13,x27,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x27,0
	addi x13,x30,0
	jal x1,float32_sub
	addi x30,x10,0
	la x29,L.19
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
L.7:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.20:
	.word	0x3f800000
	.align	4
L.19:
	.word	0x3f000000
	.align	4
L.18:
	.word	0xc2aeac50
	.align	4
L.15:
	.word	0x42b17218
	.align 4

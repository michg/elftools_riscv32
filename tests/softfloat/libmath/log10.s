	.align 4
	.text
	.globl log10
	.align	4
log10:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	mv x27,x12
	addi x12,x27,0
	jal x1,float32_is_nan
	bne x10,x0,L.10
	addi x12,x27,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.8
L.10:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.8:
	addi x12,x27,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.11
	addi x10,x27,0
	jal x0,L.7
L.11:
	addi x12,x27,0
	jal x1,log
	addi x30,x10,0
	la x29,L.13
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
L.13:
	.word	0x3ede5bd9
	.align 4

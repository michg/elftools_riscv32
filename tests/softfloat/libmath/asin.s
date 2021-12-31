	.align 4
	.text
	.globl asin
	.align	4
asin:
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
	la x30,L.13
	lw x13,0(x30)
	jal x1,float32_lt
	bne x10,x0,L.12
	addi x12,x27,0
	la x30,L.14
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.10
L.12:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.10:
	addi x12,x27,0
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.15
	la x30,L.17
	lw x10,0(x30)
	jal x0,L.7
L.15:
	addi x12,x27,0
	la x30,L.14
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.18
	la x30,L.20
	lw x10,0(x30)
	jal x0,L.7
L.18:
	addi x12,x27,0
	la x30,L.13
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.21
	la x30,L.23
	lw x10,0(x30)
	jal x0,L.7
L.21:
	addi x12,x27,0
	addi x13,x27,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,L.14
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_sub
	addi x30,x10,0
	addi x12,x30,0
	jal x1,sqrt
	addi x30,x10,0
	addi x12,x27,0
	addi x13,x30,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x30,0
	jal x1,atan
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
L.23:
	.word	0xbfc90fdb
	.align	4
L.20:
	.word	0x3fc90fdb
	.align	4
L.17:
	.word	0x0
	.align	4
L.14:
	.word	0x3f800000
	.align	4
L.13:
	.word	0xbf800000
	.align 4

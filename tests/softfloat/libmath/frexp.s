	.align 4
	.text
	.globl frexp
	.align	4
frexp:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	sw x13,20(x8)
	addi x12,x27,0
	jal x1,float32_is_nan
	beq x10,x0,L.8
	la x30,errno
	li x29,33
	sw x29,0(x30)
	lw x30,4+16(x8)
	sw x0,0(x30)
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
	la x30,errno
	li x29,34
	sw x29,0(x30)
	lw x30,4+16(x8)
	li x29,2147483647
	sw x29,0(x30)
	addi x12,x27,0
	la x30,L.16
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.14
	la x30,L.17
	lw x26,0(x30)
	jal x0,L.15
L.14:
	la x30,L.18
	lw x26,0(x30)
L.15:
	addi x10,x26,0
	jal x0,L.7
L.10:
	addi x12,x27,0
	la x30,L.16
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.19
	lw x30,4+16(x8)
	sw x0,0(x30)
	addi x10,x27,0
	jal x0,L.7
L.19:
	sw x27,-8+16(x8)
	lw x30,4+16(x8)
	lw x29,-8+16(x8)
	li x28,23
	srl x29,x29,x28
	li x28,255
	and x29,x29,x28
	addi x29,x29,-126
	sw x29,0(x30)
	lw x30,-8+16(x8)
	li x29,0x807fffff
	and x30,x30,x29
	li x29,0x3f000000
	or x30,x30,x29
	sw x30,-8+16(x8)
	lw x10,-8+16(x8)
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
L.18:
	.word	0x3f000000
	.align	4
L.17:
	.word	0xbf000000
	.align	4
L.16:
	.word	0x0
	.align 4

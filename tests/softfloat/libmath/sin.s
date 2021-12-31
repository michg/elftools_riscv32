	.align 4
	.text
	.align 4
	.data
	.align	4
P:
	.word	0x46474145
	.word	0xc48f8a3b
	.word	0x41c3ef2f
	.word	0xbe227368
	.align	4
Q:
	.word	0x467db305
	.word	0x434f303c
	.word	0x3f800000
	.globl sin
	.align 4
	.text
	.align	4
sin:
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
	li x29,33
	sw x29,0(x30)
	la x30,L.13
	lw x10,0(x30)
	jal x0,L.7
L.10:
	addi x12,x27,0
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_lt
	bne x10,x0,L.16
	addi x12,x27,0
	la x30,L.18
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.14
L.16:
	addi x12,x27,0
	la x30,L.19
	lw x13,0(x30)
	jal x1,fmod
	addi x27,x10,0
	addi x12,x27,0
	la x30,L.18
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.20
	addi x12,x27,0
	la x30,L.19
	lw x13,0(x30)
	jal x1,float32_sub
	addi x27,x10,0
	jal x0,L.21
L.20:
	addi x12,x27,0
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.22
	addi x12,x27,0
	la x30,L.19
	lw x13,0(x30)
	jal x1,float32_add
	addi x27,x10,0
L.22:
L.21:
L.14:
	addi x12,x27,0
	la x30,L.26
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.24
	addi x12,x27,0
	la x30,L.18
	lw x13,0(x30)
	jal x1,float32_sub
	addi x30,x10,0
	addi x12,x30,0
	jal x1,sin
	addi x30,x10,0
	addi x12,x30,0
	jal x1,float32_neg
	addi x30,x10,0
	jal x0,L.7
L.24:
	addi x12,x27,0
	la x30,L.29
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.27
	addi x12,x27,0
	la x30,L.18
	lw x13,0(x30)
	jal x1,float32_add
	addi x30,x10,0
	addi x12,x30,0
	jal x1,sin
	addi x30,x10,0
	addi x12,x30,0
	jal x1,float32_neg
	addi x30,x10,0
	jal x0,L.7
L.27:
	addi x12,x27,0
	la x30,L.32
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.30
	la x30,L.26
	lw x12,0(x30)
	addi x13,x27,0
	jal x1,float32_sub
	addi x30,x10,0
	addi x12,x30,0
	jal x1,cos
	addi x30,x10,0
	jal x0,L.7
L.30:
	addi x12,x27,0
	la x30,L.35
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.33
	addi x12,x27,0
	la x30,L.26
	lw x13,0(x30)
	jal x1,float32_add
	addi x30,x10,0
	addi x12,x30,0
	jal x1,cos
	addi x30,x10,0
	addi x12,x30,0
	jal x1,float32_neg
	addi x30,x10,0
	jal x0,L.7
L.33:
	addi x12,x27,0
	la x30,L.38
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.36
	addi x12,x27,0
	la x30,L.39
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.36
	addi x10,x27,0
	jal x0,L.7
L.36:
	addi x12,x27,0
	la x30,L.32
	lw x13,0(x30)
	jal x1,float32_div
	addi x30,x10,0
	addi x26,x30,0
	addi x12,x26,0
	addi x13,x26,0
	jal x1,float32_mul
	addi x30,x10,0
	sw x30,-8+16(x8)
	addi x12,x30,0
	la x29,P+12
	lw x13,0(x29)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,P+8
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-8+16(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,P+4
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-8+16(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,P
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	sw x30,-12+16(x8)
	lw x29,-8+16(x8)
	addi x12,x29,0
	la x29,Q+8
	lw x13,0(x29)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,Q+4
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-8+16(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,Q
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-12+16(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x26,0
	addi x13,x30,0
	jal x1,float32_mul
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
L.39:
	.word	0xafb504f3
	.align	4
L.38:
	.word	0x2fb504f3
	.align	4
L.35:
	.word	0xbf490fdb
	.align	4
L.32:
	.word	0x3f490fdb
	.align	4
L.29:
	.word	0xbfc90fdb
	.align	4
L.26:
	.word	0x3fc90fdb
	.align	4
L.19:
	.word	0x40c90fdb
	.align	4
L.18:
	.word	0x40490fdb
	.align	4
L.17:
	.word	0xc0490fdb
	.align	4
L.13:
	.word	0x0
	.align 4

	.align 4
	.text
	.align 4
	.data
	.align	4
C:
	.word	0x3f800000
	.word	0xbeaaa979
	.word	0x3e4c2450
	.word	0xbe033562
	.globl atan
	.align 4
	.text
	.align	4
atan:
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
	jal x1,float32_ne
	bne x10,x0,L.10
	la x30,L.12
	lw x10,0(x30)
	jal x0,L.7
L.10:
	addi x12,x27,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.13
	la x30,L.15
	lw x10,0(x30)
	jal x0,L.7
L.13:
	addi x12,x27,0
	la x30,L.18
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.16
	addi x12,x27,0
	jal x1,float32_neg
	addi x30,x10,0
	addi x12,x30,0
	jal x1,atan
	addi x30,x10,0
	addi x12,x30,0
	jal x1,float32_neg
	addi x30,x10,0
	jal x0,L.7
L.16:
	addi x12,x27,0
	la x30,L.21
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.19
	addi x12,x27,0
	la x30,L.24
	lw x13,0(x30)
	jal x1,float32_gt
	bne x10,x0,L.22
	la x30,L.21
	lw x12,0(x30)
	addi x13,x27,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x30,0
	jal x1,atan
	addi x30,x10,0
	la x29,L.12
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_sub
	addi x30,x10,0
	jal x0,L.7
L.22:
	la x30,errno
	li x29,34
	sw x29,0(x30)
	la x30,L.18
	lw x10,0(x30)
	jal x0,L.7
L.19:
	addi x12,x27,0
	la x30,L.27
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.25
	la x30,L.28
	lw x30,0(x30)
	sw x30,-8+16(x8)
	addi x12,x30,0
	addi x13,x27,0
	jal x1,float32_mul
	addi x12,x10,0
	la x30,L.21
	lw x13,0(x30)
	jal x1,float32_sub
	addi x30,x10,0
	sw x30,-12+16(x8)
	addi x12,x27,0
	lw x29,-8+16(x8)
	addi x13,x29,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-12+16(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x30,0
	jal x1,atan
	addi x12,x10,0
	la x30,L.29
	lw x13,0(x30)
	jal x1,float32_add
	addi x30,x10,0
	jal x0,L.7
L.25:
	addi x12,x27,0
	la x30,L.32
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.30
	addi x10,x27,0
	jal x0,L.7
L.30:
	addi x12,x27,0
	addi x13,x27,0
	jal x1,float32_mul
	addi x30,x10,0
	sw x30,-16+16(x8)
	addi x12,x30,0
	la x29,C+12
	lw x13,0(x29)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,C+8
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-16+16(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,C+4
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-16+16(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,C
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	addi x12,x27,0
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
L.32:
	.word	0x35000000
	.align	4
L.29:
	.word	0x3f060a92
	.align	4
L.28:
	.word	0x3fddb3d7
	.align	4
L.27:
	.word	0x3e8930a3
	.align	4
L.24:
	.word	0x7e800000
	.align	4
L.21:
	.word	0x3f800000
	.align	4
L.18:
	.word	0x0
	.align	4
L.15:
	.word	0xbfc90fdb
	.align	4
L.12:
	.word	0x3fc90fdb
	.align 4

	.align 4
	.text
	.align 4
	.data
	.align	4
P:
	.word	0xc054114e
	.word	0x3f654226
	.align	4
Q:
	.word	0xbfd4114d
	.word	0x3f800000
	.globl log
	.align 4
	.text
	.align	4
log:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
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
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.13
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.13:
	addi x12,x27,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_ne
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
	addi x13,x8,-8+32
	jal x1,frexp
	addi x30,x10,0
	la x29,L.18
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_mul
	addi x25,x10,0
	la x30,L.19
	lw x30,0(x30)
	sw x30,-16+32(x8)
	addi x12,x25,0
	addi x13,x30,0
	jal x1,float32_sub
	addi x30,x10,0
	sw x30,-20+32(x8)
	addi x12,x25,0
	lw x29,-16+32(x8)
	addi x13,x29,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-20+32(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_div
	addi x30,x10,0
	addi x26,x30,0
	addi x12,x26,0
	addi x13,x26,0
	jal x1,float32_mul
	addi x30,x10,0
	sw x30,-24+32(x8)
	addi x12,x30,0
	la x29,P+4
	lw x13,0(x29)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,P
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	sw x30,-28+32(x8)
	lw x29,-24+32(x8)
	addi x12,x29,0
	la x29,Q+4
	lw x13,0(x29)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,Q
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	lw x29,-28+32(x8)
	addi x12,x29,0
	addi x13,x30,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x26,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	sw x30,-12+32(x8)
	lw x12,-8+32(x8)
	jal x1,int32_to_float32
	addi x30,x10,0
	la x29,L.32
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_mul
	addi x12,x10,0
	la x30,L.33
	lw x13,0(x30)
	jal x1,float32_sub
	addi x30,x10,0
	addi x12,x30,0
	lw x13,-12+32(x8)
	jal x1,float32_add
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
L.33:
	.word	0x3eb17218
	.align	4
L.32:
	.word	0x3f317218
	.align	4
L.19:
	.word	0x3f800000
	.align	4
L.18:
	.word	0x3fb504f3
	.align	4
L.15:
	.word	0x0
	.align 4

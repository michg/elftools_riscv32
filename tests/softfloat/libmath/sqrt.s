	.align 4
	.text
	.align 4
	.data
	.align	4
P:
	.word	0x3e983812
	.word	0x410f0b80
	.word	0x41a90075
	.word	0x40bdc69c
	.align	4
Q:
	.word	0x401f950b
	.word	0x418e1cf2
	.word	0x41709253
	.word	0x3f800000
	.globl sqrt
	.align 4
	.text
	.align	4
sqrt:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	sw x12,16(x8)
	lw x12,0+16(x8)
	jal x1,float32_is_nan
	beq x10,x0,L.8
	la x30,errno
	li x29,33
	sw x29,0(x30)
	lw x10,0+16(x8)
	jal x0,L.7
L.8:
	lw x12,0+16(x8)
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.10
	lw x10,0+16(x8)
	jal x0,L.7
L.10:
	lw x12,0+16(x8)
	la x30,L.14
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.12
	la x30,L.14
	lw x10,0(x30)
	jal x0,L.7
L.12:
	lw x12,0+16(x8)
	la x30,L.14
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.15
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.15:
	lw x12,0+16(x8)
	addi x13,x8,-8+16
	jal x1,frexp
	addi x24,x10,0
	addi x12,x24,0
	la x30,P+12
	lw x13,0(x30)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,P+8
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	addi x12,x24,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,P+4
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	addi x12,x24,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,P
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	sw x30,-12+16(x8)
	addi x12,x24,0
	la x29,Q+12
	lw x13,0(x29)
	jal x1,float32_mul
	addi x30,x10,0
	la x29,Q+8
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	addi x12,x24,0
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	la x29,Q+4
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	addi x12,x24,0
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
	addi x25,x10,0
	lw x30,-8+16(x8)
	li x29,2
	rem x30,x30,x29
	addi x27,x30,0
	bge x30,x0,L.29
	addi x12,x25,0
	la x30,L.31
	lw x13,0(x30)
	jal x1,float32_div
	addi x25,x10,0
	jal x0,L.30
L.29:
	ble x27,x0,L.32
	la x30,L.31
	lw x12,0(x30)
	addi x13,x25,0
	jal x1,float32_mul
	addi x25,x10,0
L.32:
L.30:
	addi x12,x25,0
	lw x30,-8+16(x8)
	li x29,2
	div x13,x30,x29
	jal x1,ldexp
	addi x25,x10,0
	addi x26,x0,0
L.34:
	lw x12,0+16(x8)
	addi x13,x25,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x25,0
	addi x13,x30,0
	jal x1,float32_add
	addi x30,x10,0
	la x29,L.38
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_mul
	addi x25,x10,0
L.35:
	addi x26,x26,1
	li x30,1
	blt x26,x30,L.34
	addi x10,x25,0
L.7:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.38:
	.word	0x3f000000
	.align	4
L.31:
	.word	0x3fb504f3
	.align	4
L.14:
	.word	0x0
	.align 4

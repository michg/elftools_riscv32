	.align 4
	.text
	.globl atan2
	.align	4
atan2:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x26,0
	jal x1,float32_is_nan
	addi x30,x10,0
	bne x30,x0,L.16
	addi x12,x27,0
	jal x1,float32_is_nan
	bne x10,x0,L.16
	addi x12,x26,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.14
	addi x12,x26,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.13
L.14:
	addi x12,x27,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.16
	addi x12,x27,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.16
L.13:
	addi x12,x26,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.8
	addi x12,x27,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.16
	addi x12,x27,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.8
L.16:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.8:
	addi x12,x26,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.19
	addi x12,x26,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.17
L.19:
	la x30,L.15
	lw x10,0(x30)
	jal x0,L.7
L.17:
	addi x12,x27,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.22
	addi x12,x27,0
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.20
L.22:
	addi x12,x27,0
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.23
	addi x12,x26,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.26
	la x30,L.28
	lw x25,0(x30)
	jal x0,L.27
L.26:
	la x30,L.29
	lw x25,0(x30)
L.27:
	addi x10,x25,0
	jal x0,L.7
L.23:
	addi x12,x26,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.31
	la x30,L.29
	lw x24,0(x30)
	jal x0,L.32
L.31:
	la x30,L.28
	lw x24,0(x30)
L.32:
	addi x10,x24,0
	jal x0,L.7
L.20:
	addi x12,x26,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.33
	addi x12,x27,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.35
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.35:
	addi x12,x27,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.38
	la x30,L.28
	lw x25,0(x30)
	jal x0,L.39
L.38:
	la x30,L.29
	lw x25,0(x30)
L.39:
	addi x10,x25,0
	jal x0,L.7
L.33:
	addi x12,x26,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.40
	addi x12,x27,0
	addi x13,x26,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x30,0
	jal x1,atan
	addi x30,x10,0
	jal x0,L.7
L.40:
	addi x12,x27,0
	la x30,L.15
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.42
	addi x12,x27,0
	addi x13,x26,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x30,0
	jal x1,atan
	addi x12,x10,0
	la x30,L.44
	lw x13,0(x30)
	jal x1,float32_add
	addi x30,x10,0
	jal x0,L.7
L.42:
	addi x12,x27,0
	addi x13,x26,0
	jal x1,float32_div
	addi x30,x10,0
	addi x12,x30,0
	jal x1,atan
	addi x12,x10,0
	la x30,L.44
	lw x13,0(x30)
	jal x1,float32_sub
	addi x30,x10,0
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
L.44:
	.word	0x40490fdb
	.align	4
L.29:
	.word	0xbfc90fdb
	.align	4
L.28:
	.word	0x3fc90fdb
	.align	4
L.15:
	.word	0x0
	.align 4

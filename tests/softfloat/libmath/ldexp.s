	.align 4
	.text
	.globl ldexp
	.align	4
ldexp:
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
	beq x26,x0,L.15
	addi x12,x27,0
	la x30,L.16
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.13
L.15:
	addi x10,x27,0
	jal x0,L.7
L.13:
	sw x27,-8+16(x8)
	lw x30,-8+16(x8)
	li x29,23
	srl x30,x30,x29
	li x29,255
	and x30,x30,x29
	li x29,127
	sub x30,x30,x29
	addi x25,x30,0
	add x30,x26,x25
	li x29,127
	ble x30,x29,L.17
	la x30,errno
	li x29,34
	sw x29,0(x30)
	addi x12,x27,0
	la x30,L.16
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.20
	la x30,_mInfinity
	lw x24,0(x30)
	jal x0,L.21
L.20:
	la x30,_pInfinity
	lw x24,0(x30)
L.21:
	addi x10,x24,0
	jal x0,L.7
L.17:
	add x30,x26,x25
	li x29,-126
	bge x30,x29,L.22
	la x30,errno
	li x29,34
	sw x29,0(x30)
	la x30,L.16
	lw x10,0(x30)
	jal x0,L.7
L.22:
	lw x30,-8+16(x8)
	li x29,0x807fffff
	and x30,x30,x29
	add x29,x25,x26
	addi x29,x29,127
	li x28,255
	and x29,x29,x28
	li x28,23
	sll x29,x29,x28
	li x28,0x7f800000
	and x29,x29,x28
	or x30,x30,x29
	sw x30,-8+16(x8)
	lw x10,-8+16(x8)
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
L.16:
	.word	0x0
	.align 4

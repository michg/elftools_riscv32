	.align 4
	.text
	.globl pow
	.align	4
pow:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x23,28(x2)
	sw x24,32(x2)
	sw x25,36(x2)
	sw x26,40(x2)
	sw x27,44(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x12,0+16(x8)
	jal x1,float32_is_nan
	addi x30,x10,0
	bne x30,x0,L.10
	lw x12,4+16(x8)
	jal x1,float32_is_nan
	beq x10,x0,L.8
L.10:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.8:
	lw x12,0+16(x8)
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.11
	lw x12,4+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.15
	lw x25,0+16(x8)
	jal x0,L.16
L.15:
	lw x12,4+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.18
	la x30,L.20
	lw x24,0(x30)
	jal x0,L.19
L.18:
	la x30,L.17
	lw x24,0(x30)
L.19:
	addi x25,x24,0
L.16:
	addi x10,x25,0
	jal x0,L.7
L.11:
	lw x12,0+16(x8)
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.21
	lw x12,4+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.23
	la x30,L.20
	lw x10,0(x30)
	jal x0,L.7
L.23:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.21:
	lw x12,4+16(x8)
	la x30,_pInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.25
	lw x12,0+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_lt
	bne x10,x0,L.27
	lw x12,0+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.30
	lw x23,0+16(x8)
	jal x0,L.31
L.30:
	lw x23,4+16(x8)
L.31:
	addi x10,x23,0
	jal x0,L.7
L.27:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.25:
	lw x12,4+16(x8)
	la x30,_mInfinity
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.32
	lw x12,0+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.34
	la x30,L.17
	lw x10,0(x30)
	jal x0,L.7
L.34:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.32:
	lw x12,0+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.36
	lw x12,4+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.38
	la x30,L.17
	lw x10,0(x30)
	jal x0,L.7
L.38:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	lw x12,4+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.41
	la x30,_qNaN
	lw x23,0(x30)
	jal x0,L.42
L.41:
	la x30,_qNaN
	lw x23,0(x30)
L.42:
	addi x10,x23,0
	jal x0,L.7
L.36:
	lw x12,4+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.43
	la x30,L.20
	lw x10,0(x30)
	jal x0,L.7
L.43:
	lw x12,4+16(x8)
	addi x13,x8,-8+16
	jal x1,modf
	addi x12,x10,0
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_eq
	bne x10,x0,L.45
	lw x12,0+16(x8)
	la x30,L.17
	lw x13,0(x30)
	jal x1,float32_le
	bne x10,x0,L.47
	lw x12,0+16(x8)
	jal x1,log
	addi x30,x10,0
	lw x12,4+16(x8)
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	addi x12,x30,0
	jal x1,exp
	addi x30,x10,0
	jal x0,L.7
L.47:
	la x30,errno
	li x29,33
	sw x29,0(x30)
	la x30,_qNaN
	lw x10,0(x30)
	jal x0,L.7
L.45:
	lw x30,4+16(x8)
	sw x30,-12+16(x8)
	addi x12,x30,0
	jal x1,float32_to_int32
	addi x30,x10,0
	addi x27,x30,0
	addi x12,x27,0
	jal x1,int32_to_float32
	addi x12,x10,0
	lw x30,-12+16(x8)
	addi x13,x30,0
	jal x1,float32_eq
	bne x10,x0,L.49
	lw x12,0+16(x8)
	jal x1,log
	addi x30,x10,0
	lw x12,4+16(x8)
	addi x13,x30,0
	jal x1,float32_mul
	addi x30,x10,0
	addi x12,x30,0
	jal x1,exp
	addi x30,x10,0
	jal x0,L.7
L.49:
	bge x27,x0,L.51
	li x26,1
	sub x27,x0,x27
	jal x0,L.52
L.51:
	addi x26,x0,0
L.52:
	la x30,L.20
	lw x30,0(x30)
	sw x30,-8+16(x8)
	jal x0,L.56
L.53:
	andi x30,x27,1
	beq x30,x0,L.57
	lw x12,-8+16(x8)
	lw x13,0+16(x8)
	jal x1,float32_mul
	sw x10,-8+16(x8)
L.57:
	lw x30,0+16(x8)
	addi x12,x30,0
	addi x13,x30,0
	jal x1,float32_mul
	sw x10,0+16(x8)
L.54:
	li x30,1
	sra x27,x27,x30
L.56:
	bne x27,x0,L.53
	beq x26,x0,L.60
	la x30,L.20
	lw x12,0(x30)
	lw x13,-8+16(x8)
	jal x1,float32_div
	addi x30,x10,0
	addi x23,x30,0
	jal x0,L.61
L.60:
	lw x23,-8+16(x8)
L.61:
	addi x10,x23,0
L.7:
	lw x1,24(x2)
	lw x23,28(x2)
	lw x24,32(x2)
	lw x25,36(x2)
	lw x26,40(x2)
	lw x27,44(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.20:
	.word	0x3f800000
	.align	4
L.17:
	.word	0x0
	.align 4

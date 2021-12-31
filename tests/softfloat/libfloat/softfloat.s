	.align 4
	.text
	.align 4
	.data
	.globl float_rounding_mode
	.align	1
float_rounding_mode:
	.byte	0x2
	.globl float_exception_flags
	.align	1
float_exception_flags:
	.byte	0x0
	.align 4
	.text
	.align	4
shift32RightJamming:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	slli x30,x13,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.6
	sw x12,-8+16(x8)
	jal x0,L.7
L.6:
	slli x30,x13,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,32
	bge x30,x29,L.8
	slli x30,x13,8*(4-2)
	srai x30,x30,8*(4-2)
	sub x29,x0,x30
	andi x29,x29,31
	sll x29,x12,x29
	beq x29,x0,L.11
	li x27,1
	jal x0,L.12
L.11:
	addi x27,x0,0
L.12:
	srl x30,x12,x30
	addi x29,x27,0
	or x30,x30,x29
	sw x30,-8+16(x8)
	jal x0,L.9
L.8:
	beq x12,x0,L.14
	li x27,1
	jal x0,L.15
L.14:
	addi x27,x0,0
L.15:
	addi x30,x27,0
	sw x30,-8+16(x8)
L.9:
L.7:
	lw x30,-8+16(x8)
	sw x30,0(x14)
L.5:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
shift64Right:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	sub x30,x0,x30
	andi x30,x30,31
	sw x30,-16+16(x8)
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.17
	sw x13,-12+16(x8)
	sw x12,-8+16(x8)
	jal x0,L.18
L.17:
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,32
	bge x30,x29,L.19
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	lw x29,-16+16(x8)
	sll x29,x12,x29
	srl x28,x13,x30
	or x29,x29,x28
	sw x29,-12+16(x8)
	srl x30,x12,x30
	sw x30,-8+16(x8)
	jal x0,L.20
L.19:
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,64
	bge x30,x29,L.22
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	andi x30,x30,31
	srl x27,x12,x30
	jal x0,L.23
L.22:
	addi x27,x0,0
L.23:
	sw x27,-12+16(x8)
	sw x0,-8+16(x8)
L.20:
L.18:
	lw x30,-12+16(x8)
	sw x30,0(x16)
	lw x30,-8+16(x8)
	sw x30,0(x15)
L.16:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
shift64RightJamming:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	sub x30,x0,x30
	andi x30,x30,31
	sw x30,-16+16(x8)
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.25
	sw x13,-12+16(x8)
	sw x12,-8+16(x8)
	jal x0,L.26
L.25:
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,32
	bge x30,x29,L.27
	lw x30,-16+16(x8)
	sll x29,x13,x30
	beq x29,x0,L.30
	li x27,1
	jal x0,L.31
L.30:
	addi x27,x0,0
L.31:
	sll x30,x12,x30
	slli x29,x14,8*(4-2)
	srai x29,x29,8*(4-2)
	srl x29,x13,x29
	or x30,x30,x29
	addi x29,x27,0
	or x30,x30,x29
	sw x30,-12+16(x8)
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	srl x30,x12,x30
	sw x30,-8+16(x8)
	jal x0,L.28
L.27:
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,32
	bne x30,x29,L.32
	beq x13,x0,L.35
	li x27,1
	jal x0,L.36
L.35:
	addi x27,x0,0
L.36:
	addi x30,x27,0
	or x30,x12,x30
	sw x30,-12+16(x8)
	jal x0,L.33
L.32:
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,64
	bge x30,x29,L.37
	lw x30,-16+16(x8)
	sll x30,x12,x30
	or x30,x30,x13
	beq x30,x0,L.40
	li x27,1
	jal x0,L.41
L.40:
	addi x27,x0,0
L.41:
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	andi x30,x30,31
	srl x30,x12,x30
	addi x29,x27,0
	or x30,x30,x29
	sw x30,-12+16(x8)
	jal x0,L.38
L.37:
	or x30,x12,x13
	beq x30,x0,L.43
	li x27,1
	jal x0,L.44
L.43:
	addi x27,x0,0
L.44:
	addi x30,x27,0
	sw x30,-12+16(x8)
L.38:
L.33:
	sw x0,-8+16(x8)
L.28:
L.26:
	lw x30,-12+16(x8)
	sw x30,0(x16)
	lw x30,-8+16(x8)
	sw x30,0(x15)
L.24:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
shift64ExtraRightJamming:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,16
	sw x26,0(x2)
	sw x27,4(x2)
	slli x30,x15,8*(4-2)
	srai x30,x30,8*(4-2)
	sub x30,x0,x30
	andi x30,x30,31
	sw x30,-20+32(x8)
	slli x30,x15,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.46
	sw x14,-8+32(x8)
	sw x13,-16+32(x8)
	sw x12,-12+32(x8)
	jal x0,L.47
L.46:
	slli x30,x15,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,32
	bge x30,x29,L.48
	lw x30,-20+32(x8)
	sll x29,x13,x30
	sw x29,-8+32(x8)
	slli x29,x15,8*(4-2)
	srai x29,x29,8*(4-2)
	sll x30,x12,x30
	srl x28,x13,x29
	or x30,x30,x28
	sw x30,-16+32(x8)
	srl x30,x12,x29
	sw x30,-12+32(x8)
	jal x0,L.49
L.48:
	slli x30,x15,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,32
	bne x30,x29,L.50
	sw x13,-8+32(x8)
	sw x12,-16+32(x8)
	jal x0,L.51
L.50:
	or x14,x14,x13
	slli x30,x15,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,64
	bge x30,x29,L.52
	lw x30,-20+32(x8)
	sll x30,x12,x30
	sw x30,-8+32(x8)
	slli x30,x15,8*(4-2)
	srai x30,x30,8*(4-2)
	andi x30,x30,31
	srl x30,x12,x30
	sw x30,-16+32(x8)
	jal x0,L.53
L.52:
	slli x30,x15,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,64
	bne x30,x29,L.56
	addi x27,x12,0
	jal x0,L.57
L.56:
	beq x12,x0,L.58
	li x26,1
	jal x0,L.59
L.58:
	addi x26,x0,0
L.59:
	addi x27,x26,0
L.57:
	sw x27,-8+32(x8)
	sw x0,-16+32(x8)
L.53:
L.51:
	sw x0,-12+32(x8)
L.49:
	beq x14,x0,L.61
	li x27,1
	jal x0,L.62
L.61:
	addi x27,x0,0
L.62:
	lw x30,-8+32(x8)
	addi x29,x27,0
	or x30,x30,x29
	sw x30,-8+32(x8)
L.47:
	lw x30,24+32(x8)
	lw x29,-8+32(x8)
	sw x29,0(x30)
	lw x30,-16+32(x8)
	sw x30,0(x17)
	lw x30,-12+32(x8)
	sw x30,0(x16)
L.45:
	lw x26,0(x2)
	lw x27,4(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align	4
shortShift64Left:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	sll x30,x13,x30
	sw x30,0(x16)
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.65
	addi x27,x12,0
	jal x0,L.66
L.65:
	slli x30,x14,8*(4-2)
	srai x30,x30,8*(4-2)
	sll x29,x12,x30
	sub x30,x0,x30
	andi x30,x30,31
	srl x30,x13,x30
	or x27,x29,x30
L.66:
	sw x27,0(x15)
L.63:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
shortShift96Left:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,16
	slli x30,x15,8*(4-2)
	srai x30,x30,8*(4-2)
	sll x29,x14,x30
	sw x29,-16+32(x8)
	sll x29,x13,x30
	sw x29,-12+32(x8)
	sll x29,x12,x30
	sw x29,-8+32(x8)
	bge x0,x30,L.68
	slli x30,x15,8*(4-2)
	srai x30,x30,8*(4-2)
	sub x30,x0,x30
	andi x30,x30,31
	sw x30,-20+32(x8)
	lw x30,-20+32(x8)
	lw x29,-12+32(x8)
	srl x28,x14,x30
	or x29,x29,x28
	sw x29,-12+32(x8)
	lw x29,-8+32(x8)
	srl x30,x13,x30
	or x30,x29,x30
	sw x30,-8+32(x8)
L.68:
	lw x30,24+32(x8)
	lw x29,-16+32(x8)
	sw x29,0(x30)
	lw x30,-12+32(x8)
	sw x30,0(x17)
	lw x30,-8+32(x8)
	sw x30,0(x16)
L.67:
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align	4
add64:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x26,0(x2)
	sw x27,4(x2)
	add x27,x13,x15
	sw x27,0(x17)
	bgeu x27,x13,L.72
	li x26,1
	jal x0,L.73
L.72:
	addi x26,x0,0
L.73:
	add x30,x12,x14
	addi x29,x26,0
	add x30,x30,x29
	sw x30,0(x16)
L.70:
	lw x26,0(x2)
	lw x27,4(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
add96:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x21,0(x2)
	sw x22,4(x2)
	sw x23,8(x2)
	sw x24,12(x2)
	sw x25,16(x2)
	sw x26,20(x2)
	sw x27,24(x2)
	add x25,x14,x17
	bgeu x25,x14,L.76
	li x23,1
	jal x0,L.77
L.76:
	addi x23,x0,0
L.77:
	addi x24,x23,0
	add x27,x13,x16
	bgeu x27,x13,L.79
	li x22,1
	jal x0,L.80
L.79:
	addi x22,x0,0
L.80:
	sw x22,-8+16(x8)
	add x26,x12,x15
	addi x30,x24,0
	add x27,x27,x30
	bgeu x27,x30,L.82
	li x21,1
	jal x0,L.83
L.82:
	addi x21,x0,0
L.83:
	addi x30,x21,0
	add x26,x26,x30
	lw x30,-8+16(x8)
	add x26,x26,x30
	lw x30,32+16(x8)
	sw x25,0(x30)
	lw x30,28+16(x8)
	sw x27,0(x30)
	lw x30,24+16(x8)
	sw x26,0(x30)
L.74:
	lw x21,0(x2)
	lw x22,4(x2)
	lw x23,8(x2)
	lw x24,12(x2)
	lw x25,16(x2)
	lw x26,20(x2)
	lw x27,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align	4
sub64:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	sub x30,x13,x15
	sw x30,0(x17)
	bgeu x13,x15,L.86
	li x27,1
	jal x0,L.87
L.86:
	addi x27,x0,0
L.87:
	sub x30,x12,x14
	addi x29,x27,0
	sub x30,x30,x29
	sw x30,0(x16)
L.84:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
sub96:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x22,0(x2)
	sw x23,4(x2)
	sw x24,8(x2)
	sw x25,12(x2)
	sw x26,16(x2)
	sw x27,20(x2)
	sub x30,x14,x17
	sw x30,-8+16(x8)
	bgeu x14,x17,L.90
	li x24,1
	jal x0,L.91
L.90:
	addi x24,x0,0
L.91:
	addi x25,x24,0
	sub x26,x13,x16
	bgeu x13,x16,L.93
	li x23,1
	jal x0,L.94
L.93:
	addi x23,x0,0
L.94:
	sw x23,-12+16(x8)
	sub x27,x12,x15
	addi x30,x25,0
	bgeu x26,x30,L.96
	li x22,1
	jal x0,L.97
L.96:
	addi x22,x0,0
L.97:
	addi x30,x22,0
	sub x27,x27,x30
	addi x30,x25,0
	sub x26,x26,x30
	lw x30,-12+16(x8)
	sub x27,x27,x30
	lw x30,32+16(x8)
	lw x29,-8+16(x8)
	sw x29,0(x30)
	lw x30,28+16(x8)
	sw x26,0(x30)
	lw x30,24+16(x8)
	sw x27,0(x30)
L.88:
	lw x22,0(x2)
	lw x23,4(x2)
	lw x24,8(x2)
	lw x25,12(x2)
	lw x26,16(x2)
	lw x27,20(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align	4
mul32To64:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x18,0(x2)
	sw x19,4(x2)
	sw x20,8(x2)
	sw x21,12(x2)
	sw x22,16(x2)
	sw x23,20(x2)
	sw x24,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	addi x25,x12,0
	li x30,16
	srl x29,x12,x30
	addi x26,x29,0
	addi x23,x13,0
	srl x30,x13,x30
	addi x24,x30,0
	li x30,65535
	slli x29,x25,8*(4-2)
	srli x29,x29,8*(4-2)
	and x29,x29,x30
	addi x25,x29,0
	slli x29,x23,8*(4-2)
	srli x29,x29,8*(4-2)
	and x29,x29,x30
	addi x23,x29,0
	slli x29,x26,8*(4-2)
	srli x29,x29,8*(4-2)
	and x29,x29,x30
	addi x26,x29,0
	slli x29,x24,8*(4-2)
	srli x29,x29,8*(4-2)
	and x30,x29,x30
	addi x24,x30,0
	slli x30,x25,8*(4-2)
	srli x30,x30,8*(4-2)
	slli x29,x23,8*(4-2)
	srli x29,x29,8*(4-2)
	mul x21,x30,x29
	slli x28,x24,8*(4-2)
	srli x28,x28,8*(4-2)
	mul x27,x30,x28
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	mul x20,x30,x29
	mul x22,x30,x28
	add x27,x27,x20
	bgeu x27,x20,L.100
	li x19,1
	jal x0,L.101
L.100:
	addi x19,x0,0
L.101:
	li x30,16
	addi x29,x19,0
	sll x29,x29,x30
	srl x28,x27,x30
	add x29,x29,x28
	add x22,x22,x29
	sll x27,x27,x30
	add x21,x21,x27
	bgeu x21,x27,L.103
	li x18,1
	jal x0,L.104
L.103:
	addi x18,x0,0
L.104:
	addi x30,x18,0
	add x22,x22,x30
	sw x21,0(x15)
	sw x22,0(x14)
L.98:
	lw x18,0(x2)
	lw x19,4(x2)
	lw x20,8(x2)
	lw x21,12(x2)
	lw x22,16(x2)
	lw x23,20(x2)
	lw x24,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
mul64By32To96:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,32(x8)
	sw x13,36(x8)
	sw x14,40(x8)
	sw x15,44(x8)
	sw x16,48(x8)
	sw x17,52(x8)
	lw x12,4+32(x8)
	lw x13,8+32(x8)
	addi x14,x8,-12+32
	addi x15,x8,-16+32
	jal x1,mul32To64
	lw x12,0+32(x8)
	lw x13,8+32(x8)
	addi x14,x8,-8+32
	addi x15,x8,-20+32
	jal x1,mul32To64
	lw x12,-8+32(x8)
	lw x13,-20+32(x8)
	addi x14,x0,0
	lw x15,-12+32(x8)
	addi x16,x8,-8+32
	addi x17,x8,-12+32
	jal x1,add64
	lw x30,20+32(x8)
	lw x29,-16+32(x8)
	sw x29,0(x30)
	lw x30,16+32(x8)
	lw x29,-12+32(x8)
	sw x29,0(x30)
	lw x30,12+32(x8)
	lw x29,-8+32(x8)
	sw x29,0(x30)
L.105:
	lw x1,24(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
mul64To128:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,32(x8)
	sw x13,36(x8)
	sw x14,40(x8)
	sw x15,44(x8)
	sw x16,48(x8)
	sw x17,52(x8)
	lw x12,4+32(x8)
	lw x13,12+32(x8)
	addi x14,x8,-16+32
	addi x15,x8,-28+32
	jal x1,mul32To64
	lw x12,4+32(x8)
	lw x13,8+32(x8)
	addi x14,x8,-8+32
	addi x15,x8,-24+32
	jal x1,mul32To64
	lw x12,-8+32(x8)
	lw x13,-24+32(x8)
	addi x14,x0,0
	lw x15,-16+32(x8)
	addi x16,x8,-8+32
	addi x17,x8,-16+32
	jal x1,add64
	lw x12,0+32(x8)
	lw x13,8+32(x8)
	addi x14,x8,-12+32
	addi x15,x8,-20+32
	jal x1,mul32To64
	lw x12,-12+32(x8)
	lw x13,-20+32(x8)
	addi x14,x0,0
	lw x15,-8+32(x8)
	addi x16,x8,-12+32
	addi x17,x8,-8+32
	jal x1,add64
	lw x12,0+32(x8)
	lw x13,12+32(x8)
	addi x14,x8,-20+32
	addi x15,x8,-24+32
	jal x1,mul32To64
	lw x12,-20+32(x8)
	lw x13,-24+32(x8)
	addi x14,x0,0
	lw x15,-16+32(x8)
	addi x16,x8,-20+32
	addi x17,x8,-16+32
	jal x1,add64
	lw x12,-12+32(x8)
	lw x13,-8+32(x8)
	addi x14,x0,0
	lw x15,-20+32(x8)
	addi x16,x8,-12+32
	addi x17,x8,-8+32
	jal x1,add64
	lw x30,28+32(x8)
	lw x29,-28+32(x8)
	sw x29,0(x30)
	lw x30,24+32(x8)
	lw x29,-16+32(x8)
	sw x29,0(x30)
	lw x30,20+32(x8)
	lw x29,-8+32(x8)
	sw x29,0(x30)
	lw x30,16+32(x8)
	lw x29,-12+32(x8)
	sw x29,0(x30)
L.106:
	lw x1,24(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
estimateDiv64To32:
	addi x2,x2,-96
	sw  x8,92(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x21,28(x2)
	sw x22,32(x2)
	sw x23,36(x2)
	sw x24,40(x2)
	sw x25,44(x2)
	sw x26,48(x2)
	sw x27,52(x2)
	mv x27,x12
	sw x13,36(x8)
	mv x26,x14
	bgtu x26,x27,L.108
	li x10,0xffffffff
	jal x0,L.107
L.108:
	li x30,16
	srl x24,x26,x30
	sll x30,x24,x30
	bgtu x30,x27,L.111
	li x22,0xffff0000
	jal x0,L.112
L.111:
	divu x30,x27,x24
	li x29,16
	sll x22,x30,x29
L.112:
	addi x23,x22,0
	addi x12,x26,0
	addi x13,x23,0
	addi x14,x8,-16+32
	addi x15,x8,-20+32
	jal x1,mul32To64
	addi x12,x27,0
	lw x13,4+32(x8)
	lw x14,-16+32(x8)
	lw x15,-20+32(x8)
	addi x16,x8,-8+32
	addi x17,x8,-12+32
	jal x1,sub64
	jal x0,L.114
L.113:
	li x30,0x10000
	sub x23,x23,x30
	li x30,16
	sll x25,x26,x30
	lw x12,-8+32(x8)
	lw x13,-12+32(x8)
	addi x14,x24,0
	addi x15,x25,0
	addi x16,x8,-8+32
	addi x17,x8,-12+32
	jal x1,add64
L.114:
	lw x30,-8+32(x8)
	blt x30,x0,L.113
	li x30,16
	lw x29,-8+32(x8)
	sll x29,x29,x30
	lw x28,-12+32(x8)
	srl x28,x28,x30
	or x29,x29,x28
	sw x29,-8+32(x8)
	sll x30,x24,x30
	lw x29,-8+32(x8)
	bgtu x30,x29,L.117
	li x21,0xffff
	jal x0,L.118
L.117:
	lw x30,-8+32(x8)
	divu x21,x30,x24
L.118:
	or x23,x23,x21
	addi x10,x23,0
L.107:
	lw x1,24(x2)
	lw x21,28(x2)
	lw x22,32(x2)
	lw x23,36(x2)
	lw x24,40(x2)
	lw x25,44(x2)
	lw x26,48(x2)
	lw x27,52(x2)
	lw  x8,92(x2)
	addi  x2,x2,96
	jalr x0,x1,0

	.align 4
	.data
	.align	2
L.120:
	.half	0x4
	.half	0x22
	.half	0x5d
	.half	0xb1
	.half	0x11d
	.half	0x19f
	.half	0x236
	.half	0x2e0
	.half	0x39c
	.half	0x468
	.half	0x545
	.half	0x631
	.half	0x72b
	.half	0x832
	.half	0x946
	.half	0xa67
	.align	2
L.121:
	.half	0xa2d
	.half	0x8af
	.half	0x75a
	.half	0x629
	.half	0x51a
	.half	0x429
	.half	0x356
	.half	0x29e
	.half	0x200
	.half	0x179
	.half	0x109
	.half	0xaf
	.half	0x68
	.half	0x34
	.half	0x12
	.half	0x2
	.align 4
	.text
	.align	4
estimateSqrt32:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	sw x12,16(x8)
	mv x27,x13
	lw x30,0+16(x8)
	sh x30,0+16(x8)
	li x30,27
	srl x30,x27,x30
	li x29,15
	and x30,x30,x29
	sw x30,-8+16(x8)
	lh x30,0+16(x8)
	andi x30,x30,1
	beq x30,x0,L.122
	li x30,1
	li x29,17
	srl x29,x27,x29
	li x28,16384
	add x29,x29,x28
	lw x28,-8+16(x8)
	sll x28,x28,x30
	la x7,L.120
	add x28,x28,x7
	lhu x28,0(x28)
	sub x26,x29,x28
	divu x29,x27,x26
	li x28,14
	sll x29,x29,x28
	li x28,15
	sll x28,x26,x28
	add x26,x29,x28
	srl x27,x27,x30
	jal x0,L.123
L.122:
	li x30,17
	srl x30,x27,x30
	li x29,0x8000
	add x30,x30,x29
	lw x29,-8+16(x8)
	li x28,1
	sll x29,x29,x28
	la x28,L.121
	add x29,x29,x28
	lhu x29,0(x29)
	sub x26,x30,x29
	divu x30,x27,x26
	add x26,x30,x26
	li x30,0x20000
	bgtu x30,x26,L.125
	li x25,0xffff8000
	jal x0,L.126
L.125:
	li x30,15
	sll x25,x26,x30
L.126:
	addi x26,x25,0
	bgtu x26,x27,L.127
	addi x30,x27,0
	li x29,1
	sra x30,x30,x29
	addi x10,x30,0
	jal x0,L.119
L.127:
L.123:
	addi x12,x27,0
	addi x13,x0,0
	addi x14,x26,0
	jal x1,estimateDiv64To32
	li x29,1
	srl x30,x10,x29
	srl x29,x26,x29
	add x10,x30,x29
L.119:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.130:
	.word	0x8
	.word	0x7
	.word	0x6
	.word	0x6
	.word	0x5
	.word	0x5
	.word	0x5
	.word	0x5
	.word	0x4
	.word	0x4
	.word	0x4
	.word	0x4
	.word	0x4
	.word	0x4
	.word	0x4
	.word	0x4
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x3
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x2
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x1
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.word	0x0
	.align 4
	.text
	.align	4
countLeadingZeros32:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	addi x27,x0,0
	li x30,0x10000
	bgeu x12,x30,L.131
	li x30,16
	add x27,x27,x30
	sll x12,x12,x30
L.131:
	li x30,0x1000000
	bgeu x12,x30,L.133
	li x30,8
	add x27,x27,x30
	sll x12,x12,x30
L.133:
	li x30,24
	srl x30,x12,x30
	li x29,2
	sll x30,x30,x29
	la x29,L.130
	add x30,x30,x29
	lw x30,0(x30)
	add x27,x27,x30
	addi x10,x27,0
L.129:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
eq64:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	bne x12,x14,L.137
	bne x13,x15,L.137
	li x27,1
	jal x0,L.138
L.137:
	addi x27,x0,0
L.138:
	addi x10,x27,0
L.135:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
le64:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	bltu x12,x14,L.143
	bne x12,x14,L.141
	bgtu x13,x15,L.141
L.143:
	li x27,1
	jal x0,L.142
L.141:
	addi x27,x0,0
L.142:
	addi x10,x27,0
L.139:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
lt64:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	bltu x12,x14,L.148
	bne x12,x14,L.146
	bgeu x13,x15,L.146
L.148:
	li x27,1
	jal x0,L.147
L.146:
	addi x27,x0,0
L.147:
	addi x10,x27,0
L.144:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
ne64:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	bne x12,x14,L.153
	beq x13,x15,L.151
L.153:
	li x27,1
	jal x0,L.152
L.151:
	addi x27,x0,0
L.152:
	addi x10,x27,0
L.149:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align 4
	.data
	.globl float_detect_tininess
	.align	1
float_detect_tininess:
	.byte	0x0
	.globl float_raise
	.align 4
	.text
	.align	4
float_raise:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	la x30,float_exception_flags
	lb x29,0(x30)
	slli x28,x12,8*(4-1)
	srai x28,x28,8*(4-1)
	or x29,x29,x28
	sb x29,0(x30)
L.154:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl float32_is_nan
	.align	4
float32_is_nan:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	li x30,0xff000000
	li x29,1
	sll x29,x12,x29
	bgeu x30,x29,L.159
	li x27,1
	jal x0,L.160
L.159:
	addi x27,x0,0
L.160:
	addi x10,x27,0
L.157:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl float32_is_signaling_nan
	.align	4
float32_is_signaling_nan:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	li x30,22
	sra x30,x12,x30
	andi x30,x30,511
	li x29,510
	bne x30,x29,L.163
	li x30,4194303
	and x30,x12,x30
	beq x30,x0,L.163
	li x27,1
	jal x0,L.164
L.163:
	addi x27,x0,0
L.164:
	addi x10,x27,0
L.161:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
float32ToCommonNaN:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	mv x27,x13
	addi x12,x27,0
	jal x1,float32_is_signaling_nan
	beq x10,x0,L.167
	li x12,16
	jal x1,float_raise
L.167:
	li x30,31
	sra x30,x27,x30
	sw x30,-16+16(x8)
	sw x0,-8+16(x8)
	li x30,9
	sll x30,x27,x30
	sw x30,-12+16(x8)
	lw x30,0+16(x8)
	addi x5,x8,-16+16
	lw x11,0(x5)
	lw x6,4(x5)
	sw	x11, 0(x30)
	sw	x6, 4(x30)
	lw x11,8(x5)
	sw	x11, 8(x30)
L.165:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
commonNaNToFloat32:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	lw x30,0(x12)
	li x29,31
	sll x30,x30,x29
	li x29,0x7fc00000
	or x30,x30,x29
	li x29,4
	add x29,x12,x29
	lw x29,0(x29)
	li x28,9
	srl x29,x29,x28
	or x30,x30,x29
	addi x10,x30,0
L.171:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
propagateFloat32NaN:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,float32_is_nan
	sw x10,-12+32(x8)
	addi x12,x27,0
	jal x1,float32_is_signaling_nan
	sw x10,-8+32(x8)
	addi x12,x26,0
	jal x1,float32_is_nan
	sw x10,-20+32(x8)
	addi x12,x26,0
	jal x1,float32_is_signaling_nan
	sw x10,-16+32(x8)
	li x30,4194304
	or x27,x27,x30
	or x26,x26,x30
	lw x30,-8+32(x8)
	lw x29,-16+32(x8)
	or x30,x30,x29
	beq x30,x0,L.173
	li x12,16
	jal x1,float_raise
L.173:
	lw x30,-12+32(x8)
	beq x30,x0,L.175
	lw x30,-8+32(x8)
	lw x29,-20+32(x8)
	and x30,x30,x29
	beq x30,x0,L.178
	addi x25,x26,0
	jal x0,L.179
L.178:
	addi x25,x27,0
L.179:
	addi x10,x25,0
	jal x0,L.172
L.175:
	addi x10,x26,0
L.172:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align	4
extractFloat32Frac:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x30,8388607
	and x30,x12,x30
	addi x10,x30,0
L.180:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
extractFloat32Exp:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x30,23
	sra x30,x12,x30
	andi x30,x30,255
	slli x10,x30,8*(4-2)
	srai x10,x10,8*(4-2)
L.181:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
extractFloat32Sign:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x30,31
	sra x10,x12,x30
L.182:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
normalizeFloat32Subnormal:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	sw x14,24(x8)
	lw x12,0+16(x8)
	jal x1,countLeadingZeros32
	addi x27,x10,-8
	lw x30,8+16(x8)
	lw x29,0+16(x8)
	sll x29,x29,x27
	sw x29,0(x30)
	lw x30,4+16(x8)
	li x29,1
	sub x29,x29,x27
	sh x29,0(x30)
L.183:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
packFloat32:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	addi x30,x12,0
	li x29,31
	sll x30,x30,x29
	slli x29,x13,8*(4-2)
	srai x29,x29,8*(4-2)
	li x28,23
	sll x29,x29,x28
	add x30,x30,x29
	add x30,x30,x14
	addi x10,x30,0
L.184:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
roundAndPackFloat32:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x22,28(x2)
	sw x23,32(x2)
	sw x24,36(x2)
	sw x25,40(x2)
	sw x26,44(x2)
	sw x27,48(x2)
	sw x12,16(x8)
	mv x27,x13
	sw x14,24(x8)
	la x30,float_rounding_mode
	lb x30,0(x30)
	sw x30,-8+16(x8)
	lw x30,-8+16(x8)
	bne x30,x0,L.187
	li x23,1
	jal x0,L.188
L.187:
	addi x23,x0,0
L.188:
	addi x24,x23,0
	li x26,64
	bne x24,x0,L.189
	lw x30,-8+16(x8)
	li x29,1
	bne x30,x29,L.191
	addi x26,x0,0
	jal x0,L.192
L.191:
	li x26,127
	lw x30,0+16(x8)
	beq x30,x0,L.193
	lw x30,-8+16(x8)
	li x29,3
	bne x30,x29,L.194
	addi x26,x0,0
	jal x0,L.194
L.193:
	lw x30,-8+16(x8)
	li x29,2
	bne x30,x29,L.197
	addi x26,x0,0
L.197:
L.194:
L.192:
L.189:
	lw x30,8+16(x8)
	li x29,127
	and x30,x30,x29
	addi x25,x30,0
	li x30,253
	slli x29,x27,8*(4-2)
	srai x29,x29,8*(4-2)
	li x28,65535
	and x29,x29,x28
	bgt x30,x29,L.199
	li x30,253
	slli x29,x27,8*(4-2)
	srai x29,x29,8*(4-2)
	blt x30,x29,L.203
	bne x29,x30,L.201
	lw x30,8+16(x8)
	addi x29,x26,0
	add x30,x30,x29
	bge x30,x0,L.201
L.203:
	li x12,5
	jal x1,float_raise
	lw x12,0+16(x8)
	li x13,255
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	bne x26,x0,L.205
	li x22,1
	jal x0,L.206
L.205:
	addi x22,x0,0
L.206:
	sub x10,x30,x22
	jal x0,L.185
L.201:
	slli x30,x27,8*(4-2)
	srai x30,x30,8*(4-2)
	bge x30,x0,L.207
	la x30,float_detect_tininess
	lb x30,0(x30)
	li x29,1
	beq x30,x29,L.213
	slli x30,x27,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,-1
	blt x30,x29,L.213
	lw x30,8+16(x8)
	addi x29,x26,0
	add x30,x30,x29
	li x29,0x80000000
	bgeu x30,x29,L.210
L.213:
	li x22,1
	jal x0,L.211
L.210:
	addi x22,x0,0
L.211:
	sw x22,-12+16(x8)
	lw x12,8+16(x8)
	slli x30,x27,8*(4-2)
	srai x30,x30,8*(4-2)
	sub x30,x0,x30
	slli x13,x30,8*(4-2)
	srai x13,x13,8*(4-2)
	addi x14,x8,8+16
	jal x1,shift32RightJamming
	addi x27,x0,0
	lw x30,8+16(x8)
	li x29,127
	and x30,x30,x29
	addi x25,x30,0
	lw x29,-12+16(x8)
	beq x29,x0,L.214
	beq x25,x0,L.214
	li x12,2
	jal x1,float_raise
L.214:
L.207:
L.199:
	beq x25,x0,L.216
	la x30,float_exception_flags
	lb x29,0(x30)
	ori x29,x29,1
	sb x29,0(x30)
L.216:
	lw x30,8+16(x8)
	addi x29,x26,0
	add x30,x30,x29
	li x29,7
	srl x30,x30,x29
	sw x30,8+16(x8)
	xori x30,x25,64
	bne x30,x0,L.219
	li x22,1
	jal x0,L.220
L.219:
	addi x22,x0,0
L.220:
	lw x30,8+16(x8)
	and x29,x22,x24
	xori x29,x29,-1
	and x30,x30,x29
	sw x30,8+16(x8)
	lw x30,8+16(x8)
	bne x30,x0,L.221
	addi x27,x0,0
L.221:
	lw x12,0+16(x8)
	slli x13,x27,8*(4-2)
	srai x13,x13,8*(4-2)
	lw x14,8+16(x8)
	jal x1,packFloat32
	addi x30,x10,0
L.185:
	lw x1,24(x2)
	lw x22,28(x2)
	lw x23,32(x2)
	lw x24,36(x2)
	lw x25,40(x2)
	lw x26,44(x2)
	lw x27,48(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align	4
normalizeRoundAndPackFloat32:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	sw x14,24(x8)
	lw x30,4+16(x8)
	sh x30,4+16(x8)
	lw x12,8+16(x8)
	jal x1,countLeadingZeros32
	addi x27,x10,-1
	lw x12,0+16(x8)
	lh x30,4+16(x8)
	sub x30,x30,x27
	slli x13,x30,8*(4-2)
	srai x13,x13,8*(4-2)
	lw x30,8+16(x8)
	sll x14,x30,x27
	jal x1,roundAndPackFloat32
	addi x30,x10,0
L.223:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl int32_to_float32
	.align	4
int32_to_float32:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	mv x27,x12
	bne x27,x0,L.225
	addi x10,x0,0
	jal x0,L.224
L.225:
	li x30,0x80000000
	bne x27,x30,L.227
	li x12,1
	li x13,158
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.224
L.227:
	bge x27,x0,L.230
	li x25,1
	jal x0,L.231
L.230:
	addi x25,x0,0
L.231:
	addi x26,x25,0
	addi x12,x26,0
	li x13,156
	beq x26,x0,L.233
	sub x24,x0,x27
	jal x0,L.234
L.233:
	addi x24,x27,0
L.234:
	addi x14,x24,0
	jal x1,normalizeRoundAndPackFloat32
	addi x30,x10,0
L.224:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl float32_to_int32
	.align	4
float32_to_int32:
	addi x2,x2,-96
	sw  x8,92(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x22,28(x2)
	sw x23,32(x2)
	sw x24,36(x2)
	sw x25,40(x2)
	sw x26,44(x2)
	sw x27,48(x2)
	mv x27,x12
	addi x12,x27,0
	jal x1,extractFloat32Frac
	sw x10,-8+32(x8)
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	addi x25,x30,0
	addi x12,x27,0
	jal x1,extractFloat32Sign
	sw x10,-12+32(x8)
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,-150
	addi x24,x30,0
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	bgt x0,x30,L.236
	li x30,158
	slli x29,x25,8*(4-2)
	srai x29,x29,8*(4-2)
	bgt x30,x29,L.238
	addi x30,x27,0
	li x29,0xcf000000
	beq x30,x29,L.240
	li x12,16
	jal x1,float_raise
	lw x30,-12+32(x8)
	beq x30,x0,L.244
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.242
	lw x30,-8+32(x8)
	beq x30,x0,L.242
L.244:
	li x10,2147483647
	jal x0,L.235
L.242:
L.240:
	li x30,0x80000000
	addi x10,x30,0
	jal x0,L.235
L.238:
	lw x30,-8+32(x8)
	li x29,0x800000
	or x30,x30,x29
	slli x29,x24,8*(4-2)
	srai x29,x29,8*(4-2)
	sll x30,x30,x29
	addi x26,x30,0
	lw x30,-12+32(x8)
	beq x30,x0,L.237
	sub x26,x0,x26
	jal x0,L.237
L.236:
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,126
	bge x30,x29,L.247
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	lw x29,-8+32(x8)
	or x30,x30,x29
	sw x30,-16+32(x8)
	addi x26,x0,0
	jal x0,L.248
L.247:
	lw x30,-8+32(x8)
	li x29,0x800000
	or x30,x30,x29
	sw x30,-8+32(x8)
	lw x30,-8+32(x8)
	slli x29,x24,8*(4-2)
	srai x29,x29,8*(4-2)
	andi x28,x29,31
	sll x28,x30,x28
	sw x28,-16+32(x8)
	sub x29,x0,x29
	srl x30,x30,x29
	addi x26,x30,0
L.248:
	lw x30,-16+32(x8)
	beq x30,x0,L.249
	la x30,float_exception_flags
	lb x29,0(x30)
	ori x29,x29,1
	sb x29,0(x30)
L.249:
	la x30,float_rounding_mode
	lb x30,0(x30)
	sw x30,-20+32(x8)
	lw x30,-20+32(x8)
	bne x30,x0,L.251
	lw x30,-16+32(x8)
	bge x30,x0,L.253
	li x30,1
	add x26,x26,x30
	lw x29,-16+32(x8)
	sll x30,x29,x30
	bne x30,x0,L.255
	andi x26,x26,-2
L.255:
L.253:
	lw x30,-12+32(x8)
	beq x30,x0,L.252
	sub x26,x0,x26
	jal x0,L.252
L.251:
	lw x30,-16+32(x8)
	beq x30,x0,L.260
	li x23,1
	jal x0,L.261
L.260:
	addi x23,x0,0
L.261:
	addi x30,x23,0
	sw x30,-16+32(x8)
	lw x30,-12+32(x8)
	beq x30,x0,L.262
	lw x30,-20+32(x8)
	li x29,2
	bne x30,x29,L.265
	li x22,1
	jal x0,L.266
L.265:
	addi x22,x0,0
L.266:
	addi x30,x26,0
	addi x29,x22,0
	lw x28,-16+32(x8)
	and x29,x29,x28
	add x30,x30,x29
	addi x26,x30,0
	sub x26,x0,x26
	jal x0,L.263
L.262:
	lw x30,-20+32(x8)
	li x29,3
	bne x30,x29,L.268
	li x22,1
	jal x0,L.269
L.268:
	addi x22,x0,0
L.269:
	addi x30,x26,0
	addi x29,x22,0
	lw x28,-16+32(x8)
	and x29,x29,x28
	add x30,x30,x29
	addi x26,x30,0
L.263:
L.252:
L.237:
	addi x10,x26,0
L.235:
	lw x1,24(x2)
	lw x22,28(x2)
	lw x23,32(x2)
	lw x24,36(x2)
	lw x25,40(x2)
	lw x26,44(x2)
	lw x27,48(x2)
	lw  x8,92(x2)
	addi  x2,x2,96
	jalr x0,x1,0

	.globl float32_to_int32_round_to_zero
	.align	4
float32_to_int32_round_to_zero:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x23,28(x2)
	sw x24,32(x2)
	sw x25,36(x2)
	sw x26,40(x2)
	sw x27,44(x2)
	mv x27,x12
	addi x12,x27,0
	jal x1,extractFloat32Frac
	addi x26,x10,0
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	addi x24,x30,0
	addi x12,x27,0
	jal x1,extractFloat32Sign
	sw x10,-8+16(x8)
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,-158
	addi x25,x30,0
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	bgt x0,x30,L.271
	addi x30,x27,0
	li x29,0xcf000000
	beq x30,x29,L.273
	li x12,16
	jal x1,float_raise
	lw x30,-8+16(x8)
	beq x30,x0,L.277
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.275
	beq x26,x0,L.275
L.277:
	li x10,2147483647
	jal x0,L.270
L.275:
L.273:
	li x30,0x80000000
	addi x10,x30,0
	jal x0,L.270
L.271:
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,126
	bgt x30,x29,L.278
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	or x30,x30,x26
	beq x30,x0,L.280
	la x30,float_exception_flags
	lb x29,0(x30)
	ori x29,x29,1
	sb x29,0(x30)
L.280:
	addi x10,x0,0
	jal x0,L.270
L.278:
	li x30,0x800000
	or x30,x26,x30
	li x29,8
	sll x26,x30,x29
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	sub x29,x0,x30
	srl x29,x26,x29
	addi x23,x29,0
	andi x30,x30,31
	sll x30,x26,x30
	beq x30,x0,L.282
	la x30,float_exception_flags
	lb x29,0(x30)
	ori x29,x29,1
	sb x29,0(x30)
L.282:
	lw x30,-8+16(x8)
	beq x30,x0,L.284
	sub x23,x0,x23
L.284:
	addi x10,x23,0
L.270:
	lw x1,24(x2)
	lw x23,28(x2)
	lw x24,32(x2)
	lw x25,36(x2)
	lw x26,40(x2)
	lw x27,44(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.globl float32_round_to_int
	.align	4
float32_round_to_int:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x21,28(x2)
	sw x22,32(x2)
	sw x23,36(x2)
	sw x24,40(x2)
	sw x25,44(x2)
	sw x26,48(x2)
	sw x27,52(x2)
	mv x27,x12
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x25,x10,0
	li x30,150
	slli x29,x25,8*(4-2)
	srai x29,x29,8*(4-2)
	bgt x30,x29,L.287
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.289
	addi x12,x27,0
	jal x1,extractFloat32Frac
	beq x10,x0,L.289
	addi x12,x27,0
	addi x13,x27,0
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.286
L.289:
	addi x10,x27,0
	jal x0,L.286
L.287:
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,126
	bgt x30,x29,L.291
	li x30,1
	sll x30,x27,x30
	bne x30,x0,L.293
	addi x10,x27,0
	jal x0,L.286
L.293:
	la x30,float_exception_flags
	lb x29,0(x30)
	ori x29,x29,1
	sb x29,0(x30)
	addi x12,x27,0
	jal x1,extractFloat32Sign
	sw x10,-16+16(x8)
	la x30,float_rounding_mode
	lb x23,0(x30)
	beq x23,x0,L.298
	li x30,2
	beq x23,x30,L.301
	li x30,3
	beq x23,x30,L.305
	jal x0,L.295
L.298:
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,126
	bne x30,x29,L.296
	addi x12,x27,0
	jal x1,extractFloat32Frac
	beq x10,x0,L.296
	lw x12,-16+16(x8)
	li x13,127
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.286
L.301:
	lw x30,-16+16(x8)
	beq x30,x0,L.303
	li x22,0xbf800000
	jal x0,L.304
L.303:
	addi x22,x0,0
L.304:
	addi x10,x22,0
	jal x0,L.286
L.305:
	lw x30,-16+16(x8)
	beq x30,x0,L.307
	li x21,0x80000000
	jal x0,L.308
L.307:
	li x21,0x3f800000
L.308:
	addi x10,x21,0
	jal x0,L.286
L.295:
L.296:
	lw x12,-16+16(x8)
	addi x13,x0,0
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.286
L.291:
	li x30,1
	addi x24,x30,0
	li x29,150
	slli x28,x25,8*(4-2)
	srai x28,x28,8*(4-2)
	sub x29,x29,x28
	sll x24,x24,x29
	sub x30,x24,x30
	sw x30,-12+16(x8)
	addi x26,x27,0
	la x30,float_rounding_mode
	lb x30,0(x30)
	sw x30,-8+16(x8)
	lw x30,-8+16(x8)
	bne x30,x0,L.309
	addi x30,x26,0
	li x29,1
	srl x29,x24,x29
	add x30,x30,x29
	addi x26,x30,0
	addi x30,x26,0
	lw x29,-12+16(x8)
	and x30,x30,x29
	bne x30,x0,L.310
	addi x30,x26,0
	xori x29,x24,-1
	and x30,x30,x29
	addi x26,x30,0
	jal x0,L.310
L.309:
	lw x30,-8+16(x8)
	li x29,1
	beq x30,x29,L.313
	addi x12,x26,0
	jal x1,extractFloat32Sign
	addi x30,x10,0
	lw x29,-8+16(x8)
	li x28,3
	bne x29,x28,L.318
	li x23,1
	jal x0,L.319
L.318:
	addi x23,x0,0
L.319:
	xor x30,x30,x23
	beq x30,x0,L.315
	addi x30,x26,0
	lw x29,-12+16(x8)
	add x30,x30,x29
	addi x26,x30,0
L.315:
L.313:
L.310:
	addi x30,x26,0
	lw x29,-12+16(x8)
	xori x29,x29,-1
	and x30,x30,x29
	addi x26,x30,0
	beq x26,x27,L.320
	la x30,float_exception_flags
	lb x29,0(x30)
	ori x29,x29,1
	sb x29,0(x30)
L.320:
	addi x10,x26,0
L.286:
	lw x1,24(x2)
	lw x21,28(x2)
	lw x22,32(x2)
	lw x23,36(x2)
	lw x24,40(x2)
	lw x25,44(x2)
	lw x26,48(x2)
	lw x27,52(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align	4
addFloat32Sigs:
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
	sw x14,24(x8)
	lw x12,0+16(x8)
	jal x1,extractFloat32Frac
	sw x10,-8+16(x8)
	lw x12,0+16(x8)
	jal x1,extractFloat32Exp
	addi x30,x10,0
	addi x27,x30,0
	lw x12,4+16(x8)
	jal x1,extractFloat32Frac
	sw x10,-12+16(x8)
	lw x12,4+16(x8)
	jal x1,extractFloat32Exp
	addi x23,x10,0
	slli x30,x27,8*(4-2)
	srai x30,x30,8*(4-2)
	slli x29,x23,8*(4-2)
	srai x29,x29,8*(4-2)
	sub x30,x30,x29
	addi x25,x30,0
	li x30,6
	lw x29,-8+16(x8)
	sll x29,x29,x30
	sw x29,-8+16(x8)
	lw x29,-12+16(x8)
	sll x30,x29,x30
	sw x30,-12+16(x8)
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	bge x0,x30,L.323
	slli x30,x27,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.325
	lw x30,-8+16(x8)
	beq x30,x0,L.327
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.322
L.327:
	lw x10,0+16(x8)
	jal x0,L.322
L.325:
	slli x30,x23,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.329
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,-1
	addi x25,x30,0
	jal x0,L.330
L.329:
	lw x30,-12+16(x8)
	li x29,0x20000000
	or x30,x30,x29
	sw x30,-12+16(x8)
L.330:
	lw x12,-12+16(x8)
	slli x13,x25,8*(4-2)
	srai x13,x13,8*(4-2)
	addi x14,x8,-12+16
	jal x1,shift32RightJamming
	addi x24,x27,0
	jal x0,L.324
L.323:
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	bge x30,x0,L.331
	slli x30,x23,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.333
	lw x30,-12+16(x8)
	beq x30,x0,L.335
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.322
L.335:
	lw x12,8+16(x8)
	li x13,255
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.322
L.333:
	slli x30,x27,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.337
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,1
	addi x25,x30,0
	jal x0,L.338
L.337:
	lw x30,-8+16(x8)
	li x29,0x20000000
	or x30,x30,x29
	sw x30,-8+16(x8)
L.338:
	lw x12,-8+16(x8)
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	sub x30,x0,x30
	slli x13,x30,8*(4-2)
	srai x13,x13,8*(4-2)
	addi x14,x8,-8+16
	jal x1,shift32RightJamming
	addi x24,x23,0
	jal x0,L.332
L.331:
	slli x30,x27,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.339
	lw x30,-8+16(x8)
	lw x29,-12+16(x8)
	or x30,x30,x29
	beq x30,x0,L.341
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.322
L.341:
	lw x10,0+16(x8)
	jal x0,L.322
L.339:
	slli x30,x27,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.343
	lw x12,8+16(x8)
	addi x13,x0,0
	lw x30,-8+16(x8)
	lw x29,-12+16(x8)
	add x30,x30,x29
	li x29,6
	srl x14,x30,x29
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.322
L.343:
	lw x30,-8+16(x8)
	li x29,0x40000000
	add x30,x30,x29
	lw x29,-12+16(x8)
	add x26,x30,x29
	addi x24,x27,0
	jal x0,L.345
L.332:
L.324:
	lw x30,-8+16(x8)
	li x29,0x20000000
	or x30,x30,x29
	sw x30,-8+16(x8)
	li x30,1
	lw x29,-8+16(x8)
	lw x28,-12+16(x8)
	add x29,x29,x28
	sll x26,x29,x30
	slli x29,x24,8*(4-2)
	srai x29,x29,8*(4-2)
	sub x30,x29,x30
	addi x24,x30,0
	addi x30,x26,0
	bge x30,x0,L.346
	lw x30,-8+16(x8)
	lw x29,-12+16(x8)
	add x26,x30,x29
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,1
	addi x24,x30,0
L.346:
L.345:
	lw x12,8+16(x8)
	slli x13,x24,8*(4-2)
	srai x13,x13,8*(4-2)
	addi x14,x26,0
	jal x1,roundAndPackFloat32
	addi x30,x10,0
L.322:
	lw x1,24(x2)
	lw x23,28(x2)
	lw x24,32(x2)
	lw x25,36(x2)
	lw x26,40(x2)
	lw x27,44(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align	4
subFloat32Sigs:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x21,28(x2)
	sw x22,32(x2)
	sw x23,36(x2)
	sw x24,40(x2)
	sw x25,44(x2)
	sw x26,48(x2)
	sw x27,52(x2)
	mv x27,x12
	sw x13,20(x8)
	sw x14,24(x8)
	addi x12,x27,0
	jal x1,extractFloat32Frac
	sw x10,-8+16(x8)
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	addi x26,x30,0
	lw x12,4+16(x8)
	jal x1,extractFloat32Frac
	sw x10,-12+16(x8)
	lw x12,4+16(x8)
	jal x1,extractFloat32Exp
	addi x24,x10,0
	slli x30,x26,8*(4-2)
	srai x30,x30,8*(4-2)
	slli x29,x24,8*(4-2)
	srai x29,x29,8*(4-2)
	sub x30,x30,x29
	addi x25,x30,0
	li x30,7
	lw x29,-8+16(x8)
	sll x29,x29,x30
	sw x29,-8+16(x8)
	lw x29,-12+16(x8)
	sll x30,x29,x30
	sw x30,-12+16(x8)
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	bge x0,x30,L.349
	jal x0,L.351
L.349:
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	bge x30,x0,L.352
	jal x0,L.354
L.352:
	slli x30,x26,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.355
	lw x30,-8+16(x8)
	lw x29,-12+16(x8)
	or x30,x30,x29
	beq x30,x0,L.357
	addi x12,x27,0
	lw x13,4+16(x8)
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.348
L.357:
	li x12,16
	jal x1,float_raise
	li x10,-1
	jal x0,L.348
L.355:
	slli x30,x26,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.359
	li x30,1
	addi x26,x30,0
	addi x24,x30,0
L.359:
	lw x30,-12+16(x8)
	lw x29,-8+16(x8)
	bgeu x30,x29,L.361
	jal x0,L.363
L.361:
	lw x30,-8+16(x8)
	lw x29,-12+16(x8)
	bgeu x30,x29,L.364
	jal x0,L.366
L.364:
	la x30,float_rounding_mode
	lb x30,0(x30)
	li x29,2
	bne x30,x29,L.368
	li x21,1
	jal x0,L.369
L.368:
	addi x21,x0,0
L.369:
	addi x12,x21,0
	addi x13,x0,0
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.348
L.354:
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.370
	lw x30,-12+16(x8)
	beq x30,x0,L.372
	addi x12,x27,0
	lw x13,4+16(x8)
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.348
L.372:
	lw x30,8+16(x8)
	xori x12,x30,1
	li x13,255
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.348
L.370:
	slli x30,x26,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.374
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,1
	addi x25,x30,0
	jal x0,L.375
L.374:
	lw x30,-8+16(x8)
	li x29,0x40000000
	or x30,x30,x29
	sw x30,-8+16(x8)
L.375:
	lw x12,-8+16(x8)
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	sub x30,x0,x30
	slli x13,x30,8*(4-2)
	srai x13,x13,8*(4-2)
	addi x14,x8,-8+16
	jal x1,shift32RightJamming
	lw x30,-12+16(x8)
	li x29,0x40000000
	or x30,x30,x29
	sw x30,-12+16(x8)
L.366:
	lw x30,-12+16(x8)
	lw x29,-8+16(x8)
	sub x22,x30,x29
	addi x23,x24,0
	lw x30,8+16(x8)
	xori x30,x30,1
	sw x30,8+16(x8)
	jal x0,L.376
L.351:
	slli x30,x26,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.377
	lw x30,-8+16(x8)
	beq x30,x0,L.379
	addi x12,x27,0
	lw x13,4+16(x8)
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.348
L.379:
	addi x10,x27,0
	jal x0,L.348
L.377:
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	bne x30,x0,L.381
	slli x30,x25,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,-1
	addi x25,x30,0
	jal x0,L.382
L.381:
	lw x30,-12+16(x8)
	li x29,0x40000000
	or x30,x30,x29
	sw x30,-12+16(x8)
L.382:
	lw x12,-12+16(x8)
	slli x13,x25,8*(4-2)
	srai x13,x13,8*(4-2)
	addi x14,x8,-12+16
	jal x1,shift32RightJamming
	lw x30,-8+16(x8)
	li x29,0x40000000
	or x30,x30,x29
	sw x30,-8+16(x8)
L.363:
	lw x30,-8+16(x8)
	lw x29,-12+16(x8)
	sub x22,x30,x29
	addi x23,x26,0
L.376:
	slli x30,x23,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,-1
	addi x23,x30,0
	lw x12,8+16(x8)
	slli x13,x23,8*(4-2)
	srai x13,x13,8*(4-2)
	addi x14,x22,0
	jal x1,normalizeRoundAndPackFloat32
	addi x30,x10,0
L.348:
	lw x1,24(x2)
	lw x21,28(x2)
	lw x22,32(x2)
	lw x23,36(x2)
	lw x24,40(x2)
	lw x25,44(x2)
	lw x26,48(x2)
	lw x27,52(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.globl float32_add
	.align	4
float32_add:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x12,0+16(x8)
	jal x1,extractFloat32Sign
	addi x27,x10,0
	lw x12,4+16(x8)
	jal x1,extractFloat32Sign
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	bne x27,x30,L.384
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	addi x14,x27,0
	jal x1,addFloat32Sigs
	addi x30,x10,0
	jal x0,L.383
L.384:
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	addi x14,x27,0
	jal x1,subFloat32Sigs
	addi x30,x10,0
L.383:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl float32_sub
	.align	4
float32_sub:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x12,0+16(x8)
	jal x1,extractFloat32Sign
	addi x27,x10,0
	lw x12,4+16(x8)
	jal x1,extractFloat32Sign
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	bne x27,x30,L.387
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	addi x14,x27,0
	jal x1,subFloat32Sigs
	addi x30,x10,0
	jal x0,L.386
L.387:
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	addi x14,x27,0
	jal x1,addFloat32Sigs
	addi x30,x10,0
L.386:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl float32_mul
	.align	4
float32_mul:
	addi x2,x2,-96
	sw  x8,92(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,extractFloat32Frac
	sw x10,-12+48(x8)
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	sh x30,-16+48(x8)
	addi x12,x27,0
	jal x1,extractFloat32Sign
	sw x10,-28+48(x8)
	addi x12,x26,0
	jal x1,extractFloat32Frac
	sw x10,-8+48(x8)
	addi x12,x26,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	sh x30,-14+48(x8)
	addi x12,x26,0
	jal x1,extractFloat32Sign
	sw x10,-32+48(x8)
	lw x30,-28+48(x8)
	lw x29,-32+48(x8)
	xor x25,x30,x29
	lh x30,-16+48(x8)
	li x29,255
	bne x30,x29,L.390
	lw x29,-12+48(x8)
	bne x29,x0,L.394
	lh x29,-14+48(x8)
	li x28,255
	bne x29,x28,L.392
	lw x29,-8+48(x8)
	beq x29,x0,L.392
L.394:
	addi x12,x27,0
	addi x13,x26,0
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.389
L.392:
	lh x30,-14+48(x8)
	lw x29,-8+48(x8)
	or x30,x30,x29
	bne x30,x0,L.395
	li x12,16
	jal x1,float_raise
	li x10,-1
	jal x0,L.389
L.395:
	addi x12,x25,0
	li x13,255
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.389
L.390:
	lh x30,-14+48(x8)
	li x29,255
	bne x30,x29,L.397
	lw x30,-8+48(x8)
	beq x30,x0,L.399
	addi x12,x27,0
	addi x13,x26,0
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.389
L.399:
	lh x30,-16+48(x8)
	lw x29,-12+48(x8)
	or x30,x30,x29
	bne x30,x0,L.401
	li x12,16
	jal x1,float_raise
	li x10,-1
	jal x0,L.389
L.401:
	addi x12,x25,0
	li x13,255
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.389
L.397:
	lh x30,-16+48(x8)
	bne x30,x0,L.403
	lw x30,-12+48(x8)
	bne x30,x0,L.405
	addi x12,x25,0
	addi x13,x0,0
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.389
L.405:
	lw x12,-12+48(x8)
	addi x13,x8,-16+48
	addi x14,x8,-12+48
	jal x1,normalizeFloat32Subnormal
L.403:
	lh x30,-14+48(x8)
	bne x30,x0,L.407
	lw x30,-8+48(x8)
	bne x30,x0,L.409
	addi x12,x25,0
	addi x13,x0,0
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.389
L.409:
	lw x12,-8+48(x8)
	addi x13,x8,-14+48
	addi x14,x8,-8+48
	jal x1,normalizeFloat32Subnormal
L.407:
	lh x30,-16+48(x8)
	lh x29,-14+48(x8)
	add x30,x30,x29
	addi x30,x30,-127
	sh x30,-22+48(x8)
	li x30,0x800000
	lw x29,-12+48(x8)
	or x29,x29,x30
	li x28,7
	sll x29,x29,x28
	sw x29,-12+48(x8)
	lw x29,-8+48(x8)
	or x30,x29,x30
	li x29,8
	sll x30,x30,x29
	sw x30,-8+48(x8)
	lw x12,-12+48(x8)
	lw x13,-8+48(x8)
	addi x14,x8,-20+48
	addi x15,x8,-36+48
	jal x1,mul32To64
	lw x30,-36+48(x8)
	beq x30,x0,L.412
	li x24,1
	jal x0,L.413
L.412:
	addi x24,x0,0
L.413:
	lw x30,-20+48(x8)
	addi x29,x24,0
	or x30,x30,x29
	sw x30,-20+48(x8)
	lw x30,-20+48(x8)
	li x29,1
	sll x30,x30,x29
	bgt x0,x30,L.414
	li x30,1
	lw x29,-20+48(x8)
	sll x29,x29,x30
	sw x29,-20+48(x8)
	lh x29,-22+48(x8)
	sub x30,x29,x30
	sh x30,-22+48(x8)
L.414:
	addi x12,x25,0
	lh x13,-22+48(x8)
	lw x14,-20+48(x8)
	jal x1,roundAndPackFloat32
	addi x30,x10,0
L.389:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,92(x2)
	addi  x2,x2,96
	jalr x0,x1,0

	.globl float32_div
	.align	4
float32_div:
	addi x2,x2,-112
	sw  x8,108(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x23,28(x2)
	sw x24,32(x2)
	sw x25,36(x2)
	sw x26,40(x2)
	sw x27,44(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,extractFloat32Frac
	sw x10,-20+48(x8)
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	sh x30,-24+48(x8)
	addi x12,x27,0
	jal x1,extractFloat32Sign
	sw x10,-32+48(x8)
	addi x12,x26,0
	jal x1,extractFloat32Frac
	sw x10,-12+48(x8)
	addi x12,x26,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	sh x30,-22+48(x8)
	addi x12,x26,0
	jal x1,extractFloat32Sign
	sw x10,-36+48(x8)
	lw x30,-32+48(x8)
	lw x29,-36+48(x8)
	xor x24,x30,x29
	lh x30,-24+48(x8)
	li x29,255
	bne x30,x29,L.417
	lw x30,-20+48(x8)
	beq x30,x0,L.419
	addi x12,x27,0
	addi x13,x26,0
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.416
L.419:
	lh x30,-22+48(x8)
	li x29,255
	bne x30,x29,L.421
	lw x30,-12+48(x8)
	beq x30,x0,L.423
	addi x12,x27,0
	addi x13,x26,0
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.416
L.423:
	li x12,16
	jal x1,float_raise
	li x10,-1
	jal x0,L.416
L.421:
	addi x12,x24,0
	li x13,255
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.416
L.417:
	lh x30,-22+48(x8)
	li x29,255
	bne x30,x29,L.425
	lw x30,-12+48(x8)
	beq x30,x0,L.427
	addi x12,x27,0
	addi x13,x26,0
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.416
L.427:
	addi x12,x24,0
	addi x13,x0,0
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.416
L.425:
	lh x30,-22+48(x8)
	bne x30,x0,L.429
	lw x30,-12+48(x8)
	bne x30,x0,L.431
	lh x30,-24+48(x8)
	lw x29,-20+48(x8)
	or x30,x30,x29
	bne x30,x0,L.433
	li x12,16
	jal x1,float_raise
	li x10,-1
	jal x0,L.416
L.433:
	li x12,8
	jal x1,float_raise
	addi x12,x24,0
	li x13,255
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.416
L.431:
	lw x12,-12+48(x8)
	addi x13,x8,-22+48
	addi x14,x8,-12+48
	jal x1,normalizeFloat32Subnormal
L.429:
	lh x30,-24+48(x8)
	bne x30,x0,L.435
	lw x30,-20+48(x8)
	bne x30,x0,L.437
	addi x12,x24,0
	addi x13,x0,0
	addi x14,x0,0
	jal x1,packFloat32
	addi x30,x10,0
	jal x0,L.416
L.437:
	lw x12,-20+48(x8)
	addi x13,x8,-24+48
	addi x14,x8,-20+48
	jal x1,normalizeFloat32Subnormal
L.435:
	lh x30,-24+48(x8)
	lh x29,-22+48(x8)
	sub x30,x30,x29
	addi x30,x30,125
	sh x30,-26+48(x8)
	li x30,0x800000
	lw x29,-20+48(x8)
	or x29,x29,x30
	li x28,7
	sll x29,x29,x28
	sw x29,-20+48(x8)
	lw x29,-12+48(x8)
	or x30,x29,x30
	li x29,8
	sll x30,x30,x29
	sw x30,-12+48(x8)
	lw x30,-20+48(x8)
	lw x29,-12+48(x8)
	add x30,x30,x30
	bgtu x29,x30,L.439
	li x30,1
	lw x29,-20+48(x8)
	srl x29,x29,x30
	sw x29,-20+48(x8)
	lh x29,-26+48(x8)
	add x30,x29,x30
	sh x30,-26+48(x8)
L.439:
	lw x12,-20+48(x8)
	addi x13,x0,0
	lw x14,-12+48(x8)
	jal x1,estimateDiv64To32
	addi x25,x10,0
	li x30,63
	and x30,x25,x30
	li x29,2
	bgtu x30,x29,L.441
	lw x12,-12+48(x8)
	addi x13,x25,0
	addi x14,x8,-40+48
	addi x15,x8,-44+48
	jal x1,mul32To64
	lw x12,-20+48(x8)
	addi x13,x0,0
	lw x14,-40+48(x8)
	lw x15,-44+48(x8)
	addi x16,x8,-8+48
	addi x17,x8,-16+48
	jal x1,sub64
	jal x0,L.444
L.443:
	li x30,1
	sub x25,x25,x30
	lw x12,-8+48(x8)
	lw x13,-16+48(x8)
	addi x14,x0,0
	lw x15,-12+48(x8)
	addi x16,x8,-8+48
	addi x17,x8,-16+48
	jal x1,add64
L.444:
	lw x30,-8+48(x8)
	blt x30,x0,L.443
	lw x30,-16+48(x8)
	beq x30,x0,L.447
	li x23,1
	jal x0,L.448
L.447:
	addi x23,x0,0
L.448:
	addi x30,x23,0
	or x25,x25,x30
L.441:
	addi x12,x24,0
	lh x13,-26+48(x8)
	addi x14,x25,0
	jal x1,roundAndPackFloat32
	addi x30,x10,0
L.416:
	lw x1,24(x2)
	lw x23,28(x2)
	lw x24,32(x2)
	lw x25,36(x2)
	lw x26,40(x2)
	lw x27,44(x2)
	lw  x8,108(x2)
	addi  x2,x2,112
	jalr x0,x1,0

	.globl float32_rem
	.align	4
float32_rem:
	addi x2,x2,-112
	sw  x8,108(x2)
	addi  x8,x2,80
	sw x1,24(x2)
	sw x19,28(x2)
	sw x20,32(x2)
	sw x21,36(x2)
	sw x22,40(x2)
	sw x23,44(x2)
	sw x24,48(x2)
	sw x25,52(x2)
	sw x26,56(x2)
	sw x27,60(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,extractFloat32Frac
	sw x10,-8+32(x8)
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	sh x30,-16+32(x8)
	addi x12,x27,0
	jal x1,extractFloat32Sign
	sw x10,-20+32(x8)
	addi x12,x26,0
	jal x1,extractFloat32Frac
	sw x10,-12+32(x8)
	addi x12,x26,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	sh x30,-14+32(x8)
	addi x12,x26,0
	jal x1,extractFloat32Sign
	sw x10,-24+32(x8)
	lh x30,-16+32(x8)
	li x29,255
	bne x30,x29,L.450
	lw x29,-8+32(x8)
	bne x29,x0,L.454
	lh x29,-14+32(x8)
	li x28,255
	bne x29,x28,L.452
	lw x29,-12+32(x8)
	beq x29,x0,L.452
L.454:
	addi x12,x27,0
	addi x13,x26,0
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.449
L.452:
	li x12,16
	jal x1,float_raise
	li x10,-1
	jal x0,L.449
L.450:
	lh x30,-14+32(x8)
	li x29,255
	bne x30,x29,L.455
	lw x30,-12+32(x8)
	beq x30,x0,L.457
	addi x12,x27,0
	addi x13,x26,0
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.449
L.457:
	addi x10,x27,0
	jal x0,L.449
L.455:
	lh x30,-14+32(x8)
	bne x30,x0,L.459
	lw x30,-12+32(x8)
	bne x30,x0,L.461
	li x12,16
	jal x1,float_raise
	li x10,-1
	jal x0,L.449
L.461:
	lw x12,-12+32(x8)
	addi x13,x8,-14+32
	addi x14,x8,-12+32
	jal x1,normalizeFloat32Subnormal
L.459:
	lh x30,-16+32(x8)
	bne x30,x0,L.463
	lw x30,-8+32(x8)
	bne x30,x0,L.465
	addi x10,x27,0
	jal x0,L.449
L.465:
	lw x12,-8+32(x8)
	addi x13,x8,-16+32
	addi x14,x8,-8+32
	jal x1,normalizeFloat32Subnormal
L.463:
	lh x30,-16+32(x8)
	lh x29,-14+32(x8)
	sub x30,x30,x29
	addi x24,x30,0
	li x30,0x800000
	li x29,8
	lw x28,-8+32(x8)
	or x28,x28,x30
	sll x28,x28,x29
	sw x28,-8+32(x8)
	lw x28,-12+32(x8)
	or x30,x28,x30
	sll x30,x30,x29
	sw x30,-12+32(x8)
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	bge x30,x0,L.467
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,-1
	bge x30,x29,L.469
	addi x10,x27,0
	jal x0,L.449
L.469:
	lw x30,-8+32(x8)
	li x29,1
	srl x30,x30,x29
	sw x30,-8+32(x8)
L.467:
	lw x30,-12+32(x8)
	lw x29,-8+32(x8)
	bgtu x30,x29,L.472
	li x20,1
	jal x0,L.473
L.472:
	addi x20,x0,0
L.473:
	addi x25,x20,0
	beq x25,x0,L.474
	lw x30,-8+32(x8)
	lw x29,-12+32(x8)
	sub x30,x30,x29
	sw x30,-8+32(x8)
L.474:
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,-32
	addi x24,x30,0
	jal x0,L.477
L.476:
	lw x12,-8+32(x8)
	addi x13,x0,0
	lw x14,-12+32(x8)
	jal x1,estimateDiv64To32
	addi x25,x10,0
	li x30,2
	bgeu x30,x25,L.480
	li x30,2
	sub x19,x25,x30
	jal x0,L.481
L.480:
	addi x19,x0,0
L.481:
	addi x25,x19,0
	lw x30,-12+32(x8)
	li x29,2
	srl x30,x30,x29
	mul x30,x30,x25
	xori x30,x30,-1
	li x29,1
	add x30,x30,x29
	sw x30,-8+32(x8)
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,-30
	addi x24,x30,0
L.477:
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	blt x0,x30,L.476
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	addi x30,x30,32
	addi x24,x30,0
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	bge x0,x30,L.482
	lw x12,-8+32(x8)
	addi x13,x0,0
	lw x14,-12+32(x8)
	jal x1,estimateDiv64To32
	addi x25,x10,0
	li x30,2
	bgeu x30,x25,L.485
	li x30,2
	sub x19,x25,x30
	jal x0,L.486
L.485:
	addi x19,x0,0
L.486:
	addi x25,x19,0
	slli x30,x24,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,32
	sub x29,x29,x30
	srl x25,x25,x29
	lw x29,-12+32(x8)
	li x28,2
	srl x29,x29,x28
	sw x29,-12+32(x8)
	li x29,1
	lw x28,-8+32(x8)
	srl x28,x28,x29
	sub x30,x30,x29
	sll x30,x28,x30
	lw x29,-12+32(x8)
	mul x29,x29,x25
	sub x30,x30,x29
	sw x30,-8+32(x8)
	jal x0,L.483
L.482:
	li x30,2
	lw x29,-8+32(x8)
	srl x29,x29,x30
	sw x29,-8+32(x8)
	lw x29,-12+32(x8)
	srl x30,x29,x30
	sw x30,-12+32(x8)
L.483:
L.487:
	lw x30,-8+32(x8)
	addi x23,x30,0
	li x29,1
	add x25,x25,x29
	lw x29,-12+32(x8)
	sub x30,x30,x29
	sw x30,-8+32(x8)
L.488:
	lw x30,-8+32(x8)
	ble x0,x30,L.487
	lw x30,-8+32(x8)
	add x30,x30,x23
	addi x21,x30,0
	blt x21,x0,L.492
	bne x21,x0,L.490
	li x30,1
	and x30,x25,x30
	beq x30,x0,L.490
L.492:
	sw x23,-8+32(x8)
L.490:
	lw x30,-8+32(x8)
	bge x30,x0,L.494
	li x19,1
	jal x0,L.495
L.494:
	addi x19,x0,0
L.495:
	addi x22,x19,0
	beq x22,x0,L.496
	lw x30,-8+32(x8)
	xori x30,x30,-1
	li x29,1
	add x30,x30,x29
	sw x30,-8+32(x8)
L.496:
	lw x30,-20+32(x8)
	xor x12,x30,x22
	lh x13,-14+32(x8)
	lw x14,-8+32(x8)
	jal x1,normalizeRoundAndPackFloat32
	addi x30,x10,0
L.449:
	lw x1,24(x2)
	lw x19,28(x2)
	lw x20,32(x2)
	lw x21,36(x2)
	lw x22,40(x2)
	lw x23,44(x2)
	lw x24,48(x2)
	lw x25,52(x2)
	lw x26,56(x2)
	lw x27,60(x2)
	lw  x8,108(x2)
	addi  x2,x2,112
	jalr x0,x1,0

	.globl float32_sqrt
	.align	4
float32_sqrt:
	addi x2,x2,-96
	sw  x8,92(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	addi x12,x27,0
	jal x1,extractFloat32Frac
	sw x10,-20+48(x8)
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	sh x30,-22+48(x8)
	addi x12,x27,0
	jal x1,extractFloat32Sign
	sw x10,-36+48(x8)
	lh x30,-22+48(x8)
	li x29,255
	bne x30,x29,L.499
	lw x30,-20+48(x8)
	beq x30,x0,L.501
	addi x12,x27,0
	addi x13,x0,0
	jal x1,propagateFloat32NaN
	addi x30,x10,0
	jal x0,L.498
L.501:
	lw x30,-36+48(x8)
	bne x30,x0,L.503
	addi x10,x27,0
	jal x0,L.498
L.503:
	li x12,16
	jal x1,float_raise
	li x10,-1
	jal x0,L.498
L.499:
	lw x30,-36+48(x8)
	beq x30,x0,L.505
	lh x30,-22+48(x8)
	lw x29,-20+48(x8)
	or x30,x30,x29
	bne x30,x0,L.507
	addi x10,x27,0
	jal x0,L.498
L.507:
	li x12,16
	jal x1,float_raise
	li x10,-1
	jal x0,L.498
L.505:
	lh x30,-22+48(x8)
	bne x30,x0,L.509
	lw x30,-20+48(x8)
	bne x30,x0,L.511
	addi x10,x0,0
	jal x0,L.498
L.511:
	lw x12,-20+48(x8)
	addi x13,x8,-22+48
	addi x14,x8,-20+48
	jal x1,normalizeFloat32Subnormal
L.509:
	lh x30,-22+48(x8)
	addi x29,x30,-127
	li x28,1
	sra x29,x29,x28
	addi x29,x29,126
	sh x29,-38+48(x8)
	lw x29,-20+48(x8)
	li x28,0x800000
	or x29,x29,x28
	li x28,8
	sll x29,x29,x28
	sw x29,-20+48(x8)
	addi x12,x30,0
	lw x13,-20+48(x8)
	jal x1,estimateSqrt32
	li x29,2
	add x30,x10,x29
	sw x30,-8+48(x8)
	lw x30,-8+48(x8)
	li x29,127
	and x30,x30,x29
	li x29,5
	bgtu x30,x29,L.513
	lw x30,-8+48(x8)
	li x29,2
	bgeu x30,x29,L.515
	li x30,0x7fffffff
	sw x30,-8+48(x8)
	jal x0,L.517
L.515:
	lw x30,-20+48(x8)
	lh x29,-22+48(x8)
	andi x29,x29,1
	srl x30,x30,x29
	sw x30,-20+48(x8)
	lw x30,-8+48(x8)
	addi x12,x30,0
	addi x13,x30,0
	addi x14,x8,-32+48
	addi x15,x8,-16+48
	jal x1,mul32To64
	lw x12,-20+48(x8)
	addi x13,x0,0
	lw x14,-32+48(x8)
	lw x15,-16+48(x8)
	addi x16,x8,-12+48
	addi x17,x8,-28+48
	jal x1,sub64
	jal x0,L.519
L.518:
	lw x30,-8+48(x8)
	li x29,1
	sub x30,x30,x29
	sw x30,-8+48(x8)
	addi x12,x0,0
	lw x13,-8+48(x8)
	li x14,1
	addi x15,x8,-32+48
	addi x16,x8,-16+48
	jal x1,shortShift64Left
	lw x30,-16+48(x8)
	li x29,1
	or x30,x30,x29
	sw x30,-16+48(x8)
	lw x12,-12+48(x8)
	lw x13,-28+48(x8)
	lw x14,-32+48(x8)
	lw x15,-16+48(x8)
	addi x16,x8,-12+48
	addi x17,x8,-28+48
	jal x1,add64
L.519:
	lw x30,-12+48(x8)
	blt x30,x0,L.518
	lw x30,-12+48(x8)
	lw x29,-28+48(x8)
	or x30,x30,x29
	beq x30,x0,L.522
	li x26,1
	jal x0,L.523
L.522:
	addi x26,x0,0
L.523:
	lw x30,-8+48(x8)
	addi x29,x26,0
	or x30,x30,x29
	sw x30,-8+48(x8)
L.513:
	lw x12,-8+48(x8)
	li x13,1
	addi x14,x8,-8+48
	jal x1,shift32RightJamming
L.517:
	addi x12,x0,0
	lh x13,-38+48(x8)
	lw x14,-8+48(x8)
	jal x1,roundAndPackFloat32
	addi x30,x10,0
L.498:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,92(x2)
	addi  x2,x2,96
	jalr x0,x1,0

	.globl float32_eq
	.align	4
float32_eq:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.528
	addi x12,x27,0
	jal x1,extractFloat32Frac
	addi x30,x10,0
	bne x30,x0,L.527
L.528:
	addi x12,x26,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.525
	addi x12,x26,0
	jal x1,extractFloat32Frac
	beq x10,x0,L.525
L.527:
	addi x12,x27,0
	jal x1,float32_is_signaling_nan
	addi x30,x10,0
	bne x30,x0,L.531
	addi x12,x26,0
	jal x1,float32_is_signaling_nan
	beq x10,x0,L.529
L.531:
	li x12,16
	jal x1,float_raise
L.529:
	addi x10,x0,0
	jal x0,L.524
L.525:
	beq x27,x26,L.535
	or x30,x27,x26
	li x29,1
	sll x30,x30,x29
	bne x30,x0,L.533
L.535:
	li x25,1
	jal x0,L.534
L.533:
	addi x25,x0,0
L.534:
	addi x10,x25,0
L.524:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl float32_le
	.align	4
float32_le:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x22,28(x2)
	sw x23,32(x2)
	sw x24,36(x2)
	sw x25,40(x2)
	sw x26,44(x2)
	sw x27,48(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.540
	addi x12,x27,0
	jal x1,extractFloat32Frac
	addi x30,x10,0
	bne x30,x0,L.539
L.540:
	addi x12,x26,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.537
	addi x12,x26,0
	jal x1,extractFloat32Frac
	beq x10,x0,L.537
L.539:
	li x12,16
	jal x1,float_raise
	addi x10,x0,0
	jal x0,L.536
L.537:
	addi x12,x27,0
	jal x1,extractFloat32Sign
	addi x25,x10,0
	addi x12,x26,0
	jal x1,extractFloat32Sign
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x25,x30,L.541
	bne x25,x0,L.546
	or x30,x27,x26
	li x29,1
	sll x30,x30,x29
	bne x30,x0,L.544
L.546:
	li x24,1
	jal x0,L.545
L.544:
	addi x24,x0,0
L.545:
	addi x10,x24,0
	jal x0,L.536
L.541:
	beq x27,x26,L.551
	bge x27,x26,L.552
	li x22,1
	jal x0,L.553
L.552:
	addi x22,x0,0
L.553:
	xor x30,x25,x22
	beq x30,x0,L.549
L.551:
	li x23,1
	jal x0,L.550
L.549:
	addi x23,x0,0
L.550:
	addi x10,x23,0
L.536:
	lw x1,24(x2)
	lw x22,28(x2)
	lw x23,32(x2)
	lw x24,36(x2)
	lw x25,40(x2)
	lw x26,44(x2)
	lw x27,48(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.globl float32_lt
	.align	4
float32_lt:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x22,28(x2)
	sw x23,32(x2)
	sw x24,36(x2)
	sw x25,40(x2)
	sw x26,44(x2)
	sw x27,48(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.558
	addi x12,x27,0
	jal x1,extractFloat32Frac
	addi x30,x10,0
	bne x30,x0,L.557
L.558:
	addi x12,x26,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.555
	addi x12,x26,0
	jal x1,extractFloat32Frac
	beq x10,x0,L.555
L.557:
	li x12,16
	jal x1,float_raise
	addi x10,x0,0
	jal x0,L.554
L.555:
	addi x12,x27,0
	jal x1,extractFloat32Sign
	addi x25,x10,0
	addi x12,x26,0
	jal x1,extractFloat32Sign
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x25,x30,L.559
	beq x25,x0,L.562
	or x30,x27,x26
	li x29,1
	sll x30,x30,x29
	beq x30,x0,L.562
	li x24,1
	jal x0,L.563
L.562:
	addi x24,x0,0
L.563:
	addi x10,x24,0
	jal x0,L.554
L.559:
	beq x27,x26,L.566
	bge x27,x26,L.568
	li x22,1
	jal x0,L.569
L.568:
	addi x22,x0,0
L.569:
	xor x30,x25,x22
	beq x30,x0,L.566
	li x23,1
	jal x0,L.567
L.566:
	addi x23,x0,0
L.567:
	addi x10,x23,0
L.554:
	lw x1,24(x2)
	lw x22,28(x2)
	lw x23,32(x2)
	lw x24,36(x2)
	lw x25,40(x2)
	lw x26,44(x2)
	lw x27,48(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.globl float32_eq_signaling
	.align	4
float32_eq_signaling:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.574
	addi x12,x27,0
	jal x1,extractFloat32Frac
	addi x30,x10,0
	bne x30,x0,L.573
L.574:
	addi x12,x26,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.571
	addi x12,x26,0
	jal x1,extractFloat32Frac
	beq x10,x0,L.571
L.573:
	li x12,16
	jal x1,float_raise
	addi x10,x0,0
	jal x0,L.570
L.571:
	beq x27,x26,L.578
	or x30,x27,x26
	li x29,1
	sll x30,x30,x29
	bne x30,x0,L.576
L.578:
	li x25,1
	jal x0,L.577
L.576:
	addi x25,x0,0
L.577:
	addi x10,x25,0
L.570:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl float32_le_quiet
	.align	4
float32_le_quiet:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x22,28(x2)
	sw x23,32(x2)
	sw x24,36(x2)
	sw x25,40(x2)
	sw x26,44(x2)
	sw x27,48(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.583
	addi x12,x27,0
	jal x1,extractFloat32Frac
	addi x30,x10,0
	bne x30,x0,L.582
L.583:
	addi x12,x26,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.580
	addi x12,x26,0
	jal x1,extractFloat32Frac
	beq x10,x0,L.580
L.582:
	addi x12,x27,0
	jal x1,float32_is_signaling_nan
	addi x30,x10,0
	bne x30,x0,L.586
	addi x12,x26,0
	jal x1,float32_is_signaling_nan
	beq x10,x0,L.584
L.586:
	li x12,16
	jal x1,float_raise
L.584:
	addi x10,x0,0
	jal x0,L.579
L.580:
	addi x12,x27,0
	jal x1,extractFloat32Sign
	addi x25,x10,0
	addi x12,x26,0
	jal x1,extractFloat32Sign
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x25,x30,L.587
	bne x25,x0,L.592
	or x30,x27,x26
	li x29,1
	sll x30,x30,x29
	bne x30,x0,L.590
L.592:
	li x24,1
	jal x0,L.591
L.590:
	addi x24,x0,0
L.591:
	addi x10,x24,0
	jal x0,L.579
L.587:
	beq x27,x26,L.597
	bge x27,x26,L.598
	li x22,1
	jal x0,L.599
L.598:
	addi x22,x0,0
L.599:
	xor x30,x25,x22
	beq x30,x0,L.595
L.597:
	li x23,1
	jal x0,L.596
L.595:
	addi x23,x0,0
L.596:
	addi x10,x23,0
L.579:
	lw x1,24(x2)
	lw x22,28(x2)
	lw x23,32(x2)
	lw x24,36(x2)
	lw x25,40(x2)
	lw x26,44(x2)
	lw x27,48(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.globl float32_lt_quiet
	.align	4
float32_lt_quiet:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x22,28(x2)
	sw x23,32(x2)
	sw x24,36(x2)
	sw x25,40(x2)
	sw x26,44(x2)
	sw x27,48(x2)
	mv x27,x12
	mv x26,x13
	addi x12,x27,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.604
	addi x12,x27,0
	jal x1,extractFloat32Frac
	addi x30,x10,0
	bne x30,x0,L.603
L.604:
	addi x12,x26,0
	jal x1,extractFloat32Exp
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srai x30,x30,8*(4-2)
	li x29,255
	bne x30,x29,L.601
	addi x12,x26,0
	jal x1,extractFloat32Frac
	beq x10,x0,L.601
L.603:
	addi x12,x27,0
	jal x1,float32_is_signaling_nan
	addi x30,x10,0
	bne x30,x0,L.607
	addi x12,x26,0
	jal x1,float32_is_signaling_nan
	beq x10,x0,L.605
L.607:
	li x12,16
	jal x1,float_raise
L.605:
	addi x10,x0,0
	jal x0,L.600
L.601:
	addi x12,x27,0
	jal x1,extractFloat32Sign
	addi x25,x10,0
	addi x12,x26,0
	jal x1,extractFloat32Sign
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x25,x30,L.608
	beq x25,x0,L.611
	or x30,x27,x26
	li x29,1
	sll x30,x30,x29
	beq x30,x0,L.611
	li x24,1
	jal x0,L.612
L.611:
	addi x24,x0,0
L.612:
	addi x10,x24,0
	jal x0,L.600
L.608:
	beq x27,x26,L.615
	bge x27,x26,L.617
	li x22,1
	jal x0,L.618
L.617:
	addi x22,x0,0
L.618:
	xor x30,x25,x22
	beq x30,x0,L.615
	li x23,1
	jal x0,L.616
L.615:
	addi x23,x0,0
L.616:
	addi x10,x23,0
L.600:
	lw x1,24(x2)
	lw x22,28(x2)
	lw x23,32(x2)
	lw x24,36(x2)
	lw x25,40(x2)
	lw x26,44(x2)
	lw x27,48(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.globl float32_neg
	.align	4
float32_neg:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	addi x30,x12,0
	bne x30,x0,L.621
	addi x27,x0,0
	jal x0,L.622
L.621:
	addi x30,x12,0
	li x29,0x80000000
	xor x27,x30,x29
L.622:
	addi x10,x27,0
L.619:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl float32_gt
	.align	4
float32_gt:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	jal x1,float32_le
	addi x30,x10,0
	bne x30,x0,L.625
	li x27,1
	jal x0,L.626
L.625:
	addi x27,x0,0
L.626:
	addi x10,x27,0
L.623:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl float32_ge
	.align	4
float32_ge:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	jal x1,float32_lt
	addi x30,x10,0
	bne x30,x0,L.629
	li x27,1
	jal x0,L.630
L.629:
	addi x27,x0,0
L.630:
	addi x10,x27,0
L.627:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl float32_ne
	.align	4
float32_ne:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	jal x1,float32_eq
	addi x30,x10,0
	bne x30,x0,L.633
	li x27,1
	jal x0,L.634
L.633:
	addi x27,x0,0
L.634:
	addi x10,x27,0
L.631:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align 4

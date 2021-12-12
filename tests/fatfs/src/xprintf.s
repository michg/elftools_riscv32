	.align 4
	.text
	.globl xputc
	.align	4
xputc:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	lw x30,0+16(x8)
	sb x30,0+16(x8)
	lb x30,0+16(x8)
	li x29,10
	bne x30,x29,L.2
	li x12,13
	jal x1,xputc
L.2:
	la x30,outptr
	lw x30,0(x30)
	beq x30,x0,L.4
	la x30,outptr
	lw x29,0(x30)
	li x28,1
	add x28,x29,x28
	sw x28,0(x30)
	lb x30,0+16(x8)
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	sb x30,0(x29)
	jal x0,L.1
L.4:
	la x30,xfunc_out
	lw x30,0(x30)
	beq x30,x0,L.6
	lb x30,0+16(x8)
	slli x12,x30,8*(4-1)
	srli x12,x12,8*(4-1)
	la x30,xfunc_out
	lw x31,0(x30)
	jalr x1,x31,0
L.6:
L.1:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.globl xputs
	.align	4
xputs:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	mv x27,x12
	jal x0,L.10
L.9:
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lb x12,0(x30)
	jal x1,xputc
L.10:
	lb x30,0(x27)
	bne x30,x0,L.9
L.8:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl xfputs
	.align	4
xfputs:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	mv x27,x13
	la x30,xfunc_out
	lw x29,0(x30)
	sw x29,-8+16(x8)
	lw x29,0+16(x8)
	sw x29,0(x30)
	jal x0,L.14
L.13:
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lb x12,0(x30)
	jal x1,xputc
L.14:
	lb x30,0(x27)
	bne x30,x0,L.13
	la x30,xfunc_out
	lw x29,-8+16(x8)
	sw x29,0(x30)
L.12:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
xvprintf:
	addi x2,x2,-128
	sw  x8,124(x2)
	addi  x8,x2,80
	sw x1,24(x2)
	sw x18,28(x2)
	sw x19,32(x2)
	sw x20,36(x2)
	sw x21,40(x2)
	sw x22,44(x2)
	sw x23,48(x2)
	sw x24,52(x2)
	sw x25,56(x2)
	sw x26,60(x2)
	sw x27,64(x2)
	mv x27,x12
	mv x26,x13
L.17:
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lb x25,0(x30)
	slli x30,x25,8*(4-1)
	srai x30,x30,8*(4-1)
	bne x30,x0,L.21
	jal x0,L.19
L.21:
	slli x30,x25,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,37
	beq x30,x29,L.23
	slli x12,x25,8*(4-1)
	srai x12,x12,8*(4-1)
	jal x1,xputc
	jal x0,L.17
L.23:
	addi x18,x0,0
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lb x25,0(x30)
	slli x30,x25,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,48
	bne x30,x29,L.25
	li x18,1
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lb x25,0(x30)
	jal x0,L.26
L.25:
	slli x30,x25,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,45
	bne x30,x29,L.27
	li x18,2
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lb x25,0(x30)
L.27:
L.26:
	addi x23,x0,0
	jal x0,L.32
L.29:
	li x30,10
	mul x30,x30,x23
	slli x29,x25,8*(4-1)
	srai x29,x29,8*(4-1)
	add x30,x30,x29
	li x29,48
	sub x23,x30,x29
L.30:
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lb x25,0(x30)
L.32:
	slli x30,x25,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,48
	blt x30,x29,L.33
	li x29,57
	ble x30,x29,L.29
L.33:
	slli x30,x25,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,108
	beq x30,x29,L.36
	li x29,76
	bne x30,x29,L.34
L.36:
	li x30,4
	or x18,x18,x30
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lb x25,0(x30)
L.34:
	slli x30,x25,8*(4-1)
	srai x30,x30,8*(4-1)
	bne x30,x0,L.37
	jal x0,L.19
L.37:
	addi x24,x25,0
	slli x30,x24,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,97
	blt x30,x29,L.39
	slli x30,x24,8*(4-1)
	srai x30,x30,8*(4-1)
	addi x30,x30,-32
	addi x24,x30,0
L.39:
	slli x30,x24,8*(4-1)
	srai x30,x30,8*(4-1)
	sw x30,-28+48(x8)
	lw x30,-28+48(x8)
	li x29,79
	beq x30,x29,L.58
	bgt x30,x29,L.62
L.61:
	lw x30,-28+48(x8)
	li x29,66
	beq x30,x29,L.57
	li x29,67
	beq x30,x29,L.56
	li x29,68
	beq x30,x29,L.59
	jal x0,L.41
L.62:
	lw x30,-28+48(x8)
	li x29,83
	beq x30,x29,L.44
	li x29,85
	beq x30,x29,L.59
	li x29,88
	beq x30,x29,L.60
	jal x0,L.41
L.44:
	li x30,4
	add x30,x26,x30
	addi x26,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-24+48(x8)
	addi x20,x0,0
	jal x0,L.48
L.45:
L.46:
	li x30,1
	add x20,x20,x30
L.48:
	lw x30,-24+48(x8)
	add x30,x20,x30
	lb x30,0(x30)
	bne x30,x0,L.45
	jal x0,L.50
L.49:
	li x12,32
	jal x1,xputc
L.50:
	li x30,2
	and x30,x18,x30
	bne x30,x0,L.52
	addi x30,x20,0
	li x29,1
	add x20,x30,x29
	bltu x30,x23,L.49
L.52:
	lw x12,-24+48(x8)
	jal x1,xputs
	jal x0,L.54
L.53:
	li x12,32
	jal x1,xputc
L.54:
	addi x30,x20,0
	li x29,1
	add x20,x30,x29
	bltu x30,x23,L.53
	jal x0,L.17
L.56:
	li x30,4
	add x30,x26,x30
	addi x26,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	slli x12,x30,8*(4-1)
	srai x12,x12,8*(4-1)
	jal x1,xputc
	jal x0,L.17
L.57:
	li x19,2
	jal x0,L.42
L.58:
	li x19,8
	jal x0,L.42
L.59:
	li x19,10
	jal x0,L.42
L.60:
	li x19,16
	jal x0,L.42
L.41:
	slli x12,x25,8*(4-1)
	srai x12,x12,8*(4-1)
	jal x1,xputc
	jal x0,L.17
L.42:
	li x30,4
	and x30,x18,x30
	beq x30,x0,L.65
	li x30,4
	add x30,x26,x30
	addi x26,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-32+48(x8)
	jal x0,L.66
L.65:
	slli x30,x24,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,68
	bne x30,x29,L.67
	li x30,4
	add x30,x26,x30
	addi x26,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-36+48(x8)
	jal x0,L.68
L.67:
	li x30,4
	add x30,x26,x30
	addi x26,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-36+48(x8)
L.68:
	lw x30,-36+48(x8)
	sw x30,-32+48(x8)
L.66:
	lw x30,-32+48(x8)
	addi x21,x30,0
	slli x30,x24,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,68
	bne x30,x29,L.69
	li x30,0x80000000
	and x30,x21,x30
	beq x30,x0,L.69
	sub x21,x0,x21
	li x30,8
	or x18,x18,x30
L.69:
	addi x22,x0,0
L.71:
	remu x30,x21,x19
	addi x24,x30,0
	divu x21,x21,x19
	slli x30,x24,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,9
	ble x30,x29,L.74
	slli x30,x25,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,120
	bne x30,x29,L.77
	li x30,39
	sw x30,-40+48(x8)
	jal x0,L.78
L.77:
	li x30,7
	sw x30,-40+48(x8)
L.78:
	slli x30,x24,8*(4-1)
	srai x30,x30,8*(4-1)
	lw x29,-40+48(x8)
	add x30,x30,x29
	addi x24,x30,0
L.74:
	addi x30,x22,0
	li x29,1
	add x22,x30,x29
	addi x29,x8,-20+48
	add x30,x30,x29
	slli x29,x24,8*(4-1)
	srai x29,x29,8*(4-1)
	addi x29,x29,48
	sb x29,0(x30)
L.72:
	beq x21,x0,L.79
	li x30,16
	bltu x22,x30,L.71
L.79:
	li x30,8
	and x30,x18,x30
	beq x30,x0,L.80
	addi x30,x22,0
	li x29,1
	add x22,x30,x29
	addi x29,x8,-20+48
	add x30,x30,x29
	li x29,45
	sb x29,0(x30)
L.80:
	addi x20,x22,0
	li x30,1
	and x30,x18,x30
	beq x30,x0,L.83
	li x30,48
	sw x30,-40+48(x8)
	jal x0,L.84
L.83:
	li x30,32
	sw x30,-40+48(x8)
L.84:
	lw x30,-40+48(x8)
	addi x24,x30,0
	jal x0,L.86
L.85:
	slli x12,x24,8*(4-1)
	srai x12,x12,8*(4-1)
	jal x1,xputc
L.86:
	li x30,2
	and x30,x18,x30
	bne x30,x0,L.88
	addi x30,x20,0
	li x29,1
	add x20,x30,x29
	bltu x30,x23,L.85
L.88:
L.89:
	li x30,1
	sub x30,x22,x30
	addi x22,x30,0
	addi x29,x8,-20+48
	add x30,x30,x29
	lb x12,0(x30)
	jal x1,xputc
L.90:
	bne x22,x0,L.89
	jal x0,L.93
L.92:
	li x12,32
	jal x1,xputc
L.93:
	addi x30,x20,0
	li x29,1
	add x20,x30,x29
	bltu x30,x23,L.92
	jal x0,L.17
L.19:
L.16:
	lw x1,24(x2)
	lw x18,28(x2)
	lw x19,32(x2)
	lw x20,36(x2)
	lw x21,40(x2)
	lw x22,44(x2)
	lw x23,48(x2)
	lw x24,52(x2)
	lw x25,56(x2)
	lw x26,60(x2)
	lw x27,64(x2)
	lw  x8,124(x2)
	addi  x2,x2,128
	jalr x0,x1,0

	.globl xprintf
	.align	4
xprintf:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	sw x14,24(x8)
	sw x15,28(x8)
	sw x16,32(x8)
	sw x17,36(x8)
	addi x30,x8,4+16
	sw x30,-8+16(x8)
	lw x12,0+16(x8)
	lw x13,-8+16(x8)
	jal x1,xvprintf
L.95:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.globl xsprintf
	.align	4
xsprintf:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	sw x14,24(x8)
	sw x15,28(x8)
	sw x16,32(x8)
	sw x17,36(x8)
	la x30,outptr
	lw x29,0+16(x8)
	sw x29,0(x30)
	addi x30,x8,8+16
	sw x30,-8+16(x8)
	lw x12,4+16(x8)
	lw x13,-8+16(x8)
	jal x1,xvprintf
	la x30,outptr
	lw x30,0(x30)
	sb x0,0(x30)
	la x30,outptr
	sw x0,0(x30)
L.98:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.globl xfprintf
	.align	4
xfprintf:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	sw x14,24(x8)
	sw x15,28(x8)
	sw x16,32(x8)
	sw x17,36(x8)
	la x30,xfunc_out
	lw x29,0(x30)
	sw x29,-12+16(x8)
	lw x29,0+16(x8)
	sw x29,0(x30)
	addi x30,x8,8+16
	sw x30,-8+16(x8)
	lw x12,4+16(x8)
	lw x13,-8+16(x8)
	jal x1,xvprintf
	la x30,xfunc_out
	lw x29,-12+16(x8)
	sw x29,0(x30)
L.101:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.globl put_dump
	.align	4
put_dump:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	mv x27,x14
	sw x15,28(x8)
	la x12,L.105
	lw x13,4+16(x8)
	jal x1,xprintf
	lw x30,12+16(x8)
	li x29,1
	beq x30,x29,L.108
	li x29,2
	beq x30,x29,L.121
	li x29,4
	beq x30,x29,L.126
	jal x0,L.106
L.108:
	lw x25,0+16(x8)
	addi x26,x0,0
	jal x0,L.112
L.109:
	la x12,L.113
	add x30,x26,x25
	lbu x13,0(x30)
	jal x1,xprintf
L.110:
	addi x26,x26,1
L.112:
	blt x26,x27,L.109
	li x12,32
	jal x1,xputc
	addi x26,x0,0
	jal x0,L.117
L.114:
	add x30,x26,x25
	lbu x30,0(x30)
	li x29,32
	blt x30,x29,L.119
	li x29,126
	bgt x30,x29,L.119
	add x30,x26,x25
	lbu x24,0(x30)
	jal x0,L.120
L.119:
	li x24,46
L.120:
	addi x30,x24,0
	slli x12,x30,8*(4-1)
	srai x12,x12,8*(4-1)
	jal x1,xputc
L.115:
	addi x26,x26,1
L.117:
	blt x26,x27,L.114
	jal x0,L.107
L.121:
	lw x30,0+16(x8)
	sw x30,-8+16(x8)
L.122:
	la x12,L.125
	lw x30,-8+16(x8)
	li x29,2
	add x29,x30,x29
	sw x29,-8+16(x8)
	lhu x13,0(x30)
	jal x1,xprintf
L.123:
	addi x30,x27,-1
	addi x27,x30,0
	bne x30,x0,L.122
	jal x0,L.107
L.126:
	lw x30,0+16(x8)
	sw x30,-12+16(x8)
L.127:
	la x12,L.130
	lw x30,-12+16(x8)
	li x29,4
	add x29,x30,x29
	sw x29,-12+16(x8)
	lw x13,0(x30)
	jal x1,xprintf
L.128:
	addi x30,x27,-1
	addi x27,x30,0
	bne x30,x0,L.127
L.106:
L.107:
	li x12,10
	jal x1,xputc
L.104:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align 4
	.bss
	.align	4
outptr:
	.space	4
	.globl xfunc_out
	.align	4
xfunc_out:
	.space	4
	.align 4
	.data
	.align	1
L.130:
	.byte	0x20
	.byte	0x25
	.byte	0x30
	.byte	0x38
	.byte	0x4c
	.byte	0x58
	.byte	0x0
	.align	1
L.125:
	.byte	0x20
	.byte	0x25
	.byte	0x30
	.byte	0x34
	.byte	0x58
	.byte	0x0
	.align	1
L.113:
	.byte	0x20
	.byte	0x25
	.byte	0x30
	.byte	0x32
	.byte	0x58
	.byte	0x0
	.align	1
L.105:
	.byte	0x25
	.byte	0x30
	.byte	0x38
	.byte	0x6c
	.byte	0x58
	.byte	0x20
	.byte	0x0
	.align 4

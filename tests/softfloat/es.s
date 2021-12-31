	.align 4
	.text
	.globl strlen
	.align	4
strlen:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	addi x27,x0,0
	jal x0,L.3
L.2:
	addi x27,x27,1
L.3:
	addi x30,x12,0
	li x29,1
	add x12,x30,x29
	lb x30,0(x30)
	bne x30,x0,L.2
	addi x10,x27,0
L.1:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align 4
	.data
	.align	4
smalltable:
	.word	0xa4fb11f
	.word	0x24e69595
	.word	0x322bcc77
	.word	0x38d1b717
	.word	0x3c23d70a
	.word	0x3dcccccd
	.word	0x3f800000
	.align	4
largetable:
	.word	0x749dc5ae
	.word	0x5a0e1bca
	.word	0x4cbebc20
	.word	0x461c4000
	.word	0x42c80000
	.word	0x41200000
	.align 4
	.text
	.align	4
trim_zeros:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	jal x0,L.7
L.6:
	li x30,-1
	add x12,x12,x30
L.7:
	lb x30,0(x12)
	li x29,48
	beq x30,x29,L.6
	lb x30,0(x12)
	li x29,46
	beq x30,x29,L.9
	li x30,1
	add x12,x12,x30
L.9:
	addi x10,x12,0
L.5:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
format_float:
	addi x2,x2,-96
	sw  x8,92(x2)
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
	mv x25,x14
	mv x24,x15
	mv x23,x16
	li x30,2
	add x19,x23,x30
	addi x12,x27,0
	la x30,L.14
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.12
	addi x12,x27,0
	jal x1,float32_neg
	addi x27,x10,0
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,32
	addi x25,x30,0
L.12:
	bge x26,x0,L.15
	addi x26,x0,0
L.15:
	addi x22,x0,0
	jal x0,L.20
L.17:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	add x30,x30,x23
	li x29,48
	sb x29,0(x30)
L.18:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	addi x30,x30,1
	addi x22,x30,0
L.20:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,30
	blt x30,x29,L.17
	addi x12,x27,0
	la x30,L.14
	lw x13,0(x30)
	jal x1,float32_ne
	bne x10,x0,L.21
	li x30,1
	add x26,x26,x30
	addi x21,x30,0
	jal x0,L.22
L.21:
	li x21,1
	li x20,32
	addi x22,x0,0
	jal x0,L.24
L.26:
	addi x12,x27,0
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,2
	sll x30,x30,x29
	la x29,smalltable
	add x30,x30,x29
	lw x13,0(x30)
	jal x1,float32_div
	addi x27,x10,0
	sub x21,x21,x20
L.27:
	addi x12,x27,0
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,2
	sll x30,x30,x29
	la x29,smalltable+4
	add x30,x30,x29
	lw x13,0(x30)
	jal x1,float32_lt
	bne x10,x0,L.26
	li x30,1
	sra x20,x20,x30
	slli x29,x22,8*(4-1)
	srli x29,x29,8*(4-1)
	add x30,x29,x30
	addi x22,x30,0
L.24:
	addi x12,x27,0
	la x30,L.30
	lw x13,0(x30)
	jal x1,float32_lt
	bne x10,x0,L.27
	li x20,32
	addi x22,x0,0
	jal x0,L.32
L.34:
	addi x12,x27,0
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,2
	sll x30,x30,x29
	la x29,largetable
	add x30,x30,x29
	lw x13,0(x30)
	jal x1,float32_div
	addi x27,x10,0
	add x21,x21,x20
	li x30,1000
	ble x21,x30,L.37
	li x30,73
	sb x30,0(x23)
	li x30,1
	add x30,x23,x30
	li x29,110
	sb x29,0(x30)
	li x30,2
	add x30,x23,x30
	li x29,102
	sb x29,0(x30)
	li x30,3
	add x30,x23,x30
	sb x0,0(x30)
	addi x10,x23,0
	jal x0,L.11
L.37:
L.35:
	addi x12,x27,0
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,2
	sll x30,x30,x29
	la x29,largetable
	add x30,x30,x29
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.34
	li x30,1
	sra x20,x20,x30
	slli x29,x22,8*(4-1)
	srli x29,x29,8*(4-1)
	add x30,x29,x30
	addi x22,x30,0
L.32:
	addi x12,x27,0
	la x30,L.39
	lw x13,0(x30)
	jal x1,float32_ge
	bne x10,x0,L.35
L.22:
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	beq x30,x0,L.40
	li x30,-4
	ble x21,x30,L.42
	bgt x21,x26,L.42
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,2
	addi x24,x30,0
L.42:
L.40:
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,2
	beq x30,x0,L.44
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	bne x30,x0,L.46
	add x26,x26,x21
	bge x26,x0,L.48
	sub x21,x21,x26
	addi x26,x0,0
L.48:
L.46:
	li x30,27
	ble x21,x30,L.50
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,-3
	addi x24,x30,0
L.50:
L.44:
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,2
	beq x30,x0,L.52
	li x30,27
	ble x26,x30,L.54
	li x26,27
L.54:
	li x30,1
	bge x21,x30,L.53
	li x30,1
	sub x30,x30,x21
	sw x30,-8+16(x8)
	lw x30,-8+16(x8)
	li x29,27
	ble x30,x29,L.58
	li x30,27
	sw x30,-8+16(x8)
L.58:
	lw x30,-8+16(x8)
	add x19,x30,x19
	jal x0,L.53
L.52:
	li x30,23
	ble x26,x30,L.60
	li x26,23
L.60:
L.53:
	addi x22,x0,0
	jal x0,L.65
L.62:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,8
	blt x30,x29,L.66
	addi x30,x19,0
	li x29,1
	add x19,x30,x29
	li x29,48
	sb x29,0(x30)
	jal x0,L.67
L.66:
	addi x12,x27,0
	jal x1,float32_to_int32
	sw x10,-8+16(x8)
	addi x30,x19,0
	li x29,1
	add x19,x30,x29
	lw x29,-8+16(x8)
	addi x29,x29,48
	sb x29,0(x30)
	lw x12,-8+16(x8)
	jal x1,int32_to_float32
	addi x30,x10,0
	addi x12,x27,0
	addi x13,x30,0
	jal x1,float32_sub
	addi x30,x10,0
	la x29,L.39
	lw x12,0(x29)
	addi x13,x30,0
	jal x1,float32_mul
	addi x27,x10,0
L.67:
L.63:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	addi x30,x30,1
	addi x22,x30,0
L.65:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	ble x30,x26,L.62
	li x30,-1
	add x30,x19,x30
	addi x19,x30,0
	addi x18,x30,0
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,8
	ble x30,x29,L.68
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	addi x30,x30,-8
	sub x19,x19,x30
L.68:
	lb x30,0(x19)
	li x29,53
	blt x30,x29,L.70
L.72:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.76
	li x30,49
	sb x30,0(x19)
	addi x21,x21,1
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,6
	li x29,2
	bne x30,x29,L.74
	li x30,1
	add x26,x26,x30
	add x18,x18,x30
	jal x0,L.74
L.76:
	addi x30,x19,0
	li x29,-1
	add x19,x30,x29
	li x29,48
	sb x29,0(x30)
	lb x30,0(x19)
	li x29,57
	beq x30,x29,L.72
	lb x30,0(x19)
	addi x30,x30,1
	sb x30,0(x19)
L.74:
L.70:
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,2
	beq x30,x0,L.82
	li x30,1
	ble x21,x30,L.85
	sw x21,-12+16(x8)
	jal x0,L.86
L.85:
	li x30,1
	sw x30,-12+16(x8)
L.86:
	lw x30,-12+16(x8)
	sw x30,-8+16(x8)
	li x30,1
	add x19,x23,x30
	addi x22,x0,0
	jal x0,L.90
L.87:
	li x30,1
	add x30,x19,x30
	lb x30,0(x30)
	sb x30,0(x19)
	li x30,1
	add x19,x19,x30
L.88:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	addi x30,x30,1
	addi x22,x30,0
L.90:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	lw x29,-8+16(x8)
	blt x30,x29,L.87
	li x30,1
	add x30,x19,x30
	addi x29,x18,0
	bltu x30,x29,L.93
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	beq x30,x0,L.91
L.93:
	li x30,46
	sb x30,0(x19)
	li x30,4
	slli x28,x24,8*(4-1)
	srli x28,x28,8*(4-1)
	and x28,x28,x30
	beq x28,x0,L.83
	slli x28,x25,8*(4-1)
	srli x28,x28,8*(4-1)
	and x30,x28,x30
	bne x30,x0,L.83
	li x30,-1
	add x12,x18,x30
	jal x1,trim_zeros
	addi x18,x10,0
	jal x0,L.83
L.91:
	li x30,-1
	add x18,x18,x30
	jal x0,L.83
L.82:
	li x30,1
	add x30,x23,x30
	li x29,2
	add x29,x23,x29
	lb x29,0(x29)
	sb x29,0(x30)
	li x30,2
	add x30,x23,x30
	li x29,46
	sb x29,0(x30)
	li x30,4
	slli x28,x24,8*(4-1)
	srli x28,x28,8*(4-1)
	and x28,x28,x30
	beq x28,x0,L.96
	slli x28,x25,8*(4-1)
	srli x28,x28,8*(4-1)
	and x30,x28,x30
	bne x30,x0,L.96
	li x30,-1
	add x12,x18,x30
	jal x1,trim_zeros
	addi x18,x10,0
L.96:
	addi x30,x18,0
	li x29,1
	add x18,x30,x29
	slli x28,x24,8*(4-1)
	srli x28,x28,8*(4-1)
	and x29,x28,x29
	beq x29,x0,L.99
	li x29,69
	sw x29,-8+16(x8)
	jal x0,L.100
L.99:
	li x29,101
	sw x29,-8+16(x8)
L.100:
	lw x29,-8+16(x8)
	sb x29,0(x30)
	addi x30,x21,-1
	addi x21,x30,0
	bge x30,x0,L.101
	addi x30,x18,0
	li x29,1
	add x18,x30,x29
	li x29,45
	sb x29,0(x30)
	sub x21,x0,x21
	jal x0,L.102
L.101:
	addi x30,x18,0
	li x29,1
	add x18,x30,x29
	li x29,43
	sb x29,0(x30)
L.102:
	li x30,99
	ble x21,x30,L.103
	addi x30,x18,0
	li x29,1
	add x18,x30,x29
	li x29,100
	div x29,x21,x29
	addi x29,x29,48
	sb x29,0(x30)
	li x30,100
	rem x21,x21,x30
L.103:
	addi x30,x18,0
	li x29,1
	add x18,x30,x29
	li x29,10
	div x29,x21,x29
	addi x29,x29,48
	sb x29,0(x30)
	addi x30,x18,0
	li x29,1
	add x18,x30,x29
	li x29,10
	rem x29,x21,x29
	addi x29,x29,48
	sb x29,0(x30)
L.83:
	li x30,1
	add x19,x23,x30
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,32
	beq x30,x0,L.105
	li x30,-1
	add x30,x19,x30
	addi x19,x30,0
	li x29,45
	sb x29,0(x30)
	jal x0,L.106
L.105:
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,8
	beq x30,x0,L.107
	li x30,-1
	add x30,x19,x30
	addi x19,x30,0
	li x29,43
	sb x29,0(x30)
	jal x0,L.108
L.107:
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,16
	beq x30,x0,L.109
	li x30,-1
	add x30,x19,x30
	addi x19,x30,0
	li x29,32
	sb x29,0(x30)
L.109:
L.108:
L.106:
	sb x0,0(x18)
	addi x10,x19,0
L.11:
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
	lw  x8,92(x2)
	addi  x2,x2,96
	jalr x0,x1,0

	.align	4
doprnt:
	addi x2,x2,-144
	sw  x8,140(x2)
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
	mv x25,x14
	mv x24,x15
	sh x0,-8+64(x8)
	sb x0,-18+64(x8)
	jal x0,L.114
L.113:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,37
	bne x30,x29,L.116
	addi x20,x8,-18+64
	li x22,-1
	addi x21,x0,0
	sb x0,-17+64(x8)
	addi x18,x0,0
L.119:
	li x30,1
	add x30,x25,x30
	addi x25,x30,0
	lb x23,0(x30)
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,48
	bne x30,x29,L.123
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,2
	addi x18,x30,0
	jal x0,L.119
L.123:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,43
	bne x30,x29,L.125
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,8
	addi x18,x30,0
	jal x0,L.119
L.125:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,45
	bne x30,x29,L.127
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,1
	addi x18,x30,0
	jal x0,L.119
L.127:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,32
	bne x30,x29,L.129
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,16
	addi x18,x30,0
	jal x0,L.119
L.129:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,35
	bne x30,x29,L.121
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,4
	addi x18,x30,0
	jal x0,L.119
L.121:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,42
	bne x30,x29,L.136
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	addi x21,x30,0
	li x30,1
	add x30,x25,x30
	addi x25,x30,0
	lb x23,0(x30)
	jal x0,L.134
L.135:
	li x30,10
	slli x29,x21,8*(4-1)
	srai x29,x29,8*(4-1)
	mul x30,x30,x29
	slli x29,x23,8*(4-1)
	srai x29,x29,8*(4-1)
	add x30,x30,x29
	addi x30,x30,-48
	addi x21,x30,0
	li x30,1
	add x30,x25,x30
	addi x25,x30,0
	lb x23,0(x30)
L.136:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,48
	blt x30,x29,L.138
	li x29,57
	ble x30,x29,L.135
L.138:
L.134:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,46
	bne x30,x29,L.139
	addi x22,x0,0
	li x30,1
	add x30,x25,x30
	addi x25,x30,0
	lb x23,0(x30)
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,42
	bne x30,x29,L.144
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	addi x22,x30,0
	li x30,1
	add x30,x25,x30
	addi x25,x30,0
	lb x23,0(x30)
	jal x0,L.142
L.143:
	li x30,10
	slli x29,x22,8*(4-1)
	srai x29,x29,8*(4-1)
	mul x30,x30,x29
	slli x29,x23,8*(4-1)
	srai x29,x29,8*(4-1)
	add x30,x30,x29
	addi x30,x30,-48
	addi x22,x30,0
	li x30,1
	add x30,x25,x30
	addi x25,x30,0
	lb x23,0(x30)
L.144:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,48
	blt x30,x29,L.146
	li x29,57
	ble x30,x29,L.143
L.146:
L.142:
L.139:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,108
	bne x30,x29,L.147
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,64
	addi x18,x30,0
	li x30,1
	add x30,x25,x30
	addi x25,x30,0
	lb x23,0(x30)
L.147:
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	sw x30,-56+64(x8)
	lw x30,-56+64(x8)
	li x29,88
	beq x30,x29,L.165
	bgt x30,x29,L.215
L.214:
	lw x30,-56+64(x8)
	li x29,69
	beq x30,x29,L.205
	li x29,71
	beq x30,x29,L.209
	jal x0,L.149
L.215:
	lw x30,-56+64(x8)
	li x29,99
	blt x30,x29,L.149
	li x29,111
	bgt x30,x29,L.216
	li x29,2
	sll x30,x30,x29
	la x29,L.217-396
	add x30,x30,x29
	lw x30,0(x30)
	jalr x0,x30,0
	.align 4
	.data
	.align	4
L.217:
	.word	L.152
	.word	L.153
	.word	L.206
	.word	L.202
	.word	L.210
	.word	L.149
	.word	L.153
	.word	L.149
	.word	L.149
	.word	L.149
	.word	L.149
	.word	L.149
	.word	L.162
	.align 4
	.text
L.216:
	lw x30,-56+64(x8)
	li x29,115
	beq x30,x29,L.213
	li x29,117
	beq x30,x29,L.159
	li x29,120
	beq x30,x29,L.165
	jal x0,L.149
L.152:
	addi x21,x0,0
	li x30,-1
	add x30,x20,x30
	addi x20,x30,0
	li x29,4
	add x29,x24,x29
	addi x24,x29,0
	li x28,-4
	add x29,x29,x28
	lw x29,0(x29)
	sb x29,0(x30)
	jal x0,L.150
L.153:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,64
	beq x30,x0,L.154
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-12+64(x8)
	jal x0,L.155
L.154:
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-12+64(x8)
L.155:
	li x30,10
	sw x30,-16+64(x8)
	lw x30,-12+64(x8)
	bge x30,x0,L.158
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,32
	addi x18,x30,0
	lw x30,-12+64(x8)
	xori x30,x30,-1
	li x29,1
	add x30,x30,x29
	sw x30,-12+64(x8)
	jal x0,L.158
L.159:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,64
	beq x30,x0,L.160
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-12+64(x8)
	jal x0,L.161
L.160:
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-12+64(x8)
L.161:
	li x30,10
	sw x30,-16+64(x8)
	jal x0,L.158
L.162:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,64
	beq x30,x0,L.163
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-12+64(x8)
	jal x0,L.164
L.163:
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-12+64(x8)
L.164:
	li x30,8
	sw x30,-16+64(x8)
	jal x0,L.158
L.165:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,64
	beq x30,x0,L.166
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-12+64(x8)
	jal x0,L.167
L.166:
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-12+64(x8)
L.167:
	li x30,16
	sw x30,-16+64(x8)
L.158:
	slli x30,x22,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,-1
	bne x30,x29,L.168
	li x22,1
L.168:
	lw x30,-16+64(x8)
	li x29,10
	beq x30,x29,L.170
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,-57
	addi x18,x30,0
	jal x0,L.171
L.170:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,-5
	addi x18,x30,0
L.171:
	sb x21,-5+64(x8)
	lb x30,-5+64(x8)
	li x29,30
	ble x30,x29,L.175
	li x30,30
	sb x30,-5+64(x8)
	jal x0,L.175
L.174:
	lw x30,-12+64(x8)
	lw x29,-16+64(x8)
	remu x30,x30,x29
	li x29,48
	add x30,x30,x29
	addi x19,x30,0
	slli x30,x19,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,57
	ble x30,x29,L.177
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,88
	bne x30,x29,L.179
	slli x30,x19,8*(4-1)
	srai x30,x30,8*(4-1)
	addi x30,x30,7
	addi x19,x30,0
	jal x0,L.180
L.179:
	slli x30,x19,8*(4-1)
	srai x30,x30,8*(4-1)
	addi x30,x30,39
	addi x19,x30,0
L.180:
L.177:
	li x30,-1
	add x30,x20,x30
	addi x20,x30,0
	sb x19,0(x30)
	lw x30,-12+64(x8)
	lw x29,-16+64(x8)
	divu x30,x30,x29
	sw x30,-12+64(x8)
	li x30,1
	lb x29,-5+64(x8)
	sub x29,x29,x30
	sb x29,-5+64(x8)
	slli x29,x22,8*(4-1)
	srai x29,x29,8*(4-1)
	sub x30,x29,x30
	addi x22,x30,0
L.175:
	lw x30,-12+64(x8)
	bne x30,x0,L.174
	slli x30,x22,8*(4-1)
	srai x30,x30,8*(4-1)
	bgt x30,x0,L.174
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,56
	beq x30,x0,L.181
	lb x30,-5+64(x8)
	addi x30,x30,-1
	sb x30,-5+64(x8)
L.181:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	beq x30,x0,L.183
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,111
	bne x30,x29,L.185
	lb x30,-5+64(x8)
	addi x30,x30,-1
	sb x30,-5+64(x8)
	jal x0,L.186
L.185:
	lb x30,-5+64(x8)
	addi x30,x30,-2
	sb x30,-5+64(x8)
L.186:
L.183:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x28,x30,2
	beq x28,x0,L.187
	andi x30,x30,1
	bne x30,x0,L.187
	jal x0,L.190
L.189:
	li x30,-1
	add x30,x20,x30
	addi x20,x30,0
	li x29,48
	sb x29,0(x30)
	lb x30,-5+64(x8)
	addi x30,x30,-1
	sb x30,-5+64(x8)
L.190:
	lb x30,-5+64(x8)
	bgt x30,x0,L.189
L.187:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	beq x30,x0,L.192
	slli x30,x23,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,111
	beq x30,x29,L.194
	li x30,-1
	add x30,x20,x30
	addi x20,x30,0
	sb x23,0(x30)
L.194:
	li x30,-1
	add x30,x20,x30
	addi x20,x30,0
	li x29,48
	sb x29,0(x30)
L.192:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,32
	beq x30,x0,L.196
	li x30,-1
	add x30,x20,x30
	addi x20,x30,0
	li x29,45
	sb x29,0(x30)
	jal x0,L.197
L.196:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,8
	beq x30,x0,L.198
	li x30,-1
	add x30,x20,x30
	addi x20,x30,0
	li x29,43
	sb x29,0(x30)
	jal x0,L.199
L.198:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,16
	beq x30,x0,L.200
	li x30,-1
	add x30,x20,x30
	addi x20,x30,0
	li x29,32
	sb x29,0(x30)
L.200:
L.199:
L.197:
	li x22,-1
	jal x0,L.150
L.202:
	slli x30,x22,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,-1
	bne x30,x29,L.203
	li x22,6
L.203:
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-52+64(x8)
	li x30,2
	sb x30,-17+64(x8)
	lw x12,-52+64(x8)
	slli x13,x22,8*(4-1)
	srai x13,x13,8*(4-1)
	slli x14,x18,8*(4-1)
	srli x14,x14,8*(4-1)
	lbu x15,-17+64(x8)
	addi x16,x8,-48+64
	jal x1,format_float
	addi x20,x10,0
	li x22,-1
	jal x0,L.150
L.205:
	li x30,1
	sb x30,-17+64(x8)
L.206:
	slli x30,x22,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,-1
	bne x30,x29,L.207
	li x22,6
L.207:
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-52+64(x8)
	lw x12,-52+64(x8)
	slli x30,x22,8*(4-1)
	srai x30,x30,8*(4-1)
	addi x13,x30,1
	slli x14,x18,8*(4-1)
	srli x14,x14,8*(4-1)
	lbu x15,-17+64(x8)
	addi x16,x8,-48+64
	jal x1,format_float
	addi x20,x10,0
	li x22,-1
	jal x0,L.150
L.209:
	li x30,1
	sb x30,-17+64(x8)
L.210:
	lbu x30,-17+64(x8)
	ori x30,x30,4
	sb x30,-17+64(x8)
	slli x30,x22,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,-1
	bne x30,x29,L.211
	li x22,6
L.211:
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-52+64(x8)
	lw x12,-52+64(x8)
	slli x13,x22,8*(4-1)
	srai x13,x13,8*(4-1)
	slli x14,x18,8*(4-1)
	srli x14,x14,8*(4-1)
	lbu x15,-17+64(x8)
	addi x16,x8,-48+64
	jal x1,format_float
	addi x20,x10,0
	li x22,-1
	jal x0,L.150
L.213:
	li x30,4
	add x30,x24,x30
	addi x24,x30,0
	li x29,-4
	add x30,x30,x29
	lw x20,0(x30)
	jal x0,L.150
L.149:
	li x30,-1
	add x30,x20,x30
	addi x20,x30,0
	sb x23,0(x30)
L.150:
	addi x12,x20,0
	jal x1,strlen
	addi x30,x10,0
	sb x30,-5+64(x8)
	jal x0,L.220
L.219:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,1
	bne x30,x0,L.224
	slli x30,x21,8*(4-1)
	srai x30,x30,8*(4-1)
	lb x29,-5+64(x8)
	bgt x30,x29,L.222
L.224:
	lb x29,0(x20)
	beq x29,x0,L.222
	slli x29,x22,8*(4-1)
	srai x29,x29,8*(4-1)
	beq x29,x0,L.222
	addi x30,x20,0
	li x29,1
	add x20,x30,x29
	lb x19,0(x30)
	jal x0,L.223
L.222:
	li x19,32
L.223:
	slli x12,x19,8*(4-1)
	srai x12,x12,8*(4-1)
	addi x13,x27,0
	addi x31,x26,0
	jalr x1,x31,0
	li x30,1
	lhu x29,-8+64(x8)
	add x29,x29,x30
	sh x29,-8+64(x8)
	slli x29,x21,8*(4-1)
	srai x29,x29,8*(4-1)
	sub x30,x29,x30
	addi x21,x30,0
	slli x30,x22,8*(4-1)
	srai x30,x30,8*(4-1)
	ble x30,x0,L.225
	slli x30,x22,8*(4-1)
	srai x30,x30,8*(4-1)
	addi x30,x30,-1
	addi x22,x30,0
L.225:
L.220:
	addi x30,x0,0
	lb x29,0(x20)
	beq x29,x30,L.227
	slli x29,x22,8*(4-1)
	srai x29,x29,8*(4-1)
	bne x29,x30,L.219
L.227:
	slli x30,x21,8*(4-1)
	srai x30,x30,8*(4-1)
	bgt x30,x0,L.219
	jal x0,L.117
L.116:
	slli x12,x23,8*(4-1)
	srai x12,x12,8*(4-1)
	addi x13,x27,0
	addi x31,x26,0
	jalr x1,x31,0
	lhu x30,-8+64(x8)
	addi x30,x30,1
	sh x30,-8+64(x8)
L.117:
	li x30,1
	add x25,x25,x30
L.114:
	lb x30,0(x25)
	addi x23,x30,0
	slli x30,x30,8*(4-1)
	srai x30,x30,8*(4-1)
	bne x30,x0,L.113
	lhu x10,-8+64(x8)
L.111:
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
	lw  x8,140(x2)
	addi  x2,x2,144
	jalr x0,x1,0

	.align	4
putout:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x30,0+16(x8)
	sb x30,0+16(x8)
	lb x12,0+16(x8)
	jal x1,bsp_putc
L.228:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.globl printf
	.align	4
printf:
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
	addi x12,x0,0
	la x13,putout
	lw x14,0+16(x8)
	lw x15,-8+16(x8)
	jal x1,doprnt
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	sw x30,-12+16(x8)
	lw x30,-12+16(x8)
	slli x10,x30,8*(4-2)
	srli x10,x10,8*(4-2)
L.229:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align	4
putbuf:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	lw x27,0(x13)
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	sb x12,0(x30)
	sw x27,0(x13)
L.232:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl sprintf
	.align	4
sprintf:
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
	addi x30,x8,8+16
	sw x30,-8+16(x8)
	addi x12,x8,0+16
	la x13,putbuf
	lw x14,4+16(x8)
	lw x15,-8+16(x8)
	jal x1,doprnt
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	sw x30,-12+16(x8)
	lw x30,0+16(x8)
	sb x0,0(x30)
	lw x30,-12+16(x8)
	slli x10,x30,8*(4-2)
	srli x10,x10,8*(4-2)
L.233:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align 4
	.data
	.align	4
L.39:
	.word	0x41200000
	.align	4
L.30:
	.word	0x3f800000
	.align	4
L.14:
	.word	0x0
	.align 4

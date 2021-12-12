	.align 4
	.text
	.globl ff_convert
	.align	4
ff_convert:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	slli x30,x12,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,128
	bge x30,x29,L.8
	slli x10,x12,8*(4-2)
	srli x10,x10,8*(4-2)
	jal x0,L.7
L.8:
	addi x10,x0,0
L.7:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl ff_wtoupper
	.align	4
ff_wtoupper:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	slli x30,x12,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,128
	bge x30,x29,L.11
	slli x30,x12,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,97
	blt x30,x29,L.13
	li x29,122
	bgt x30,x29,L.13
	slli x30,x12,8*(4-2)
	srli x30,x30,8*(4-2)
	andi x30,x30,-33
	addi x12,x30,0
L.13:
	slli x10,x12,8*(4-2)
	srli x10,x10,8*(4-2)
	jal x0,L.10
L.11:
	addi x10,x0,0
L.10:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
mem_cpy:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x26,0(x2)
	sw x27,4(x2)
	addi x27,x12,0
	addi x26,x13,0
	jal x0,L.17
L.16:
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	addi x28,x26,0
	add x26,x28,x29
	lbu x29,0(x28)
	sb x29,0(x30)
L.17:
	addi x30,x14,0
	li x29,1
	sub x14,x30,x29
	bne x30,x0,L.16
L.15:
	lw x26,0(x2)
	lw x27,4(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
mem_set:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	addi x27,x12,0
	jal x0,L.21
L.20:
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	addi x29,x13,0
	sb x29,0(x30)
L.21:
	addi x30,x14,0
	li x29,1
	sub x14,x30,x29
	bne x30,x0,L.20
L.19:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
mem_cmp:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x25,0(x2)
	sw x26,4(x2)
	sw x27,8(x2)
	addi x26,x12,0
	addi x25,x13,0
	addi x27,x0,0
L.24:
L.25:
	addi x30,x14,0
	li x29,1
	sub x14,x30,x29
	beq x30,x0,L.27
	addi x30,x26,0
	li x29,1
	add x26,x30,x29
	addi x28,x25,0
	add x25,x28,x29
	lbu x30,0(x30)
	lbu x29,0(x28)
	sub x30,x30,x29
	addi x27,x30,0
	beq x30,x0,L.24
L.27:
	addi x10,x27,0
L.23:
	lw x25,0(x2)
	lw x26,4(x2)
	lw x27,8(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
chk_chr:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	jal x0,L.30
L.29:
	li x30,1
	add x12,x12,x30
L.30:
	lb x30,0(x12)
	beq x30,x0,L.32
	bne x30,x13,L.29
L.32:
	lb x10,0(x12)
L.28:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
sync_window:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	li x30,4
	add x30,x27,x30
	lbu x30,0(x30)
	beq x30,x0,L.34
	li x30,44
	add x30,x27,x30
	lw x26,0(x30)
	li x30,1
	add x30,x27,x30
	lbu x12,0(x30)
	li x30,48
	add x13,x27,x30
	addi x14,x26,0
	li x15,1
	jal x1,disk_write
	beq x10,x0,L.36
	li x10,1
	jal x0,L.33
L.36:
	li x30,4
	add x30,x27,x30
	sb x0,0(x30)
	li x30,32
	add x30,x27,x30
	lw x30,0(x30)
	sub x30,x26,x30
	li x29,24
	add x29,x27,x29
	lw x29,0(x29)
	bgeu x30,x29,L.38
	li x30,3
	add x30,x27,x30
	lbu x30,0(x30)
	addi x25,x30,0
	jal x0,L.43
L.40:
	li x30,24
	add x30,x27,x30
	lw x30,0(x30)
	add x26,x26,x30
	li x30,1
	add x30,x27,x30
	lbu x12,0(x30)
	li x30,48
	add x13,x27,x30
	addi x14,x26,0
	li x15,1
	jal x1,disk_write
L.41:
	li x30,1
	sub x25,x25,x30
L.43:
	li x30,2
	bgeu x25,x30,L.40
L.38:
L.34:
	addi x10,x0,0
L.33:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
move_window:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	mv x27,x12
	sw x13,20(x8)
	lw x30,4+16(x8)
	li x29,44
	add x29,x27,x29
	lw x29,0(x29)
	beq x30,x29,L.45
	addi x12,x27,0
	jal x1,sync_window
	beq x10,x0,L.47
	li x10,1
	jal x0,L.44
L.47:
	li x30,1
	add x30,x27,x30
	lbu x12,0(x30)
	li x30,48
	add x13,x27,x30
	lw x14,4+16(x8)
	li x15,1
	jal x1,disk_read
	beq x10,x0,L.49
	li x10,1
	jal x0,L.44
L.49:
	li x30,44
	add x30,x27,x30
	lw x29,4+16(x8)
	sw x29,0(x30)
L.45:
	addi x10,x0,0
L.44:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
sync_fs:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	addi x12,x27,0
	jal x1,sync_window
	addi x26,x10,0
	bne x26,x0,L.52
	lbu x30,0(x27)
	li x29,3
	bne x30,x29,L.54
	li x30,5
	add x30,x27,x30
	lbu x30,0(x30)
	li x29,1
	bne x30,x29,L.54
	li x30,48
	add x12,x27,x30
	addi x13,x0,0
	li x14,512
	jal x1,mem_set
	li x30,558
	add x30,x27,x30
	li x29,0xaa55
	sb x29,0(x30)
	li x30,559
	add x30,x27,x30
	li x29,170
	sb x29,0(x30)
	li x30,48
	add x30,x27,x30
	li x29,0x41615252
	sb x29,0(x30)
	li x30,49
	add x30,x27,x30
	li x29,0x41615252
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	li x30,50
	add x30,x27,x30
	li x29,16737
	sb x29,0(x30)
	li x30,51
	add x30,x27,x30
	li x29,65
	sb x29,0(x30)
	li x30,532
	add x30,x27,x30
	li x29,0x61417272
	sb x29,0(x30)
	li x30,533
	add x30,x27,x30
	li x29,0x61417272
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	li x30,534
	add x30,x27,x30
	li x29,24897
	sb x29,0(x30)
	li x30,535
	add x30,x27,x30
	li x29,97
	sb x29,0(x30)
	li x30,536
	add x30,x27,x30
	li x29,16
	add x29,x27,x29
	lw x29,0(x29)
	sb x29,0(x30)
	li x30,537
	add x30,x27,x30
	li x29,16
	add x29,x27,x29
	lw x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	li x30,16
	li x29,538
	add x29,x27,x29
	add x28,x27,x30
	lw x28,0(x28)
	srl x30,x28,x30
	sb x30,0(x29)
	li x30,539
	add x30,x27,x30
	li x29,16
	add x29,x27,x29
	lw x29,0(x29)
	li x28,24
	srl x29,x29,x28
	sb x29,0(x30)
	li x30,540
	add x30,x27,x30
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	sb x29,0(x30)
	li x30,541
	add x30,x27,x30
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	li x30,542
	add x30,x27,x30
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	li x28,16
	srl x29,x29,x28
	sb x29,0(x30)
	li x30,543
	add x30,x27,x30
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	li x28,24
	srl x29,x29,x28
	sb x29,0(x30)
	li x30,44
	add x30,x27,x30
	li x29,28
	add x29,x27,x29
	lw x29,0(x29)
	li x28,1
	add x29,x29,x28
	sw x29,0(x30)
	li x30,1
	add x30,x27,x30
	lbu x12,0(x30)
	li x30,48
	add x13,x27,x30
	li x30,44
	add x30,x27,x30
	lw x14,0(x30)
	li x15,1
	jal x1,disk_write
	li x30,5
	add x30,x27,x30
	sb x0,0(x30)
L.54:
	li x30,1
	add x30,x27,x30
	lbu x12,0(x30)
	addi x13,x0,0
	addi x14,x0,0
	jal x1,disk_ioctl
	beq x10,x0,L.56
	li x26,1
L.56:
L.52:
	addi x10,x26,0
L.51:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl clust2sect
	.align	4
clust2sect:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x30,2
	sub x13,x13,x30
	li x29,20
	add x29,x12,x29
	lw x29,0(x29)
	sub x30,x29,x30
	bltu x13,x30,L.59
	addi x10,x0,0
	jal x0,L.58
L.59:
	li x30,2
	add x30,x12,x30
	lbu x30,0(x30)
	mul x30,x13,x30
	li x29,40
	add x29,x12,x29
	lw x29,0(x29)
	add x10,x30,x29
L.58:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl get_fat
	.align	4
get_fat:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	sw x13,20(x8)
	lw x30,4+16(x8)
	li x29,2
	bltu x30,x29,L.64
	li x29,20
	add x29,x27,x29
	lw x29,0(x29)
	bltu x30,x29,L.62
L.64:
	li x10,1
	jal x0,L.61
L.62:
	lbu x26,0(x27)
	li x30,1
	beq x26,x30,L.68
	li x30,2
	beq x26,x30,L.76
	li x30,3
	beq x26,x30,L.79
	jal x0,L.65
L.68:
	lw x30,4+16(x8)
	sw x30,-8+16(x8)
	lw x30,-8+16(x8)
	li x29,1
	srl x29,x30,x29
	add x30,x30,x29
	sw x30,-8+16(x8)
	addi x12,x27,0
	li x30,32
	add x30,x27,x30
	lw x30,0(x30)
	lw x29,-8+16(x8)
	li x28,9
	srl x29,x29,x28
	add x13,x30,x29
	jal x1,move_window
	beq x10,x0,L.69
	jal x0,L.66
L.69:
	lw x30,-8+16(x8)
	li x29,511
	and x29,x30,x29
	li x28,48
	add x28,x27,x28
	add x29,x29,x28
	lbu x29,0(x29)
	sw x29,-16+16(x8)
	li x29,1
	add x30,x30,x29
	sw x30,-8+16(x8)
	addi x12,x27,0
	li x30,32
	add x30,x27,x30
	lw x30,0(x30)
	lw x29,-8+16(x8)
	li x28,9
	srl x29,x29,x28
	add x13,x30,x29
	jal x1,move_window
	beq x10,x0,L.71
	jal x0,L.66
L.71:
	lw x30,-16+16(x8)
	lw x29,-8+16(x8)
	li x28,511
	and x29,x29,x28
	li x28,48
	add x28,x27,x28
	add x29,x29,x28
	lbu x29,0(x29)
	li x28,8
	sll x29,x29,x28
	or x30,x30,x29
	sw x30,-16+16(x8)
	lw x30,4+16(x8)
	li x29,1
	and x30,x30,x29
	beq x30,x0,L.74
	lw x30,-16+16(x8)
	li x29,4
	srl x25,x30,x29
	jal x0,L.75
L.74:
	lw x30,-16+16(x8)
	li x29,4095
	and x25,x30,x29
L.75:
	addi x10,x25,0
	jal x0,L.61
L.76:
	addi x12,x27,0
	li x30,32
	add x30,x27,x30
	lw x30,0(x30)
	lw x29,4+16(x8)
	li x28,8
	srl x29,x29,x28
	add x13,x30,x29
	jal x1,move_window
	beq x10,x0,L.77
	jal x0,L.66
L.77:
	li x30,1
	lw x29,4+16(x8)
	sll x29,x29,x30
	li x28,511
	and x29,x29,x28
	li x28,48
	add x28,x27,x28
	add x29,x29,x28
	sw x29,-12+16(x8)
	lw x29,-12+16(x8)
	add x30,x29,x30
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x28,8
	sll x30,x30,x28
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	or x30,x30,x29
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	addi x10,x30,0
	jal x0,L.61
L.79:
	addi x12,x27,0
	li x30,32
	add x30,x27,x30
	lw x30,0(x30)
	lw x29,4+16(x8)
	li x28,7
	srl x29,x29,x28
	add x13,x30,x29
	jal x1,move_window
	beq x10,x0,L.80
	jal x0,L.66
L.80:
	li x30,2
	lw x29,4+16(x8)
	sll x29,x29,x30
	li x28,511
	and x29,x29,x28
	li x28,48
	add x28,x27,x28
	add x29,x29,x28
	sw x29,-12+16(x8)
	lw x29,-12+16(x8)
	li x28,3
	add x28,x29,x28
	lbu x28,0(x28)
	li x7,24
	sll x28,x28,x7
	add x30,x29,x30
	lbu x30,0(x30)
	li x7,16
	sll x30,x30,x7
	or x30,x28,x30
	li x28,1
	add x28,x29,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	li x7,8
	sll x28,x28,x7
	or x30,x30,x28
	lbu x29,0(x29)
	or x30,x30,x29
	li x29,0xfffffff
	and x10,x30,x29
	jal x0,L.61
L.65:
	li x10,1
	jal x0,L.61
L.66:
	li x10,0xffffffff
L.61:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl put_fat
	.align	4
put_fat:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	sw x14,24(x8)
	lw x30,4+16(x8)
	li x29,2
	bltu x30,x29,L.85
	lw x29,0+16(x8)
	li x28,20
	add x29,x29,x28
	lw x29,0(x29)
	bltu x30,x29,L.83
L.85:
	li x30,2
	sw x30,-8+16(x8)
	jal x0,L.84
L.83:
	lw x30,0+16(x8)
	lbu x27,0(x30)
	li x30,1
	beq x27,x30,L.89
	li x30,2
	beq x27,x30,L.100
	li x30,3
	beq x27,x30,L.103
	jal x0,L.86
L.89:
	lw x30,4+16(x8)
	sw x30,-16+16(x8)
	lw x30,-16+16(x8)
	li x29,1
	srl x29,x30,x29
	add x30,x30,x29
	sw x30,-16+16(x8)
	lw x30,0+16(x8)
	addi x12,x30,0
	li x29,32
	add x30,x30,x29
	lw x30,0(x30)
	lw x29,-16+16(x8)
	li x28,9
	srl x29,x29,x28
	add x13,x30,x29
	jal x1,move_window
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x30,x0,L.90
	jal x0,L.87
L.90:
	lw x30,-16+16(x8)
	li x29,511
	and x30,x30,x29
	lw x29,0+16(x8)
	li x28,48
	add x29,x29,x28
	add x30,x30,x29
	sw x30,-12+16(x8)
	lw x30,4+16(x8)
	li x29,1
	and x30,x30,x29
	beq x30,x0,L.93
	lw x30,-12+16(x8)
	lbu x30,0(x30)
	andi x30,x30,15
	lw x29,8+16(x8)
	slli x29,x29,8*(4-1)
	srli x29,x29,8*(4-1)
	li x28,4
	sll x29,x29,x28
	or x26,x30,x29
	jal x0,L.94
L.93:
	lw x30,8+16(x8)
	slli x26,x30,8*(4-1)
	srli x26,x26,8*(4-1)
L.94:
	lw x30,-12+16(x8)
	addi x29,x26,0
	sb x29,0(x30)
	lw x30,-16+16(x8)
	li x29,1
	add x30,x30,x29
	sw x30,-16+16(x8)
	lw x30,0+16(x8)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	lw x30,0+16(x8)
	addi x12,x30,0
	li x29,32
	add x30,x30,x29
	lw x30,0(x30)
	lw x29,-16+16(x8)
	li x28,9
	srl x29,x29,x28
	add x13,x30,x29
	jal x1,move_window
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x30,x0,L.95
	jal x0,L.87
L.95:
	lw x30,-16+16(x8)
	li x29,511
	and x30,x30,x29
	lw x29,0+16(x8)
	li x28,48
	add x29,x29,x28
	add x30,x30,x29
	sw x30,-12+16(x8)
	lw x30,4+16(x8)
	li x29,1
	and x30,x30,x29
	beq x30,x0,L.98
	lw x30,8+16(x8)
	li x29,4
	srl x30,x30,x29
	slli x25,x30,8*(4-1)
	srli x25,x25,8*(4-1)
	jal x0,L.99
L.98:
	lw x30,-12+16(x8)
	lbu x30,0(x30)
	andi x30,x30,240
	lw x29,8+16(x8)
	li x28,8
	srl x29,x29,x28
	slli x29,x29,8*(4-1)
	srli x29,x29,8*(4-1)
	andi x29,x29,15
	or x25,x30,x29
L.99:
	lw x30,-12+16(x8)
	addi x29,x25,0
	sb x29,0(x30)
	jal x0,L.87
L.100:
	lw x30,0+16(x8)
	addi x12,x30,0
	li x29,32
	add x30,x30,x29
	lw x30,0(x30)
	lw x29,4+16(x8)
	li x28,8
	srl x29,x29,x28
	add x13,x30,x29
	jal x1,move_window
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x30,x0,L.101
	jal x0,L.87
L.101:
	lw x30,4+16(x8)
	li x29,1
	sll x30,x30,x29
	li x29,511
	and x30,x30,x29
	lw x29,0+16(x8)
	li x28,48
	add x29,x29,x28
	add x30,x30,x29
	sw x30,-12+16(x8)
	lw x30,-12+16(x8)
	lw x29,8+16(x8)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	sb x29,0(x30)
	lw x30,-12+16(x8)
	li x29,1
	add x30,x30,x29
	lw x29,8+16(x8)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	jal x0,L.87
L.103:
	lw x30,0+16(x8)
	addi x12,x30,0
	li x29,32
	add x30,x30,x29
	lw x30,0(x30)
	lw x29,4+16(x8)
	li x28,7
	srl x29,x29,x28
	add x13,x30,x29
	jal x1,move_window
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x30,x0,L.104
	jal x0,L.87
L.104:
	li x30,2
	lw x29,4+16(x8)
	sll x29,x29,x30
	li x28,511
	and x29,x29,x28
	lw x28,0+16(x8)
	li x7,48
	add x28,x28,x7
	add x29,x29,x28
	sw x29,-12+16(x8)
	lw x29,-12+16(x8)
	lw x28,8+16(x8)
	li x7,3
	add x7,x29,x7
	lbu x7,0(x7)
	li x6,24
	sll x7,x7,x6
	add x30,x29,x30
	lbu x30,0(x30)
	li x6,16
	sll x30,x30,x6
	or x30,x7,x30
	li x7,1
	add x7,x29,x7
	lbu x7,0(x7)
	slli x7,x7,8*(4-2)
	srli x7,x7,8*(4-2)
	li x6,8
	sll x7,x7,x6
	or x30,x30,x7
	lbu x7,0(x29)
	or x30,x30,x7
	li x7,0xf0000000
	and x30,x30,x7
	or x30,x28,x30
	sw x30,8+16(x8)
	lw x30,8+16(x8)
	sb x30,0(x29)
	lw x30,-12+16(x8)
	li x29,1
	add x30,x30,x29
	lw x29,8+16(x8)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	lw x30,-12+16(x8)
	li x29,2
	add x30,x30,x29
	lw x29,8+16(x8)
	li x28,16
	srl x29,x29,x28
	sb x29,0(x30)
	lw x30,-12+16(x8)
	li x29,3
	add x30,x30,x29
	lw x29,8+16(x8)
	li x28,24
	srl x29,x29,x28
	sb x29,0(x30)
	jal x0,L.87
L.86:
	li x30,2
	sw x30,-8+16(x8)
L.87:
	lw x30,0+16(x8)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
L.84:
	lw x10,-8+16(x8)
L.82:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
remove_chain:
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
	li x30,2
	bltu x26,x30,L.109
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	bltu x26,x30,L.107
L.109:
	li x24,2
	jal x0,L.108
L.107:
	addi x24,x0,0
	jal x0,L.111
L.110:
	addi x12,x27,0
	addi x13,x26,0
	jal x1,get_fat
	addi x25,x10,0
	bne x25,x0,L.113
	jal x0,L.112
L.113:
	li x30,1
	bne x25,x30,L.115
	li x24,2
	jal x0,L.112
L.115:
	li x30,0xffffffff
	bne x25,x30,L.117
	li x24,1
	jal x0,L.112
L.117:
	addi x12,x27,0
	addi x13,x26,0
	addi x14,x0,0
	jal x1,put_fat
	addi x24,x10,0
	beq x24,x0,L.119
	jal x0,L.112
L.119:
	li x30,16
	add x30,x27,x30
	lw x30,0(x30)
	li x29,0xffffffff
	beq x30,x29,L.121
	li x30,16
	add x30,x27,x30
	lw x29,0(x30)
	li x28,1
	add x29,x29,x28
	sw x29,0(x30)
	li x30,5
	add x30,x27,x30
	lbu x29,0(x30)
	ori x29,x29,1
	sb x29,0(x30)
L.121:
	addi x26,x25,0
L.111:
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	bltu x26,x30,L.110
L.112:
L.108:
	addi x10,x24,0
L.106:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
create_chain:
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
	mv x26,x13
	bne x26,x0,L.124
	li x30,12
	add x30,x27,x30
	lw x23,0(x30)
	beq x23,x0,L.128
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	bltu x23,x30,L.125
L.128:
	li x23,1
	jal x0,L.125
L.124:
	addi x12,x27,0
	addi x13,x26,0
	jal x1,get_fat
	addi x24,x10,0
	li x30,2
	bgeu x24,x30,L.129
	li x10,1
	jal x0,L.123
L.129:
	li x30,0xffffffff
	bne x24,x30,L.131
	addi x10,x24,0
	jal x0,L.123
L.131:
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	bgeu x24,x30,L.133
	addi x10,x24,0
	jal x0,L.123
L.133:
	addi x23,x26,0
L.125:
	addi x25,x23,0
L.135:
	li x30,1
	add x25,x25,x30
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	bltu x25,x30,L.139
	li x25,2
	bleu x25,x23,L.141
	addi x10,x0,0
	jal x0,L.123
L.141:
L.139:
	addi x12,x27,0
	addi x13,x25,0
	jal x1,get_fat
	addi x24,x10,0
	bne x24,x0,L.143
	jal x0,L.137
L.143:
	li x30,0xffffffff
	beq x24,x30,L.147
	li x30,1
	bne x24,x30,L.145
L.147:
	addi x10,x24,0
	jal x0,L.123
L.145:
	bne x25,x23,L.135
	addi x10,x0,0
	jal x0,L.123
L.137:
	addi x12,x27,0
	addi x13,x25,0
	li x14,0xfffffff
	jal x1,put_fat
	addi x22,x10,0
	bne x22,x0,L.150
	beq x26,x0,L.150
	addi x12,x27,0
	addi x13,x26,0
	addi x14,x25,0
	jal x1,put_fat
	addi x22,x10,0
L.150:
	bne x22,x0,L.152
	li x30,12
	add x30,x27,x30
	sw x25,0(x30)
	li x30,16
	add x30,x27,x30
	lw x30,0(x30)
	li x29,0xffffffff
	beq x30,x29,L.153
	li x30,16
	add x30,x27,x30
	lw x29,0(x30)
	li x28,1
	sub x29,x29,x28
	sw x29,0(x30)
	li x30,5
	add x30,x27,x30
	lbu x29,0(x30)
	ori x29,x29,1
	sb x29,0(x30)
	jal x0,L.153
L.152:
	li x30,1
	bne x22,x30,L.157
	li x21,0xffffffff
	jal x0,L.158
L.157:
	li x21,1
L.158:
	addi x25,x21,0
L.153:
	addi x10,x25,0
L.123:
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
dir_sdi:
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
	mv x26,x13
	li x30,6
	add x30,x27,x30
	addi x29,x26,0
	sh x29,0(x30)
	li x30,8
	add x30,x27,x30
	lw x25,0(x30)
	li x30,1
	beq x25,x30,L.162
	lw x30,0(x27)
	li x29,20
	add x30,x30,x29
	lw x30,0(x30)
	bltu x25,x30,L.160
L.162:
	li x10,2
	jal x0,L.159
L.160:
	bne x25,x0,L.163
	lw x30,0(x27)
	lbu x30,0(x30)
	li x29,3
	bne x30,x29,L.163
	lw x30,0(x27)
	li x29,36
	add x30,x30,x29
	lw x25,0(x30)
L.163:
	bne x25,x0,L.165
	lw x30,0(x27)
	li x29,8
	add x30,x30,x29
	lhu x30,0(x30)
	bltu x26,x30,L.167
	li x10,2
	jal x0,L.159
L.167:
	lw x30,0(x27)
	li x29,36
	add x30,x30,x29
	lw x23,0(x30)
	jal x0,L.166
L.165:
	lw x30,0(x27)
	li x29,2
	add x30,x30,x29
	lbu x30,0(x30)
	li x29,4
	sll x24,x30,x29
	jal x0,L.170
L.169:
	lw x12,0(x27)
	addi x13,x25,0
	jal x1,get_fat
	addi x25,x10,0
	li x30,0xffffffff
	bne x25,x30,L.172
	li x10,1
	jal x0,L.159
L.172:
	li x30,2
	bltu x25,x30,L.176
	lw x30,0(x27)
	li x29,20
	add x30,x30,x29
	lw x30,0(x30)
	bltu x25,x30,L.174
L.176:
	li x10,2
	jal x0,L.159
L.174:
	sub x26,x26,x24
L.170:
	bgeu x26,x24,L.169
	lw x12,0(x27)
	addi x13,x25,0
	jal x1,clust2sect
	addi x23,x10,0
L.166:
	li x30,12
	add x30,x27,x30
	sw x25,0(x30)
	bne x23,x0,L.177
	li x10,2
	jal x0,L.159
L.177:
	li x30,16
	add x30,x27,x30
	li x29,4
	srl x29,x26,x29
	add x29,x23,x29
	sw x29,0(x30)
	li x30,20
	add x30,x27,x30
	li x29,15
	and x29,x26,x29
	li x28,5
	sll x29,x29,x28
	lw x28,0(x27)
	li x7,48
	add x28,x28,x7
	add x29,x29,x28
	sw x29,0(x30)
	addi x10,x0,0
L.159:
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
dir_next:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	sw x13,20(x8)
	li x30,6
	add x30,x27,x30
	lhu x30,0(x30)
	addi x30,x30,1
	addi x26,x30,0
	li x30,0xffff
	and x30,x26,x30
	beq x30,x0,L.182
	li x30,16
	add x30,x27,x30
	lw x30,0(x30)
	bne x30,x0,L.180
L.182:
	li x10,4
	jal x0,L.179
L.180:
	li x30,15
	and x30,x26,x30
	bne x30,x0,L.183
	li x30,16
	add x30,x27,x30
	lw x29,0(x30)
	li x28,1
	add x29,x29,x28
	sw x29,0(x30)
	li x30,12
	add x30,x27,x30
	lw x30,0(x30)
	bne x30,x0,L.185
	lw x30,0(x27)
	li x29,8
	add x30,x30,x29
	lhu x30,0(x30)
	bltu x26,x30,L.186
	li x10,4
	jal x0,L.179
L.185:
	li x30,4
	srl x30,x26,x30
	lw x29,0(x27)
	li x28,2
	add x29,x29,x28
	lbu x29,0(x29)
	addi x29,x29,-1
	and x30,x30,x29
	bne x30,x0,L.189
	lw x12,0(x27)
	li x30,12
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,get_fat
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	li x29,1
	bgtu x30,x29,L.191
	li x10,2
	jal x0,L.179
L.191:
	lw x30,-8+16(x8)
	li x29,0xffffffff
	bne x30,x29,L.193
	li x10,1
	jal x0,L.179
L.193:
	lw x30,-8+16(x8)
	lw x29,0(x27)
	li x28,20
	add x29,x29,x28
	lw x29,0(x29)
	bltu x30,x29,L.195
	lw x30,4+16(x8)
	bne x30,x0,L.197
	li x10,4
	jal x0,L.179
L.197:
	lw x12,0(x27)
	li x30,12
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,create_chain
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	bne x30,x0,L.199
	li x10,7
	jal x0,L.179
L.199:
	lw x30,-8+16(x8)
	li x29,1
	bne x30,x29,L.201
	li x10,2
	jal x0,L.179
L.201:
	lw x30,-8+16(x8)
	li x29,0xffffffff
	bne x30,x29,L.203
	li x10,1
	jal x0,L.179
L.203:
	lw x12,0(x27)
	jal x1,sync_window
	beq x10,x0,L.205
	li x10,1
	jal x0,L.179
L.205:
	lw x30,0(x27)
	li x29,48
	add x12,x30,x29
	addi x13,x0,0
	li x14,512
	jal x1,mem_set
	lw x30,0(x27)
	sw x30,-16+16(x8)
	addi x12,x30,0
	lw x13,-8+16(x8)
	jal x1,clust2sect
	li x29,44
	lw x28,-16+16(x8)
	add x29,x28,x29
	sw x10,0(x29)
	sw x0,-12+16(x8)
	jal x0,L.210
L.207:
	lw x30,0(x27)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	lw x12,0(x27)
	jal x1,sync_window
	beq x10,x0,L.211
	li x10,1
	jal x0,L.179
L.211:
	lw x30,0(x27)
	li x29,44
	add x30,x30,x29
	lw x29,0(x30)
	li x28,1
	add x29,x29,x28
	sw x29,0(x30)
L.208:
	lw x30,-12+16(x8)
	li x29,1
	add x30,x30,x29
	sw x30,-12+16(x8)
L.210:
	lw x30,-12+16(x8)
	lw x29,0(x27)
	li x28,2
	add x29,x29,x28
	lbu x29,0(x29)
	bltu x30,x29,L.207
	lw x30,0(x27)
	li x29,44
	add x30,x30,x29
	lw x29,0(x30)
	lw x28,-12+16(x8)
	sub x29,x29,x28
	sw x29,0(x30)
L.195:
	li x30,12
	add x30,x27,x30
	lw x29,-8+16(x8)
	sw x29,0(x30)
	lw x12,0(x27)
	lw x13,-8+16(x8)
	jal x1,clust2sect
	li x29,16
	add x29,x27,x29
	sw x10,0(x29)
L.189:
L.186:
L.183:
	li x30,6
	add x30,x27,x30
	addi x29,x26,0
	sh x29,0(x30)
	li x30,20
	add x30,x27,x30
	li x29,15
	and x29,x26,x29
	li x28,5
	sll x29,x29,x28
	lw x28,0(x27)
	li x7,48
	add x28,x28,x7
	add x29,x29,x28
	sw x29,0(x30)
	addi x10,x0,0
L.179:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
dir_alloc:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	sw x13,20(x8)
	addi x12,x27,0
	addi x13,x0,0
	jal x1,dir_sdi
	addi x26,x10,0
	bne x26,x0,L.214
	addi x25,x0,0
L.216:
	lw x12,0(x27)
	li x30,16
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,move_window
	addi x26,x10,0
	beq x26,x0,L.219
	jal x0,L.218
L.219:
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	lbu x30,0(x30)
	li x29,229
	beq x30,x29,L.223
	bne x30,x0,L.221
L.223:
	li x30,1
	add x30,x25,x30
	addi x25,x30,0
	lw x29,4+16(x8)
	bne x30,x29,L.222
	jal x0,L.218
L.221:
	addi x25,x0,0
L.222:
	addi x12,x27,0
	li x13,1
	jal x1,dir_next
	addi x26,x10,0
L.217:
	beq x26,x0,L.216
L.218:
L.214:
	li x30,4
	bne x26,x30,L.226
	li x26,7
L.226:
	addi x10,x26,0
L.213:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
ld_clust:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x30,27
	add x30,x13,x30
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,8
	sll x30,x30,x29
	li x29,26
	add x29,x13,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	or x30,x30,x29
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	sw x30,-8+16(x8)
	lbu x30,0(x12)
	li x29,3
	bne x30,x29,L.229
	lw x30,-8+16(x8)
	li x29,21
	add x29,x13,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	li x28,20
	add x28,x13,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	or x29,x29,x28
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,16
	sll x29,x29,x28
	or x30,x30,x29
	sw x30,-8+16(x8)
L.229:
	lw x10,-8+16(x8)
L.228:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
st_clust:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x30,26
	add x30,x12,x30
	addi x29,x13,0
	sb x29,0(x30)
	li x30,27
	add x30,x12,x30
	addi x29,x13,0
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	li x30,20
	add x30,x12,x30
	li x29,16
	srl x29,x13,x29
	sb x29,0(x30)
	li x30,21
	add x30,x12,x30
	li x29,16
	srl x29,x13,x29
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
L.231:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align 4
	.data
	.align	1
LfnOfs:
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.byte	0x7
	.byte	0x9
	.byte	0xe
	.byte	0x10
	.byte	0x12
	.byte	0x14
	.byte	0x16
	.byte	0x18
	.byte	0x1c
	.byte	0x1e
	.align 4
	.text
	.align	4
cmp_lfn:
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
	li x30,13
	lbu x29,0(x26)
	andi x29,x29,-65
	mul x29,x30,x29
	sub x30,x29,x30
	addi x22,x30,0
	addi x25,x0,0
	li x24,1
L.233:
	la x30,LfnOfs
	add x30,x25,x30
	lbu x30,0(x30)
	add x30,x30,x26
	li x29,1
	add x29,x30,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	or x30,x29,x30
	addi x23,x30,0
	slli x30,x24,8*(4-2)
	srli x30,x30,8*(4-2)
	beq x30,x0,L.236
	slli x12,x23,8*(4-2)
	srli x12,x12,8*(4-2)
	jal x1,ff_wtoupper
	addi x30,x10,0
	addi x24,x30,0
	addi x30,x22,0
	li x29,255
	bgeu x30,x29,L.240
	li x29,1
	add x22,x30,x29
	li x29,1
	sll x30,x30,x29
	add x30,x30,x27
	lhu x12,0(x30)
	jal x1,ff_wtoupper
	slli x29,x24,8*(4-2)
	srli x29,x29,8*(4-2)
	addi x30,x10,0
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	beq x29,x30,L.237
L.240:
	addi x10,x0,0
	jal x0,L.232
L.236:
	slli x30,x23,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,65535
	beq x30,x29,L.241
	addi x10,x0,0
	jal x0,L.232
L.241:
L.237:
L.234:
	li x30,1
	add x30,x25,x30
	addi x25,x30,0
	li x29,13
	bltu x30,x29,L.233
	lbu x29,0(x26)
	andi x29,x29,64
	beq x29,x0,L.243
	slli x29,x24,8*(4-2)
	srli x29,x29,8*(4-2)
	beq x29,x0,L.243
	li x29,1
	sll x29,x22,x29
	add x29,x29,x27
	lhu x29,0(x29)
	beq x29,x0,L.243
	addi x10,x0,0
	jal x0,L.232
L.243:
	li x10,1
L.232:
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
pick_lfn:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x24,0(x2)
	sw x25,4(x2)
	sw x26,8(x2)
	sw x27,12(x2)
	li x30,13
	lbu x29,0(x13)
	andi x29,x29,63
	mul x29,x30,x29
	sub x30,x29,x30
	addi x24,x30,0
	addi x27,x0,0
	li x25,1
L.246:
	la x30,LfnOfs
	add x30,x27,x30
	lbu x30,0(x30)
	add x30,x30,x13
	li x29,1
	add x29,x30,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	or x30,x29,x30
	addi x26,x30,0
	slli x30,x25,8*(4-2)
	srli x30,x30,8*(4-2)
	beq x30,x0,L.249
	li x30,255
	bltu x24,x30,L.251
	addi x10,x0,0
	jal x0,L.245
L.251:
	addi x30,x24,0
	li x29,1
	add x24,x30,x29
	addi x25,x26,0
	li x29,1
	sll x30,x30,x29
	add x30,x30,x12
	sh x26,0(x30)
	jal x0,L.250
L.249:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,65535
	beq x30,x29,L.253
	addi x10,x0,0
	jal x0,L.245
L.253:
L.250:
L.247:
	li x30,1
	add x30,x27,x30
	addi x27,x30,0
	li x29,13
	bltu x30,x29,L.246
	lbu x30,0(x13)
	andi x30,x30,64
	beq x30,x0,L.255
	li x30,255
	bltu x24,x30,L.257
	addi x10,x0,0
	jal x0,L.245
L.257:
	li x30,1
	sll x30,x24,x30
	add x30,x30,x12
	sh x0,0(x30)
L.255:
	li x10,1
L.245:
	lw x24,0(x2)
	lw x25,4(x2)
	lw x26,8(x2)
	lw x27,12(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align	4
fit_lfn:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x25,0(x2)
	sw x26,4(x2)
	sw x27,8(x2)
	li x30,13
	add x30,x13,x30
	sb x15,0(x30)
	li x30,11
	add x30,x13,x30
	li x29,15
	sb x29,0(x30)
	li x30,12
	add x30,x13,x30
	sb x0,0(x30)
	li x30,26
	add x30,x13,x30
	sb x0,0(x30)
	li x30,27
	add x30,x13,x30
	sb x0,0(x30)
	li x30,13
	slli x29,x14,8*(4-1)
	srli x29,x29,8*(4-1)
	mul x29,x30,x29
	sub x30,x29,x30
	addi x25,x30,0
	addi x27,x0,0
	slli x30,x0,8*(4-2)
	srli x30,x30,8*(4-2)
	addi x26,x30,0
L.260:
	slli x30,x27,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,65535
	beq x30,x29,L.263
	addi x30,x25,0
	li x29,1
	add x25,x30,x29
	li x29,1
	sll x30,x30,x29
	add x30,x30,x12
	lhu x27,0(x30)
L.263:
	la x30,LfnOfs
	add x30,x26,x30
	lbu x30,0(x30)
	add x30,x30,x13
	slli x29,x27,8*(4-2)
	srli x29,x29,8*(4-2)
	sb x29,0(x30)
	la x30,LfnOfs
	add x30,x26,x30
	lbu x30,0(x30)
	add x30,x30,x13
	li x29,1
	add x30,x30,x29
	slli x29,x27,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	slli x30,x27,8*(4-2)
	srli x30,x30,8*(4-2)
	bne x30,x0,L.265
	li x27,0xffff
L.265:
L.261:
	li x30,1
	add x30,x26,x30
	addi x26,x30,0
	li x29,13
	bltu x30,x29,L.260
	slli x30,x27,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,65535
	beq x30,x29,L.269
	li x30,1
	sll x30,x25,x30
	add x30,x30,x12
	lhu x30,0(x30)
	bne x30,x0,L.267
L.269:
	slli x30,x14,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,64
	addi x14,x30,0
L.267:
	sb x14,0(x13)
L.259:
	lw x25,0(x2)
	lw x26,4(x2)
	lw x27,8(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
gen_numname:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x20,28(x2)
	sw x21,32(x2)
	sw x22,36(x2)
	sw x23,40(x2)
	sw x24,44(x2)
	sw x25,48(x2)
	sw x26,52(x2)
	sw x27,56(x2)
	mv x27,x12
	sw x13,20(x8)
	mv x26,x14
	mv x25,x15
	addi x12,x27,0
	lw x13,4+16(x8)
	li x14,11
	jal x1,mem_cpy
	li x30,5
	bleu x25,x30,L.271
	addi x21,x25,0
	jal x0,L.274
L.273:
	addi x30,x26,0
	li x29,2
	add x26,x30,x29
	lhu x20,0(x30)
	addi x24,x0,0
	jal x0,L.279
L.276:
	li x30,1
	slli x29,x20,8*(4-2)
	srli x29,x29,8*(4-2)
	sll x28,x21,x30
	and x7,x29,x30
	add x21,x28,x7
	sra x30,x29,x30
	addi x20,x30,0
	li x30,0x10000
	and x30,x21,x30
	beq x30,x0,L.280
	li x30,0x11021
	xor x21,x21,x30
L.280:
L.277:
	li x30,1
	add x24,x24,x30
L.279:
	li x30,16
	bltu x24,x30,L.276
L.274:
	lhu x30,0(x26)
	bne x30,x0,L.273
	addi x25,x21,0
L.271:
	li x24,7
L.282:
	li x30,15
	and x30,x25,x30
	li x29,48
	add x30,x30,x29
	addi x22,x30,0
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,57
	ble x30,x29,L.285
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	addi x30,x30,7
	addi x22,x30,0
L.285:
	addi x30,x24,0
	li x29,1
	sub x24,x30,x29
	addi x29,x8,-12+16
	add x30,x30,x29
	sb x22,0(x30)
	li x30,4
	srl x25,x25,x30
L.283:
	bne x25,x0,L.282
	addi x30,x8,-12+16
	add x30,x24,x30
	li x29,126
	sb x29,0(x30)
	addi x23,x0,0
	jal x0,L.290
L.287:
	add x30,x23,x27
	lbu x30,0(x30)
	li x29,129
	blt x30,x29,L.294
	li x29,159
	ble x30,x29,L.293
L.294:
	add x30,x23,x27
	lbu x30,0(x30)
	li x29,224
	blt x30,x29,L.291
	li x29,252
	bgt x30,x29,L.291
L.293:
	li x30,1
	sub x30,x24,x30
	bne x23,x30,L.295
	jal x0,L.289
L.295:
	li x30,1
	add x23,x23,x30
L.291:
L.288:
	li x30,1
	add x23,x23,x30
L.290:
	bgeu x23,x24,L.297
	add x30,x23,x27
	lbu x30,0(x30)
	li x29,32
	bne x30,x29,L.287
L.297:
L.289:
L.298:
	addi x30,x23,0
	li x29,1
	add x23,x30,x29
	li x29,8
	bgeu x24,x29,L.302
	addi x29,x24,0
	li x28,1
	add x24,x29,x28
	addi x28,x8,-12+16
	add x29,x29,x28
	lbu x21,0(x29)
	jal x0,L.303
L.302:
	li x21,32
L.303:
	add x30,x30,x27
	addi x29,x21,0
	sb x29,0(x30)
L.299:
	li x30,8
	bltu x23,x30,L.298
L.270:
	lw x1,24(x2)
	lw x20,28(x2)
	lw x21,32(x2)
	lw x22,36(x2)
	lw x23,40(x2)
	lw x24,44(x2)
	lw x25,48(x2)
	lw x26,52(x2)
	lw x27,56(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align	4
sum_sfn:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x26,0(x2)
	sw x27,4(x2)
	addi x27,x0,0
	li x26,11
L.305:
	addi x30,x12,0
	li x29,1
	add x12,x30,x29
	slli x28,x27,8*(4-1)
	srli x28,x28,8*(4-1)
	sra x29,x28,x29
	li x7,7
	sll x28,x28,x7
	add x29,x29,x28
	lbu x30,0(x30)
	add x30,x29,x30
	addi x27,x30,0
L.306:
	li x30,1
	sub x30,x26,x30
	addi x26,x30,0
	bne x30,x0,L.305
	slli x10,x27,8*(4-1)
	srli x10,x10,8*(4-1)
L.304:
	lw x26,0(x2)
	lw x27,4(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
dir_find:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,64
	sw x1,24(x2)
	sw x20,28(x2)
	sw x21,32(x2)
	sw x22,36(x2)
	sw x23,40(x2)
	sw x24,44(x2)
	sw x25,48(x2)
	sw x26,52(x2)
	sw x27,56(x2)
	mv x27,x12
	addi x12,x27,0
	addi x13,x0,0
	jal x1,dir_sdi
	addi x26,x10,0
	beq x26,x0,L.309
	addi x10,x26,0
	jal x0,L.308
L.309:
	li x30,255
	addi x21,x30,0
	addi x22,x30,0
	li x30,32
	add x30,x27,x30
	li x29,0xffff
	sh x29,0(x30)
L.311:
	lw x12,0(x27)
	li x30,16
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,move_window
	addi x26,x10,0
	beq x26,x0,L.314
	jal x0,L.313
L.314:
	li x30,20
	add x30,x27,x30
	lw x25,0(x30)
	lbu x23,0(x25)
	slli x30,x23,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.316
	li x26,4
	jal x0,L.313
L.316:
	li x30,11
	add x30,x25,x30
	lbu x30,0(x30)
	andi x30,x30,63
	addi x24,x30,0
	slli x30,x23,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,229
	beq x30,x29,L.320
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x29,x30,8
	beq x29,x0,L.318
	li x29,15
	beq x30,x29,L.318
L.320:
	li x22,255
	li x30,32
	add x30,x27,x30
	li x29,0xffff
	sh x29,0(x30)
	jal x0,L.319
L.318:
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,15
	bne x30,x29,L.321
	li x30,28
	add x30,x27,x30
	lw x30,0(x30)
	beq x30,x0,L.322
	slli x30,x23,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,64
	beq x30,x0,L.325
	li x30,13
	add x30,x25,x30
	lbu x21,0(x30)
	slli x30,x23,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,-65
	addi x23,x30,0
	addi x22,x23,0
	li x30,32
	add x30,x27,x30
	li x29,6
	add x29,x27,x29
	lhu x29,0(x29)
	sh x29,0(x30)
L.325:
	slli x30,x23,8*(4-1)
	srli x30,x30,8*(4-1)
	slli x29,x22,8*(4-1)
	srli x29,x29,8*(4-1)
	bne x30,x29,L.328
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,13
	add x29,x25,x29
	lbu x29,0(x29)
	bne x30,x29,L.328
	li x30,28
	add x30,x27,x30
	lw x12,0(x30)
	addi x13,x25,0
	jal x1,cmp_lfn
	beq x10,x0,L.328
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	addi x20,x30,-1
	jal x0,L.329
L.328:
	li x20,255
L.329:
	addi x30,x20,0
	addi x22,x30,0
	jal x0,L.322
L.321:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.330
	addi x12,x25,0
	jal x1,sum_sfn
	slli x29,x21,8*(4-1)
	srli x29,x29,8*(4-1)
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x29,x30,L.330
	jal x0,L.313
L.330:
	li x30,24
	add x30,x27,x30
	lw x30,0(x30)
	li x29,11
	add x29,x30,x29
	lbu x29,0(x29)
	andi x29,x29,1
	bne x29,x0,L.332
	addi x12,x25,0
	addi x13,x30,0
	li x14,11
	jal x1,mem_cmp
	bne x10,x0,L.332
	jal x0,L.313
L.332:
	li x22,255
	li x30,32
	add x30,x27,x30
	li x29,0xffff
	sh x29,0(x30)
L.322:
L.319:
	addi x12,x27,0
	addi x13,x0,0
	jal x1,dir_next
	addi x26,x10,0
L.312:
	beq x26,x0,L.311
L.313:
	addi x10,x26,0
L.308:
	lw x1,24(x2)
	lw x20,28(x2)
	lw x21,32(x2)
	lw x22,36(x2)
	lw x23,40(x2)
	lw x24,44(x2)
	lw x25,48(x2)
	lw x26,52(x2)
	lw x27,56(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align	4
dir_read:
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
	li x21,255
	li x20,255
	li x25,4
	jal x0,L.336
L.335:
	lw x12,0(x27)
	li x30,16
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,move_window
	addi x25,x10,0
	beq x25,x0,L.338
	jal x0,L.337
L.338:
	li x30,20
	add x30,x27,x30
	lw x23,0(x30)
	lbu x24,0(x23)
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.340
	li x25,4
	jal x0,L.337
L.340:
	li x30,11
	add x30,x23,x30
	lbu x30,0(x30)
	andi x30,x30,63
	addi x22,x30,0
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,229
	beq x30,x29,L.346
	li x29,46
	beq x30,x29,L.346
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,8
	bne x30,x29,L.347
	li x19,1
	jal x0,L.348
L.347:
	addi x19,x0,0
L.348:
	beq x19,x26,L.342
L.346:
	li x21,255
	jal x0,L.343
L.342:
	slli x30,x22,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,15
	bne x30,x29,L.349
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,64
	beq x30,x0,L.351
	li x30,13
	add x30,x23,x30
	lbu x20,0(x30)
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,-65
	addi x24,x30,0
	addi x21,x24,0
	li x30,32
	add x30,x27,x30
	li x29,6
	add x29,x27,x29
	lhu x29,0(x29)
	sh x29,0(x30)
L.351:
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	slli x29,x21,8*(4-1)
	srli x29,x29,8*(4-1)
	bne x30,x29,L.354
	slli x30,x20,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,13
	add x29,x23,x29
	lbu x29,0(x29)
	bne x30,x29,L.354
	li x30,28
	add x30,x27,x30
	lw x12,0(x30)
	addi x13,x23,0
	jal x1,pick_lfn
	beq x10,x0,L.354
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	addi x18,x30,-1
	jal x0,L.355
L.354:
	li x18,255
L.355:
	addi x30,x18,0
	addi x21,x30,0
	jal x0,L.350
L.349:
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.358
	addi x12,x23,0
	jal x1,sum_sfn
	slli x29,x20,8*(4-1)
	srli x29,x29,8*(4-1)
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	beq x29,x30,L.337
L.358:
	li x30,32
	add x30,x27,x30
	li x29,0xffff
	sh x29,0(x30)
	jal x0,L.337
L.350:
L.343:
	addi x12,x27,0
	addi x13,x0,0
	jal x1,dir_next
	addi x25,x10,0
	beq x25,x0,L.359
	jal x0,L.337
L.359:
L.336:
	li x30,16
	add x30,x27,x30
	lw x30,0(x30)
	bne x30,x0,L.335
L.337:
	beq x25,x0,L.361
	li x30,16
	add x30,x27,x30
	sw x0,0(x30)
L.361:
	addi x10,x25,0
L.334:
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
dir_register:
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
	li x30,24
	add x30,x27,x30
	lw x22,0(x30)
	li x30,28
	add x30,x27,x30
	lw x24,0(x30)
	addi x12,x8,-16+32
	addi x13,x22,0
	li x14,12
	jal x1,mem_cpy
	jal x0,L.364
	li x10,6
	jal x0,L.363
L.364:
	lbu x30,-5+32(x8)
	andi x30,x30,1
	beq x30,x0,L.367
	li x30,11
	add x30,x22,x30
	sb x0,0(x30)
	li x30,28
	add x30,x27,x30
	sw x0,0(x30)
	li x26,1
	jal x0,L.373
L.370:
	addi x12,x22,0
	addi x13,x8,-16+32
	addi x14,x24,0
	addi x15,x26,0
	jal x1,gen_numname
	addi x12,x27,0
	jal x1,dir_find
	addi x25,x10,0
	beq x25,x0,L.374
	jal x0,L.372
L.374:
L.371:
	li x30,1
	add x26,x26,x30
L.373:
	li x30,100
	bltu x26,x30,L.370
L.372:
	li x30,100
	bne x26,x30,L.376
	li x10,7
	jal x0,L.363
L.376:
	li x30,4
	beq x25,x30,L.378
	addi x10,x25,0
	jal x0,L.363
L.378:
	li x30,11
	add x30,x22,x30
	lbu x29,-5+32(x8)
	sb x29,0(x30)
	li x30,28
	add x30,x27,x30
	sw x24,0(x30)
L.367:
	lbu x30,-5+32(x8)
	andi x30,x30,2
	beq x30,x0,L.381
	addi x26,x0,0
	jal x0,L.387
L.384:
L.385:
	li x30,1
	add x26,x26,x30
L.387:
	li x30,1
	sll x30,x26,x30
	add x30,x30,x24
	lhu x30,0(x30)
	bne x30,x0,L.384
	li x30,25
	add x30,x26,x30
	li x29,13
	divu x23,x30,x29
	jal x0,L.382
L.381:
	li x23,1
L.382:
	addi x12,x27,0
	addi x13,x23,0
	jal x1,dir_alloc
	addi x25,x10,0
	bne x25,x0,L.388
	li x30,1
	sub x30,x23,x30
	addi x23,x30,0
	beq x30,x0,L.388
	addi x12,x27,0
	li x30,6
	add x30,x27,x30
	lhu x30,0(x30)
	sub x13,x30,x23
	jal x1,dir_sdi
	addi x25,x10,0
	bne x25,x0,L.390
	li x30,24
	add x30,x27,x30
	lw x12,0(x30)
	jal x1,sum_sfn
	addi x30,x10,0
	sb x30,-17+32(x8)
L.392:
	lw x12,0(x27)
	li x30,16
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,move_window
	addi x25,x10,0
	beq x25,x0,L.395
	jal x0,L.394
L.395:
	li x30,28
	add x30,x27,x30
	lw x12,0(x30)
	li x30,20
	add x30,x27,x30
	lw x13,0(x30)
	addi x30,x23,0
	slli x14,x30,8*(4-1)
	srli x14,x14,8*(4-1)
	lbu x15,-17+32(x8)
	jal x1,fit_lfn
	lw x30,0(x27)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	addi x12,x27,0
	addi x13,x0,0
	jal x1,dir_next
	addi x25,x10,0
L.393:
	bne x25,x0,L.397
	li x30,1
	sub x30,x23,x30
	addi x23,x30,0
	bne x30,x0,L.392
L.397:
L.394:
L.390:
L.388:
	bne x25,x0,L.398
	lw x12,0(x27)
	li x30,16
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,move_window
	addi x25,x10,0
	bne x25,x0,L.400
	li x30,20
	add x30,x27,x30
	lw x12,0(x30)
	addi x13,x0,0
	li x14,32
	jal x1,mem_set
	li x30,20
	add x30,x27,x30
	lw x12,0(x30)
	li x30,24
	add x30,x27,x30
	lw x13,0(x30)
	li x14,11
	jal x1,mem_cpy
	li x30,24
	li x29,20
	add x29,x27,x29
	lw x29,0(x29)
	li x28,12
	add x29,x29,x28
	add x28,x27,x30
	lw x28,0(x28)
	li x7,11
	add x28,x28,x7
	lbu x28,0(x28)
	and x30,x28,x30
	sb x30,0(x29)
	lw x30,0(x27)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
L.400:
L.398:
	addi x10,x25,0
L.363:
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

	.align	4
dir_remove:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	mv x27,x12
	li x30,6
	add x30,x27,x30
	lhu x30,0(x30)
	addi x25,x30,0
	addi x12,x27,0
	li x30,32
	add x30,x27,x30
	lhu x30,0(x30)
	li x29,65535
	bne x30,x29,L.404
	addi x24,x25,0
	jal x0,L.405
L.404:
	li x30,32
	add x30,x27,x30
	lhu x30,0(x30)
	addi x24,x30,0
L.405:
	addi x13,x24,0
	jal x1,dir_sdi
	addi x26,x10,0
	bne x26,x0,L.406
L.408:
	lw x12,0(x27)
	li x30,16
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,move_window
	addi x26,x10,0
	beq x26,x0,L.411
	jal x0,L.410
L.411:
	li x30,20
	add x30,x27,x30
	lw x12,0(x30)
	addi x13,x0,0
	li x14,32
	jal x1,mem_set
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	li x29,229
	sb x29,0(x30)
	lw x30,0(x27)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	li x30,6
	add x30,x27,x30
	lhu x30,0(x30)
	bltu x30,x25,L.413
	jal x0,L.410
L.413:
	addi x12,x27,0
	addi x13,x0,0
	jal x1,dir_next
	addi x26,x10,0
L.409:
	beq x26,x0,L.408
L.410:
	li x30,4
	bne x26,x30,L.415
	li x26,2
L.415:
L.406:
	addi x10,x26,0
L.402:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
get_fileinfo:
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
	li x30,9
	add x24,x27,x30
	lw x30,0+16(x8)
	li x29,16
	add x30,x30,x29
	lw x30,0(x30)
	beq x30,x0,L.418
	lw x30,0+16(x8)
	li x29,20
	add x30,x30,x29
	lw x23,0(x30)
	addi x25,x0,0
	jal x0,L.421
L.420:
	addi x30,x25,0
	li x29,1
	add x25,x30,x29
	add x30,x30,x23
	lbu x30,0(x30)
	addi x26,x30,0
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,32
	bne x30,x29,L.423
	jal x0,L.421
L.423:
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,5
	bne x30,x29,L.425
	li x30,229
	addi x26,x30,0
L.425:
	li x30,9
	bne x25,x30,L.427
	addi x30,x24,0
	li x29,1
	add x24,x30,x29
	li x29,46
	sb x29,0(x30)
L.427:
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,65
	blt x30,x29,L.429
	li x29,90
	bgt x30,x29,L.429
	li x30,9
	bltu x25,x30,L.432
	li x22,16
	jal x0,L.433
L.432:
	li x22,8
L.433:
	li x30,12
	add x30,x23,x30
	lbu x30,0(x30)
	and x30,x30,x22
	beq x30,x0,L.429
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	addi x30,x30,32
	addi x26,x30,0
L.429:
	addi x30,x24,0
	li x29,1
	add x24,x30,x29
	sb x26,0(x30)
L.421:
	li x30,11
	bltu x25,x30,L.420
	li x30,8
	add x30,x27,x30
	li x29,11
	add x29,x23,x29
	lbu x29,0(x29)
	sb x29,0(x30)
	li x30,31
	add x30,x23,x30
	lbu x30,0(x30)
	li x29,24
	sll x30,x30,x29
	li x29,30
	add x29,x23,x29
	lbu x29,0(x29)
	li x28,16
	sll x29,x29,x28
	or x30,x30,x29
	li x29,29
	add x29,x23,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	or x30,x30,x29
	li x29,28
	add x29,x23,x29
	lbu x29,0(x29)
	or x30,x30,x29
	sw x30,0(x27)
	li x30,4
	add x30,x27,x30
	li x29,25
	add x29,x23,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	li x28,24
	add x28,x23,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	or x29,x29,x28
	sh x29,0(x30)
	li x30,6
	add x30,x27,x30
	li x29,23
	add x29,x23,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	li x28,22
	add x28,x23,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	or x29,x29,x28
	sh x29,0(x30)
L.418:
	sb x0,0(x24)
	li x30,24
	add x30,x27,x30
	lw x30,0(x30)
	beq x30,x0,L.434
	addi x25,x0,0
	li x30,24
	add x30,x27,x30
	lw x24,0(x30)
	lw x30,0+16(x8)
	li x29,16
	add x29,x30,x29
	lw x29,0(x29)
	beq x29,x0,L.436
	li x29,28
	add x29,x27,x29
	lw x29,0(x29)
	beq x29,x0,L.436
	li x29,32
	add x30,x30,x29
	lhu x30,0(x30)
	li x29,65535
	beq x30,x29,L.436
	lw x30,0+16(x8)
	li x29,28
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-8+16(x8)
	jal x0,L.439
L.438:
	slli x12,x23,8*(4-2)
	srli x12,x12,8*(4-2)
	addi x13,x0,0
	jal x1,ff_convert
	addi x30,x10,0
	addi x23,x30,0
	slli x30,x23,8*(4-2)
	srli x30,x30,8*(4-2)
	bne x30,x0,L.441
	addi x25,x0,0
	jal x0,L.440
L.441:
	slli x30,x23,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,256
	blt x30,x29,L.443
	addi x30,x25,0
	li x29,1
	add x25,x30,x29
	add x30,x30,x24
	slli x29,x23,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
L.443:
	li x30,28
	add x30,x27,x30
	lw x30,0(x30)
	li x29,1
	sub x30,x30,x29
	bltu x25,x30,L.445
	addi x25,x0,0
	jal x0,L.440
L.445:
	addi x30,x25,0
	li x29,1
	add x25,x30,x29
	add x30,x30,x24
	slli x29,x23,8*(4-2)
	srli x29,x29,8*(4-2)
	sb x29,0(x30)
L.439:
	lw x30,-8+16(x8)
	li x29,2
	add x29,x30,x29
	sw x29,-8+16(x8)
	lhu x30,0(x30)
	addi x23,x30,0
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	bne x30,x0,L.438
L.440:
L.436:
	add x30,x25,x24
	sb x0,0(x30)
L.434:
L.417:
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
create_name:
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
	sw x13,20(x8)
	lw x30,4+16(x8)
	lw x22,0(x30)
	jal x0,L.451
L.448:
L.449:
	li x30,1
	add x22,x22,x30
L.451:
	lb x30,0(x22)
	li x29,47
	beq x30,x29,L.448
	li x29,92
	beq x30,x29,L.448
	li x30,28
	add x30,x27,x30
	lw x23,0(x30)
	addi x25,x0,0
	addi x24,x0,0
L.452:
	addi x30,x24,0
	li x29,1
	add x24,x30,x29
	add x30,x30,x22
	lb x30,0(x30)
	addi x26,x30,0
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,32
	blt x30,x29,L.459
	li x29,47
	beq x30,x29,L.459
	li x29,92
	bne x30,x29,L.456
L.459:
	jal x0,L.454
L.456:
	li x30,255
	bltu x25,x30,L.460
	li x10,6
	jal x0,L.447
L.460:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	andi x30,x30,255
	addi x26,x30,0
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,129
	blt x30,x29,L.465
	li x29,159
	ble x30,x29,L.464
L.465:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,224
	blt x30,x29,L.462
	li x29,252
	bgt x30,x29,L.462
L.464:
	addi x30,x24,0
	li x29,1
	add x24,x30,x29
	add x30,x30,x22
	lb x30,0(x30)
	addi x21,x30,0
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,64
	blt x30,x29,L.468
	li x29,126
	ble x30,x29,L.466
L.468:
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,128
	blt x30,x29,L.469
	li x29,252
	ble x30,x29,L.466
L.469:
	li x10,6
	jal x0,L.447
L.466:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,8
	sll x30,x30,x29
	slli x29,x21,8*(4-1)
	srli x29,x29,8*(4-1)
	add x30,x30,x29
	addi x26,x30,0
L.462:
	slli x12,x26,8*(4-2)
	srli x12,x12,8*(4-2)
	li x13,1
	jal x1,ff_convert
	addi x30,x10,0
	addi x26,x30,0
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	bne x30,x0,L.470
	li x10,6
	jal x0,L.447
L.470:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,128
	bge x30,x29,L.472
	la x12,L.474
	addi x13,x30,0
	jal x1,chk_chr
	beq x10,x0,L.472
	li x10,6
	jal x0,L.447
L.472:
	addi x30,x25,0
	li x29,1
	add x25,x30,x29
	li x29,1
	sll x30,x30,x29
	add x30,x30,x23
	sh x26,0(x30)
	jal x0,L.452
L.454:
	lw x30,4+16(x8)
	add x29,x24,x22
	sw x29,0(x30)
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,32
	bge x30,x29,L.476
	li x30,4
	sw x30,-8+16(x8)
	jal x0,L.477
L.476:
	sw x0,-8+16(x8)
L.477:
	lw x30,-8+16(x8)
	addi x18,x30,0
	jal x0,L.479
L.478:
	li x30,1
	sub x30,x25,x30
	li x29,1
	sll x30,x30,x29
	add x30,x30,x23
	lhu x26,0(x30)
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,32
	beq x30,x29,L.481
	li x29,46
	beq x30,x29,L.481
	jal x0,L.480
L.481:
	li x30,1
	sub x25,x25,x30
L.479:
	bne x25,x0,L.478
L.480:
	bne x25,x0,L.483
	li x10,6
	jal x0,L.447
L.483:
	li x30,1
	sll x30,x25,x30
	add x30,x30,x23
	sh x0,0(x30)
	li x30,24
	add x30,x27,x30
	lw x12,0(x30)
	li x13,32
	li x14,11
	jal x1,mem_set
	addi x24,x0,0
	jal x0,L.488
L.485:
L.486:
	li x30,1
	add x24,x24,x30
L.488:
	li x30,1
	sll x30,x24,x30
	add x30,x30,x23
	lhu x30,0(x30)
	li x29,32
	beq x30,x29,L.485
	li x29,46
	beq x30,x29,L.485
	beq x24,x0,L.492
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,3
	addi x18,x30,0
	jal x0,L.492
L.491:
	li x30,1
	sub x25,x25,x30
L.492:
	beq x25,x0,L.494
	li x30,1
	sub x30,x25,x30
	li x29,1
	sll x30,x30,x29
	add x30,x30,x23
	lhu x30,0(x30)
	li x29,46
	bne x30,x29,L.491
L.494:
	addi x20,x0,0
	addi x21,x0,0
	li x19,8
L.495:
	addi x30,x24,0
	li x29,1
	add x24,x30,x29
	li x29,1
	sll x30,x30,x29
	add x30,x30,x23
	lhu x26,0(x30)
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	bne x30,x0,L.499
	jal x0,L.497
L.499:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,32
	beq x30,x29,L.503
	li x29,46
	bne x30,x29,L.501
	beq x24,x25,L.501
L.503:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,3
	addi x18,x30,0
	jal x0,L.495
L.501:
	bgeu x20,x19,L.506
	bne x24,x25,L.504
L.506:
	li x30,11
	bne x19,x30,L.507
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,3
	addi x18,x30,0
	jal x0,L.497
L.507:
	beq x24,x25,L.509
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,3
	addi x18,x30,0
L.509:
	bleu x24,x25,L.511
	jal x0,L.497
L.511:
	addi x24,x25,0
	li x20,8
	li x19,11
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,2
	sll x30,x30,x29
	addi x21,x30,0
	jal x0,L.495
L.504:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,128
	blt x30,x29,L.513
	slli x12,x26,8*(4-2)
	srli x12,x12,8*(4-2)
	jal x1,ff_wtoupper
	addi x30,x10,0
	slli x12,x30,8*(4-2)
	srli x12,x12,8*(4-2)
	addi x13,x0,0
	jal x1,ff_convert
	addi x30,x10,0
	addi x26,x30,0
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,2
	addi x18,x30,0
L.513:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,256
	blt x30,x29,L.515
	li x30,1
	sub x30,x19,x30
	bltu x20,x30,L.517
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,3
	addi x18,x30,0
	addi x20,x19,0
	jal x0,L.495
L.517:
	addi x30,x20,0
	li x29,1
	add x20,x30,x29
	li x29,24
	add x29,x27,x29
	lw x29,0(x29)
	add x30,x30,x29
	slli x29,x26,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	jal x0,L.516
L.515:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	beq x30,x0,L.522
	la x12,L.521
	addi x13,x30,0
	jal x1,chk_chr
	beq x10,x0,L.519
L.522:
	li x26,95
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,3
	addi x18,x30,0
	jal x0,L.520
L.519:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,65
	blt x30,x29,L.523
	li x29,90
	bgt x30,x29,L.523
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,2
	addi x21,x30,0
	jal x0,L.524
L.523:
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,97
	blt x30,x29,L.525
	li x29,122
	bgt x30,x29,L.525
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,1
	addi x21,x30,0
	slli x30,x26,8*(4-2)
	srli x30,x30,8*(4-2)
	addi x30,x30,-32
	addi x26,x30,0
L.525:
L.524:
L.520:
L.516:
	addi x30,x20,0
	li x29,1
	add x20,x30,x29
	li x29,24
	add x29,x27,x29
	lw x29,0(x29)
	add x30,x30,x29
	slli x29,x26,8*(4-2)
	srli x29,x29,8*(4-2)
	sb x29,0(x30)
	jal x0,L.495
L.497:
	li x30,24
	add x30,x27,x30
	lw x30,0(x30)
	lbu x30,0(x30)
	li x29,229
	bne x30,x29,L.527
	li x30,24
	add x30,x27,x30
	lw x30,0(x30)
	li x29,5
	sb x29,0(x30)
L.527:
	li x30,8
	bne x19,x30,L.529
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,2
	sll x30,x30,x29
	addi x21,x30,0
L.529:
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,12
	and x28,x30,x29
	beq x28,x29,L.533
	li x29,3
	and x30,x30,x29
	bne x30,x29,L.531
L.533:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,2
	addi x18,x30,0
L.531:
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,2
	bne x30,x0,L.534
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,3
	li x29,1
	bne x30,x29,L.536
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,16
	addi x18,x30,0
L.536:
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,12
	li x29,4
	bne x30,x29,L.538
	slli x30,x18,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,8
	addi x18,x30,0
L.538:
L.534:
	li x30,24
	add x30,x27,x30
	lw x30,0(x30)
	li x29,11
	add x30,x30,x29
	sb x18,0(x30)
	addi x10,x0,0
L.447:
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
follow_path:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	mv x27,x12
	sw x13,20(x8)
	lw x30,4+16(x8)
	lb x30,0(x30)
	li x29,47
	beq x30,x29,L.543
	li x29,92
	bne x30,x29,L.541
L.543:
	lw x30,4+16(x8)
	li x29,1
	add x30,x30,x29
	sw x30,4+16(x8)
L.541:
	li x30,8
	add x30,x27,x30
	sw x0,0(x30)
	lw x30,4+16(x8)
	lb x30,0(x30)
	li x29,32
	bgeu x30,x29,L.544
	addi x12,x27,0
	addi x13,x0,0
	jal x1,dir_sdi
	addi x26,x10,0
	li x30,20
	add x30,x27,x30
	sw x0,0(x30)
	jal x0,L.545
L.544:
L.546:
	addi x12,x27,0
	addi x13,x8,4+16
	jal x1,create_name
	addi x26,x10,0
	beq x26,x0,L.550
	jal x0,L.548
L.550:
	addi x12,x27,0
	jal x1,dir_find
	addi x26,x10,0
	li x30,24
	add x30,x27,x30
	lw x30,0(x30)
	li x29,11
	add x30,x30,x29
	lbu x24,0(x30)
	beq x26,x0,L.552
	li x30,4
	bne x26,x30,L.548
	jal x0,L.556
	li x30,8
	add x30,x27,x30
	sw x0,0(x30)
	li x30,20
	add x30,x27,x30
	sw x0,0(x30)
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	bne x30,x0,L.558
	jal x0,L.546
L.558:
	addi x26,x0,0
	jal x0,L.548
L.556:
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	bne x30,x0,L.548
	li x26,5
	jal x0,L.548
L.552:
	slli x30,x24,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	beq x30,x0,L.562
	jal x0,L.548
L.562:
	li x30,20
	add x30,x27,x30
	lw x25,0(x30)
	li x30,11
	add x30,x25,x30
	lbu x30,0(x30)
	andi x30,x30,16
	bne x30,x0,L.564
	li x26,5
	jal x0,L.548
L.564:
	lw x12,0(x27)
	addi x13,x25,0
	jal x1,ld_clust
	li x29,8
	add x29,x27,x29
	sw x10,0(x29)
	jal x0,L.546
L.548:
L.545:
	addi x10,x26,0
L.540:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
get_ldnumber:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	sw x27,0(x2)
	li x30,-1
	sw x30,-8+16(x8)
	lw x30,0(x12)
	beq x30,x0,L.567
	lw x27,0(x12)
	jal x0,L.572
L.569:
L.570:
	li x30,1
	add x27,x27,x30
L.572:
	lb x30,0(x27)
	addi x29,x30,0
	li x28,32
	bltu x29,x28,L.573
	li x29,58
	bne x30,x29,L.569
L.573:
	lb x30,0(x27)
	li x29,58
	bne x30,x29,L.574
	lw x30,0(x12)
	sw x30,-12+16(x8)
	lw x30,-12+16(x8)
	li x29,1
	add x29,x30,x29
	sw x29,-12+16(x8)
	lb x30,0(x30)
	addi x30,x30,-48
	sw x30,-16+16(x8)
	lw x30,-16+16(x8)
	li x29,10
	bgeu x30,x29,L.576
	lw x30,-12+16(x8)
	addi x29,x27,0
	bne x30,x29,L.576
	lw x30,-16+16(x8)
	li x29,1
	bgeu x30,x29,L.577
	lw x30,-16+16(x8)
	sw x30,-8+16(x8)
	li x30,1
	add x30,x27,x30
	addi x27,x30,0
	sw x30,0(x12)
L.576:
L.577:
	lw x10,-8+16(x8)
	jal x0,L.566
L.574:
	sw x0,-8+16(x8)
L.567:
	lw x10,-8+16(x8)
L.566:
	lw x27,0(x2)
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align	4
check_fs:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	mv x27,x12
	sw x13,20(x8)
	li x30,4
	add x30,x27,x30
	sb x0,0(x30)
	li x30,44
	add x30,x27,x30
	li x29,0xffffffff
	sw x29,0(x30)
	addi x12,x27,0
	lw x13,4+16(x8)
	jal x1,move_window
	beq x10,x0,L.581
	li x10,3
	jal x0,L.580
L.581:
	li x30,559
	add x30,x27,x30
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,8
	sll x30,x30,x29
	li x29,558
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	or x30,x30,x29
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,43605
	beq x30,x29,L.583
	li x10,2
	jal x0,L.580
L.583:
	li x30,105
	add x30,x27,x30
	lbu x30,0(x30)
	li x29,24
	sll x30,x30,x29
	li x29,104
	add x29,x27,x29
	lbu x29,0(x29)
	li x28,16
	sll x29,x29,x28
	or x30,x30,x29
	li x29,103
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	or x30,x30,x29
	li x29,102
	add x29,x27,x29
	lbu x29,0(x29)
	or x30,x30,x29
	li x29,0xffffff
	and x30,x30,x29
	li x29,0x544146
	bne x30,x29,L.585
	addi x10,x0,0
	jal x0,L.580
L.585:
	li x30,133
	add x30,x27,x30
	lbu x30,0(x30)
	li x29,24
	sll x30,x30,x29
	li x29,132
	add x29,x27,x29
	lbu x29,0(x29)
	li x28,16
	sll x29,x29,x28
	or x30,x30,x29
	li x29,131
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	or x30,x30,x29
	li x29,130
	add x29,x27,x29
	lbu x29,0(x29)
	or x30,x30,x29
	li x29,0xffffff
	and x30,x30,x29
	li x29,0x544146
	bne x30,x29,L.587
	addi x10,x0,0
	jal x0,L.580
L.587:
	li x10,1
L.580:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
find_volume:
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
	sw x12,48(x8)
	sw x13,52(x8)
	sw x14,56(x8)
	lw x30,8+48(x8)
	sb x30,8+48(x8)
	lw x30,0+48(x8)
	sw x0,0(x30)
	lw x12,4+48(x8)
	jal x1,get_ldnumber
	addi x20,x10,0
	bge x20,x0,L.590
	li x10,11
	jal x0,L.589
L.590:
	li x30,2
	sll x30,x20,x30
	la x29,FatFs
	add x30,x30,x29
	lw x27,0(x30)
	addi x30,x27,0
	bne x30,x0,L.592
	li x10,12
	jal x0,L.589
L.592:
	lw x30,0+48(x8)
	sw x27,0(x30)
	lbu x30,0(x27)
	beq x30,x0,L.594
	li x30,1
	add x30,x27,x30
	lbu x12,0(x30)
	jal x1,disk_status
	addi x30,x10,0
	addi x21,x30,0
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,1
	bne x30,x0,L.596
	lbu x29,8+48(x8)
	beq x29,x0,L.598
	slli x29,x21,8*(4-1)
	srli x29,x29,8*(4-1)
	andi x29,x29,4
	beq x29,x0,L.598
	li x10,10
	jal x0,L.589
L.598:
	addi x10,x0,0
	jal x0,L.589
L.596:
L.594:
	sb x0,0(x27)
	li x30,1
	add x30,x27,x30
	addi x29,x20,0
	sb x29,0(x30)
	li x30,1
	add x30,x27,x30
	lbu x12,0(x30)
	jal x1,disk_initialize
	addi x30,x10,0
	addi x21,x30,0
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,1
	beq x30,x0,L.600
	li x10,3
	jal x0,L.589
L.600:
	lbu x29,8+48(x8)
	beq x29,x0,L.602
	slli x29,x21,8*(4-1)
	srli x29,x29,8*(4-1)
	andi x29,x29,4
	beq x29,x0,L.602
	li x10,10
	jal x0,L.589
L.602:
	addi x26,x0,0
	addi x12,x27,0
	addi x13,x26,0
	jal x1,check_fs
	addi x30,x10,0
	addi x25,x30,0
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,1
	beq x30,x29,L.606
	bne x30,x0,L.604
	jal x0,L.604
L.606:
	sw x0,-12+48(x8)
	jal x0,L.610
L.607:
	lw x30,-12+48(x8)
	li x29,4
	sll x30,x30,x29
	li x29,494
	add x29,x27,x29
	add x30,x30,x29
	sw x30,-32+48(x8)
	lw x30,-32+48(x8)
	li x29,4
	add x30,x30,x29
	lbu x30,0(x30)
	beq x30,x0,L.612
	lw x30,-32+48(x8)
	li x29,8
	li x28,11
	add x28,x30,x28
	lbu x28,0(x28)
	li x7,24
	sll x28,x28,x7
	li x7,10
	add x7,x30,x7
	lbu x7,0(x7)
	li x6,16
	sll x7,x7,x6
	or x28,x28,x7
	li x7,9
	add x7,x30,x7
	lbu x7,0(x7)
	slli x7,x7,8*(4-2)
	srli x7,x7,8*(4-2)
	sll x7,x7,x29
	or x28,x28,x7
	add x30,x30,x29
	lbu x30,0(x30)
	or x30,x28,x30
	sw x30,-36+48(x8)
	jal x0,L.613
L.612:
	sw x0,-36+48(x8)
L.613:
	lw x30,-12+48(x8)
	li x29,2
	sll x30,x30,x29
	addi x29,x8,-28+48
	add x30,x30,x29
	lw x29,-36+48(x8)
	sw x29,0(x30)
L.608:
	lw x30,-12+48(x8)
	li x29,1
	add x30,x30,x29
	sw x30,-12+48(x8)
L.610:
	lw x30,-12+48(x8)
	li x29,4
	bltu x30,x29,L.607
	sw x0,-12+48(x8)
	lw x29,-12+48(x8)
	beq x29,x0,L.614
	lw x30,-12+48(x8)
	li x29,1
	sub x30,x30,x29
	sw x30,-12+48(x8)
L.614:
L.616:
	lw x30,-12+48(x8)
	li x29,2
	sll x30,x30,x29
	addi x29,x8,-28+48
	add x30,x30,x29
	lw x26,0(x30)
	beq x26,x0,L.620
	addi x12,x27,0
	addi x13,x26,0
	jal x1,check_fs
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	sw x30,-32+48(x8)
	jal x0,L.621
L.620:
	li x30,2
	sw x30,-32+48(x8)
L.621:
	lw x30,-32+48(x8)
	addi x25,x30,0
L.617:
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	beq x30,x0,L.622
	lw x30,-12+48(x8)
	li x29,1
	add x30,x30,x29
	sw x30,-12+48(x8)
	li x29,4
	bltu x30,x29,L.616
L.622:
L.604:
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,3
	bne x30,x29,L.623
	li x10,1
	jal x0,L.589
L.623:
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	beq x30,x0,L.625
	li x10,13
	jal x0,L.589
L.625:
	li x30,60
	add x30,x27,x30
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,8
	sll x30,x30,x29
	li x29,59
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	or x30,x30,x29
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,512
	beq x30,x29,L.627
	li x10,13
	jal x0,L.589
L.627:
	li x30,71
	add x30,x27,x30
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,8
	sll x30,x30,x29
	li x29,70
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	or x30,x30,x29
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	addi x24,x30,0
	bne x24,x0,L.629
	li x30,87
	add x30,x27,x30
	lbu x30,0(x30)
	li x29,24
	sll x30,x30,x29
	li x29,86
	add x29,x27,x29
	lbu x29,0(x29)
	li x28,16
	sll x29,x29,x28
	or x30,x30,x29
	li x29,85
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	or x30,x30,x29
	li x29,84
	add x29,x27,x29
	lbu x29,0(x29)
	or x24,x30,x29
L.629:
	li x30,24
	add x30,x27,x30
	sw x24,0(x30)
	li x30,3
	add x30,x27,x30
	li x29,64
	add x29,x27,x29
	lbu x29,0(x29)
	sb x29,0(x30)
	li x30,3
	add x30,x27,x30
	lbu x30,0(x30)
	li x29,1
	beq x30,x29,L.631
	li x29,2
	beq x30,x29,L.631
	li x10,13
	jal x0,L.589
L.631:
	li x30,3
	add x30,x27,x30
	lbu x30,0(x30)
	mul x24,x24,x30
	li x30,2
	add x30,x27,x30
	li x29,61
	add x29,x27,x29
	lbu x29,0(x29)
	sb x29,0(x30)
	li x30,2
	add x30,x27,x30
	lbu x30,0(x30)
	beq x30,x0,L.635
	addi x28,x30,-1
	and x30,x30,x28
	beq x30,x0,L.633
L.635:
	li x10,13
	jal x0,L.589
L.633:
	li x30,8
	add x29,x27,x30
	li x28,66
	add x28,x27,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	sll x30,x28,x30
	li x28,65
	add x28,x27,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	or x30,x30,x28
	sh x30,0(x29)
	li x30,8
	add x30,x27,x30
	lhu x30,0(x30)
	li x29,15
	and x30,x30,x29
	beq x30,x0,L.636
	li x10,13
	jal x0,L.589
L.636:
	li x30,68
	add x30,x27,x30
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,8
	sll x30,x30,x29
	li x29,67
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	or x30,x30,x29
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	addi x22,x30,0
	bne x22,x0,L.638
	li x30,83
	add x30,x27,x30
	lbu x30,0(x30)
	li x29,24
	sll x30,x30,x29
	li x29,82
	add x29,x27,x29
	lbu x29,0(x29)
	li x28,16
	sll x29,x29,x28
	or x30,x30,x29
	li x29,81
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	or x30,x30,x29
	li x29,80
	add x29,x27,x29
	lbu x29,0(x29)
	or x22,x30,x29
L.638:
	li x30,63
	add x30,x27,x30
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,8
	sll x30,x30,x29
	li x29,62
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	or x30,x30,x29
	addi x18,x30,0
	slli x30,x18,8*(4-2)
	srli x30,x30,8*(4-2)
	bne x30,x0,L.640
	li x10,13
	jal x0,L.589
L.640:
	slli x30,x18,8*(4-2)
	srli x30,x30,8*(4-2)
	add x30,x30,x24
	li x29,8
	add x29,x27,x29
	lhu x29,0(x29)
	li x28,4
	srl x29,x29,x28
	add x19,x30,x29
	bgeu x22,x19,L.642
	li x10,13
	jal x0,L.589
L.642:
	sub x30,x22,x19
	li x29,2
	add x29,x27,x29
	lbu x29,0(x29)
	divu x23,x30,x29
	bne x23,x0,L.644
	li x10,13
	jal x0,L.589
L.644:
	li x25,1
	li x30,4086
	bltu x23,x30,L.646
	li x25,2
L.646:
	li x30,0xfff6
	bltu x23,x30,L.648
	li x25,3
L.648:
	li x30,20
	add x30,x27,x30
	li x29,2
	add x29,x23,x29
	sw x29,0(x30)
	li x30,28
	add x30,x27,x30
	sw x26,0(x30)
	li x30,32
	add x30,x27,x30
	slli x29,x18,8*(4-2)
	srli x29,x29,8*(4-2)
	add x29,x26,x29
	sw x29,0(x30)
	li x30,40
	add x30,x27,x30
	add x29,x26,x19
	sw x29,0(x30)
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,3
	bne x30,x29,L.650
	li x30,8
	add x30,x27,x30
	lhu x30,0(x30)
	beq x30,x0,L.652
	li x10,13
	jal x0,L.589
L.652:
	li x30,36
	add x30,x27,x30
	li x29,95
	add x29,x27,x29
	lbu x29,0(x29)
	li x28,24
	sll x29,x29,x28
	li x28,94
	add x28,x27,x28
	lbu x28,0(x28)
	li x7,16
	sll x28,x28,x7
	or x29,x29,x28
	li x28,93
	add x28,x27,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	li x7,8
	sll x28,x28,x7
	or x29,x29,x28
	li x28,92
	add x28,x27,x28
	lbu x28,0(x28)
	or x29,x29,x28
	sw x29,0(x30)
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	li x29,2
	sll x30,x30,x29
	sw x30,-8+48(x8)
	jal x0,L.651
L.650:
	li x30,8
	add x30,x27,x30
	lhu x30,0(x30)
	bne x30,x0,L.654
	li x10,13
	jal x0,L.589
L.654:
	li x30,36
	add x30,x27,x30
	li x29,32
	add x29,x27,x29
	lw x29,0(x29)
	add x29,x29,x24
	sw x29,0(x30)
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,2
	bne x30,x29,L.657
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	li x29,1
	sll x30,x30,x29
	sw x30,-12+48(x8)
	jal x0,L.658
L.657:
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	li x29,3
	mul x29,x29,x30
	li x28,1
	srl x29,x29,x28
	li x28,1
	and x30,x30,x28
	add x30,x29,x30
	sw x30,-12+48(x8)
L.658:
	lw x30,-12+48(x8)
	sw x30,-8+48(x8)
L.651:
	li x30,24
	add x30,x27,x30
	lw x30,0(x30)
	lw x29,-8+48(x8)
	li x28,511
	add x29,x29,x28
	li x28,9
	srl x29,x29,x28
	bgeu x30,x29,L.659
	li x10,13
	jal x0,L.589
L.659:
	li x30,0xffffffff
	li x29,16
	add x29,x27,x29
	sw x30,0(x29)
	li x29,12
	add x29,x27,x29
	sw x30,0(x29)
	li x30,5
	add x30,x27,x30
	li x29,128
	sb x29,0(x30)
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,3
	bne x30,x29,L.661
	li x30,97
	add x30,x27,x30
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,8
	sll x30,x30,x29
	li x29,96
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	or x30,x30,x29
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,1
	bne x30,x29,L.661
	addi x12,x27,0
	li x30,1
	add x13,x26,x30
	jal x1,move_window
	bne x10,x0,L.661
	li x30,5
	add x30,x27,x30
	sb x0,0(x30)
	li x30,8
	li x29,559
	add x29,x27,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	sll x29,x29,x30
	li x28,558
	add x28,x27,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	or x29,x29,x28
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,43605
	bne x29,x28,L.663
	li x29,24
	li x28,16
	li x7,51
	add x7,x27,x7
	lbu x7,0(x7)
	sll x7,x7,x29
	li x6,50
	add x6,x27,x6
	lbu x6,0(x6)
	sll x6,x6,x28
	or x7,x7,x6
	li x6,49
	add x6,x27,x6
	lbu x6,0(x6)
	slli x6,x6,8*(4-2)
	srli x6,x6,8*(4-2)
	sll x6,x6,x30
	or x7,x7,x6
	li x6,48
	add x6,x27,x6
	lbu x6,0(x6)
	or x7,x7,x6
	li x6,0x41615252
	bne x7,x6,L.663
	li x7,535
	add x7,x27,x7
	lbu x7,0(x7)
	sll x29,x7,x29
	li x7,534
	add x7,x27,x7
	lbu x7,0(x7)
	sll x28,x7,x28
	or x29,x29,x28
	li x28,533
	add x28,x27,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	sll x30,x28,x30
	or x30,x29,x30
	li x29,532
	add x29,x27,x29
	lbu x29,0(x29)
	or x30,x30,x29
	li x29,0x61417272
	bne x30,x29,L.663
	li x30,16
	add x29,x27,x30
	li x28,539
	add x28,x27,x28
	lbu x28,0(x28)
	li x7,24
	sll x28,x28,x7
	li x7,538
	add x7,x27,x7
	lbu x7,0(x7)
	sll x30,x7,x30
	or x30,x28,x30
	li x28,537
	add x28,x27,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	li x7,8
	sll x28,x28,x7
	or x30,x30,x28
	li x28,536
	add x28,x27,x28
	lbu x28,0(x28)
	or x30,x30,x28
	sw x30,0(x29)
	li x30,12
	add x30,x27,x30
	li x29,543
	add x29,x27,x29
	lbu x29,0(x29)
	li x28,24
	sll x29,x29,x28
	li x28,542
	add x28,x27,x28
	lbu x28,0(x28)
	li x7,16
	sll x28,x28,x7
	or x29,x29,x28
	li x28,541
	add x28,x27,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	li x7,8
	sll x28,x28,x7
	or x29,x29,x28
	li x28,540
	add x28,x27,x28
	lbu x28,0(x28)
	or x29,x29,x28
	sw x29,0(x30)
L.663:
L.661:
	sb x25,0(x27)
	la x30,Fsid
	lhu x29,0(x30)
	addi x29,x29,1
	sh x29,0(x30)
	li x30,6
	add x30,x27,x30
	sh x29,0(x30)
	addi x10,x0,0
L.589:
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

	.align	4
validate:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	lw x27,0+16(x8)
	addi x29,x27,0
	beq x29,x0,L.670
	lw x29,0(x27)
	addi x28,x29,0
	beq x28,x0,L.670
	lbu x30,0(x29)
	beq x30,x0,L.670
	li x30,6
	add x30,x29,x30
	lhu x30,0(x30)
	li x29,4
	add x29,x27,x29
	lhu x29,0(x29)
	beq x30,x29,L.666
L.670:
	li x10,9
	jal x0,L.665
L.666:
	lw x30,0(x27)
	li x29,1
	add x30,x30,x29
	lbu x12,0(x30)
	jal x1,disk_status
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,1
	beq x30,x0,L.671
	li x10,3
	jal x0,L.665
L.671:
	addi x10,x0,0
L.665:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl f_mount
	.align	4
f_mount:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	sw x14,24(x8)
	lw x30,8+16(x8)
	sb x30,8+16(x8)
	lw x30,4+16(x8)
	sw x30,-16+16(x8)
	addi x12,x8,-16+16
	jal x1,get_ldnumber
	addi x27,x10,0
	bge x27,x0,L.674
	li x10,11
	jal x0,L.673
L.674:
	li x30,2
	sll x30,x27,x30
	la x29,FatFs
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-8+16(x8)
	lw x30,-8+16(x8)
	beq x30,x0,L.676
	lw x30,-8+16(x8)
	sb x0,0(x30)
L.676:
	lw x30,0+16(x8)
	beq x30,x0,L.678
	lw x30,0+16(x8)
	sb x0,0(x30)
L.678:
	li x30,2
	sll x30,x27,x30
	la x29,FatFs
	add x30,x30,x29
	lw x29,0+16(x8)
	sw x29,0(x30)
	lw x30,0+16(x8)
	beq x30,x0,L.682
	lbu x30,8+16(x8)
	li x29,1
	beq x30,x29,L.680
L.682:
	addi x10,x0,0
	jal x0,L.673
L.680:
	addi x12,x8,0+16
	addi x13,x8,4+16
	addi x14,x0,0
	jal x1,find_volume
	sw x10,-12+16(x8)
	lw x10,-12+16(x8)
L.673:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl f_open
	.align	4
f_open:
	addi x2,x2,-112
	sw  x8,108(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	mv x27,x12
	sw x13,68(x8)
	mv x26,x14
	addi x30,x27,0
	bne x30,x0,L.684
	li x10,9
	jal x0,L.683
L.684:
	sw x0,0(x27)
	slli x30,x26,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,31
	addi x26,x30,0
	addi x12,x8,-40+64
	addi x13,x8,4+64
	slli x30,x26,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,-2
	slli x14,x30,8*(4-1)
	srli x14,x14,8*(4-1)
	jal x1,find_volume
	addi x25,x10,0
	bne x25,x0,L.686
	addi x30,x8,-52+64
	sw x30,-16+64(x8)
	la x30,LfnBuf
	sw x30,-12+64(x8)
	addi x12,x8,-40+64
	lw x13,4+64(x8)
	jal x1,follow_path
	addi x25,x10,0
	lw x24,-20+64(x8)
	bne x25,x0,L.691
	addi x30,x24,0
	bne x30,x0,L.693
	li x25,6
L.693:
L.691:
	slli x30,x26,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,28
	beq x30,x0,L.695
	beq x25,x0,L.697
	li x30,4
	bne x25,x30,L.699
	addi x12,x8,-40+64
	jal x1,dir_register
	addi x25,x10,0
L.699:
	slli x30,x26,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,8
	addi x26,x30,0
	lw x24,-20+64(x8)
	jal x0,L.698
L.697:
	li x30,11
	add x30,x24,x30
	lbu x30,0(x30)
	andi x30,x30,17
	beq x30,x0,L.702
	li x25,7
	jal x0,L.703
L.702:
	slli x30,x26,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	beq x30,x0,L.704
	li x25,8
L.704:
L.703:
L.698:
	bne x25,x0,L.696
	slli x29,x26,8*(4-1)
	srli x29,x29,8*(4-1)
	andi x29,x29,8
	beq x29,x0,L.696
	jal x1,get_fattime
	sw x10,-56+64(x8)
	li x30,14
	add x30,x24,x30
	lw x29,-56+64(x8)
	sb x29,0(x30)
	li x30,15
	add x30,x24,x30
	lw x29,-56+64(x8)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	li x30,16
	add x29,x24,x30
	lw x28,-56+64(x8)
	srl x30,x28,x30
	sb x30,0(x29)
	li x30,17
	add x30,x24,x30
	lw x29,-56+64(x8)
	li x28,24
	srl x29,x29,x28
	sb x29,0(x30)
	li x30,11
	add x30,x24,x30
	sb x0,0(x30)
	li x30,28
	add x30,x24,x30
	sb x0,0(x30)
	li x30,29
	add x30,x24,x30
	sb x0,0(x30)
	li x30,30
	add x30,x24,x30
	sb x0,0(x30)
	li x30,31
	add x30,x24,x30
	sb x0,0(x30)
	lw x12,-40+64(x8)
	addi x13,x24,0
	jal x1,ld_clust
	sw x10,-60+64(x8)
	addi x12,x24,0
	addi x13,x0,0
	jal x1,st_clust
	lw x30,-40+64(x8)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	lw x30,-60+64(x8)
	beq x30,x0,L.696
	lw x30,-40+64(x8)
	li x29,44
	add x29,x30,x29
	lw x29,0(x29)
	sw x29,-56+64(x8)
	addi x12,x30,0
	lw x13,-60+64(x8)
	jal x1,remove_chain
	addi x25,x10,0
	bne x25,x0,L.696
	lw x30,-40+64(x8)
	li x29,12
	add x30,x30,x29
	lw x29,-60+64(x8)
	li x28,1
	sub x29,x29,x28
	sw x29,0(x30)
	lw x12,-40+64(x8)
	lw x13,-56+64(x8)
	jal x1,move_window
	addi x25,x10,0
	jal x0,L.696
L.695:
	bne x25,x0,L.712
	li x30,11
	add x30,x24,x30
	lbu x30,0(x30)
	andi x30,x30,16
	beq x30,x0,L.714
	li x25,4
	jal x0,L.715
L.714:
	slli x29,x26,8*(4-1)
	srli x29,x29,8*(4-1)
	andi x29,x29,2
	beq x29,x0,L.716
	li x29,11
	add x29,x24,x29
	lbu x29,0(x29)
	andi x29,x29,1
	beq x29,x0,L.716
	li x25,7
L.716:
L.715:
L.712:
L.696:
	bne x25,x0,L.718
	slli x30,x26,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,8
	beq x30,x0,L.720
	slli x30,x26,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,32
	addi x26,x30,0
L.720:
	li x30,28
	add x30,x27,x30
	lw x29,-40+64(x8)
	li x28,44
	add x29,x29,x28
	lw x29,0(x29)
	sw x29,0(x30)
	li x30,32
	add x30,x27,x30
	sw x24,0(x30)
L.718:
	bne x25,x0,L.722
	li x30,6
	add x30,x27,x30
	sb x26,0(x30)
	li x30,7
	add x30,x27,x30
	sb x0,0(x30)
	lw x12,-40+64(x8)
	addi x13,x24,0
	jal x1,ld_clust
	li x29,16
	add x29,x27,x29
	sw x10,0(x29)
	li x30,12
	add x30,x27,x30
	li x29,31
	add x29,x24,x29
	lbu x29,0(x29)
	li x28,24
	sll x29,x29,x28
	li x28,30
	add x28,x24,x28
	lbu x28,0(x28)
	li x7,16
	sll x28,x28,x7
	or x29,x29,x28
	li x28,29
	add x28,x24,x28
	lbu x28,0(x28)
	slli x28,x28,8*(4-2)
	srli x28,x28,8*(4-2)
	li x7,8
	sll x28,x28,x7
	or x29,x29,x28
	li x28,28
	add x28,x24,x28
	lbu x28,0(x28)
	or x29,x29,x28
	sw x29,0(x30)
	li x30,8
	add x30,x27,x30
	sw x0,0(x30)
	li x30,24
	add x30,x27,x30
	sw x0,0(x30)
	lw x30,-40+64(x8)
	sw x30,0(x27)
	li x30,4
	add x30,x27,x30
	lw x29,0(x27)
	li x28,6
	add x29,x29,x28
	lhu x29,0(x29)
	sh x29,0(x30)
L.722:
L.686:
	addi x10,x25,0
L.683:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,108(x2)
	addi  x2,x2,112
	jalr x0,x1,0

	.globl f_read
	.align	4
f_read:
	addi x2,x2,-96
	sw  x8,92(x2)
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
	sw x13,20(x8)
	mv x26,x14
	mv x25,x15
	lw x22,4+16(x8)
	sw x0,0(x25)
	addi x12,x27,0
	jal x1,validate
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x30,x0,L.725
	lw x10,-8+16(x8)
	jal x0,L.724
L.725:
	li x30,7
	add x30,x27,x30
	lbu x30,0(x30)
	beq x30,x0,L.727
	li x30,7
	add x30,x27,x30
	lbu x10,0(x30)
	jal x0,L.724
L.727:
	li x30,6
	add x30,x27,x30
	lbu x30,0(x30)
	andi x30,x30,1
	bne x30,x0,L.729
	li x10,7
	jal x0,L.724
L.729:
	li x30,12
	add x30,x27,x30
	lw x30,0(x30)
	li x29,8
	add x29,x27,x29
	lw x29,0(x29)
	sub x30,x30,x29
	sw x30,-12+16(x8)
	lw x30,-12+16(x8)
	bleu x26,x30,L.736
	lw x26,-12+16(x8)
	jal x0,L.736
L.733:
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,511
	and x30,x30,x29
	bne x30,x0,L.737
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,9
	srl x30,x30,x29
	lw x29,0(x27)
	li x28,2
	add x29,x29,x28
	lbu x29,0(x29)
	addi x29,x29,-1
	and x30,x30,x29
	addi x20,x30,0
	slli x30,x20,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.739
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	bne x30,x0,L.741
	li x30,16
	add x30,x27,x30
	lw x19,0(x30)
	jal x0,L.742
L.741:
	lw x12,0(x27)
	li x30,20
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,get_fat
	addi x19,x10,0
L.742:
	li x30,2
	bgeu x19,x30,L.743
	li x30,7
	add x30,x27,x30
	li x29,2
	sb x29,0(x30)
	li x10,2
	jal x0,L.724
L.743:
	li x30,0xffffffff
	bne x19,x30,L.745
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.724
L.745:
	li x30,20
	add x30,x27,x30
	sw x19,0(x30)
L.739:
	lw x12,0(x27)
	li x30,20
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,clust2sect
	addi x23,x10,0
	bne x23,x0,L.747
	li x30,7
	add x30,x27,x30
	li x29,2
	sb x29,0(x30)
	li x10,2
	jal x0,L.724
L.747:
	slli x30,x20,8*(4-1)
	srli x30,x30,8*(4-1)
	add x23,x23,x30
	li x30,9
	srl x21,x26,x30
	beq x21,x0,L.749
	slli x30,x20,8*(4-1)
	srli x30,x30,8*(4-1)
	add x30,x30,x21
	lw x29,0(x27)
	li x28,2
	add x29,x29,x28
	lbu x29,0(x29)
	bleu x30,x29,L.751
	lw x30,0(x27)
	li x29,2
	add x30,x30,x29
	lbu x30,0(x30)
	slli x29,x20,8*(4-1)
	srli x29,x29,8*(4-1)
	sub x30,x30,x29
	addi x21,x30,0
L.751:
	lw x30,0(x27)
	li x29,1
	add x30,x30,x29
	lbu x12,0(x30)
	addi x13,x22,0
	addi x14,x23,0
	addi x15,x21,0
	jal x1,disk_read
	beq x10,x0,L.753
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.724
L.753:
	lw x30,0(x27)
	li x29,4
	add x29,x30,x29
	lbu x29,0(x29)
	beq x29,x0,L.755
	li x29,44
	add x30,x30,x29
	lw x30,0(x30)
	sub x30,x30,x23
	bgeu x30,x21,L.755
	lw x30,0(x27)
	li x29,44
	add x29,x30,x29
	lw x29,0(x29)
	sub x29,x29,x23
	li x28,9
	sll x29,x29,x28
	add x12,x29,x22
	li x29,48
	add x13,x30,x29
	li x14,512
	jal x1,mem_cpy
L.755:
	li x30,9
	sll x24,x21,x30
	jal x0,L.734
L.749:
	li x30,24
	add x30,x27,x30
	sw x23,0(x30)
L.737:
	li x30,512
	li x29,8
	add x29,x27,x29
	lw x29,0(x29)
	li x28,511
	and x29,x29,x28
	sub x24,x30,x29
	bleu x24,x26,L.757
	addi x24,x26,0
L.757:
	lw x12,0(x27)
	li x30,24
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,move_window
	beq x10,x0,L.759
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.724
L.759:
	addi x12,x22,0
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,511
	and x30,x30,x29
	lw x29,0(x27)
	li x28,48
	add x29,x29,x28
	add x13,x30,x29
	addi x14,x24,0
	jal x1,mem_cpy
L.734:
	add x22,x24,x22
	li x30,8
	add x30,x27,x30
	lw x29,0(x30)
	add x29,x29,x24
	sw x29,0(x30)
	lw x30,0(x25)
	add x30,x30,x24
	sw x30,0(x25)
	sub x26,x26,x24
L.736:
	bne x26,x0,L.733
	addi x10,x0,0
L.724:
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
	lw  x8,92(x2)
	addi  x2,x2,96
	jalr x0,x1,0

	.globl f_write
	.align	4
f_write:
	addi x2,x2,-96
	sw  x8,92(x2)
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
	sw x13,20(x8)
	mv x26,x14
	mv x25,x15
	lw x22,4+16(x8)
	sw x0,0(x25)
	addi x12,x27,0
	jal x1,validate
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	beq x30,x0,L.762
	lw x10,-8+16(x8)
	jal x0,L.761
L.762:
	li x30,7
	add x30,x27,x30
	lbu x30,0(x30)
	beq x30,x0,L.764
	li x30,7
	add x30,x27,x30
	lbu x10,0(x30)
	jal x0,L.761
L.764:
	li x30,6
	add x30,x27,x30
	lbu x30,0(x30)
	andi x30,x30,2
	bne x30,x0,L.766
	li x10,7
	jal x0,L.761
L.766:
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	add x29,x30,x26
	bgeu x29,x30,L.773
	addi x26,x0,0
	jal x0,L.773
L.770:
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,511
	and x30,x30,x29
	bne x30,x0,L.774
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,9
	srl x30,x30,x29
	lw x29,0(x27)
	li x28,2
	add x29,x29,x28
	lbu x29,0(x29)
	addi x29,x29,-1
	and x30,x30,x29
	addi x20,x30,0
	slli x30,x20,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.776
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	bne x30,x0,L.778
	li x30,16
	add x30,x27,x30
	lw x19,0(x30)
	bne x19,x0,L.779
	lw x12,0(x27)
	addi x13,x0,0
	jal x1,create_chain
	addi x19,x10,0
	jal x0,L.779
L.778:
	lw x12,0(x27)
	li x30,20
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,create_chain
	addi x19,x10,0
L.779:
	bne x19,x0,L.782
	jal x0,L.772
L.782:
	li x30,1
	bne x19,x30,L.784
	li x30,7
	add x30,x27,x30
	li x29,2
	sb x29,0(x30)
	li x10,2
	jal x0,L.761
L.784:
	li x30,0xffffffff
	bne x19,x30,L.786
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.761
L.786:
	li x30,20
	add x30,x27,x30
	sw x19,0(x30)
	li x30,16
	add x30,x27,x30
	lw x30,0(x30)
	bne x30,x0,L.788
	li x30,16
	add x30,x27,x30
	sw x19,0(x30)
L.788:
L.776:
	lw x30,0(x27)
	li x29,44
	add x29,x30,x29
	lw x29,0(x29)
	li x28,24
	add x28,x27,x28
	lw x28,0(x28)
	bne x29,x28,L.790
	addi x12,x30,0
	jal x1,sync_window
	beq x10,x0,L.790
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.761
L.790:
	lw x12,0(x27)
	li x30,20
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,clust2sect
	addi x23,x10,0
	bne x23,x0,L.792
	li x30,7
	add x30,x27,x30
	li x29,2
	sb x29,0(x30)
	li x10,2
	jal x0,L.761
L.792:
	slli x30,x20,8*(4-1)
	srli x30,x30,8*(4-1)
	add x23,x23,x30
	li x30,9
	srl x21,x26,x30
	beq x21,x0,L.794
	slli x30,x20,8*(4-1)
	srli x30,x30,8*(4-1)
	add x30,x30,x21
	lw x29,0(x27)
	li x28,2
	add x29,x29,x28
	lbu x29,0(x29)
	bleu x30,x29,L.796
	lw x30,0(x27)
	li x29,2
	add x30,x30,x29
	lbu x30,0(x30)
	slli x29,x20,8*(4-1)
	srli x29,x29,8*(4-1)
	sub x30,x30,x29
	addi x21,x30,0
L.796:
	lw x30,0(x27)
	li x29,1
	add x30,x30,x29
	lbu x12,0(x30)
	addi x13,x22,0
	addi x14,x23,0
	addi x15,x21,0
	jal x1,disk_write
	beq x10,x0,L.798
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.761
L.798:
	lw x30,0(x27)
	li x29,44
	add x30,x30,x29
	lw x30,0(x30)
	sub x30,x30,x23
	bgeu x30,x21,L.800
	lw x30,0(x27)
	li x29,48
	add x12,x30,x29
	li x29,44
	add x30,x30,x29
	lw x30,0(x30)
	sub x30,x30,x23
	li x29,9
	sll x30,x30,x29
	add x13,x30,x22
	li x14,512
	jal x1,mem_cpy
	lw x30,0(x27)
	li x29,4
	add x30,x30,x29
	sb x0,0(x30)
L.800:
	li x30,9
	sll x24,x21,x30
	jal x0,L.771
L.794:
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	bltu x30,x29,L.802
	lw x12,0(x27)
	jal x1,sync_window
	beq x10,x0,L.804
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.761
L.804:
	lw x30,0(x27)
	li x29,44
	add x30,x30,x29
	sw x23,0(x30)
L.802:
	li x30,24
	add x30,x27,x30
	sw x23,0(x30)
L.774:
	li x30,512
	li x29,8
	add x29,x27,x29
	lw x29,0(x29)
	li x28,511
	and x29,x29,x28
	sub x24,x30,x29
	bleu x24,x26,L.806
	addi x24,x26,0
L.806:
	lw x12,0(x27)
	li x30,24
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,move_window
	beq x10,x0,L.808
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.761
L.808:
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,511
	and x30,x30,x29
	lw x29,0(x27)
	li x28,48
	add x29,x29,x28
	add x12,x30,x29
	addi x13,x22,0
	addi x14,x24,0
	jal x1,mem_cpy
	lw x30,0(x27)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
L.771:
	add x22,x24,x22
	li x30,8
	add x30,x27,x30
	lw x29,0(x30)
	add x29,x29,x24
	sw x29,0(x30)
	lw x30,0(x25)
	add x30,x30,x24
	sw x30,0(x25)
	sub x26,x26,x24
L.773:
	bne x26,x0,L.770
L.772:
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	bleu x30,x29,L.810
	li x30,12
	add x30,x27,x30
	li x29,8
	add x29,x27,x29
	lw x29,0(x29)
	sw x29,0(x30)
L.810:
	li x30,6
	add x30,x27,x30
	lbu x29,0(x30)
	ori x29,x29,32
	sb x29,0(x30)
	addi x10,x0,0
L.761:
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
	lw  x8,92(x2)
	addi  x2,x2,96
	jalr x0,x1,0

	.globl f_sync
	.align	4
f_sync:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	addi x12,x27,0
	jal x1,validate
	addi x26,x10,0
	bne x26,x0,L.813
	li x30,6
	add x30,x27,x30
	lbu x30,0(x30)
	andi x30,x30,32
	beq x30,x0,L.815
	lw x12,0(x27)
	li x30,28
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,move_window
	addi x26,x10,0
	bne x26,x0,L.817
	li x30,32
	add x29,x27,x30
	lw x29,0(x29)
	sw x29,-8+16(x8)
	lw x29,-8+16(x8)
	li x28,11
	add x29,x29,x28
	lbu x28,0(x29)
	or x30,x28,x30
	sb x30,0(x29)
	lw x30,-8+16(x8)
	li x29,28
	add x30,x30,x29
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	sb x29,0(x30)
	lw x30,-8+16(x8)
	li x29,29
	add x30,x30,x29
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	lw x30,-8+16(x8)
	li x29,30
	add x30,x30,x29
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	li x28,16
	srl x29,x29,x28
	sb x29,0(x30)
	lw x30,-8+16(x8)
	li x29,31
	add x30,x30,x29
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	li x28,24
	srl x29,x29,x28
	sb x29,0(x30)
	lw x12,-8+16(x8)
	li x30,16
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,st_clust
	jal x1,get_fattime
	sw x10,-12+16(x8)
	lw x30,-8+16(x8)
	li x29,22
	add x30,x30,x29
	lw x29,-12+16(x8)
	sb x29,0(x30)
	lw x30,-8+16(x8)
	li x29,23
	add x30,x30,x29
	lw x29,-12+16(x8)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	lw x30,-8+16(x8)
	li x29,24
	add x30,x30,x29
	lw x29,-12+16(x8)
	li x28,16
	srl x29,x29,x28
	sb x29,0(x30)
	lw x30,-8+16(x8)
	li x29,25
	add x30,x30,x29
	lw x29,-12+16(x8)
	li x28,24
	srl x29,x29,x28
	sb x29,0(x30)
	lw x30,-8+16(x8)
	li x29,18
	add x30,x30,x29
	sb x0,0(x30)
	lw x30,-8+16(x8)
	li x29,19
	add x30,x30,x29
	sb x0,0(x30)
	li x30,6
	add x30,x27,x30
	lbu x29,0(x30)
	andi x29,x29,-33
	sb x29,0(x30)
	lw x30,0(x27)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	lw x12,0(x27)
	jal x1,sync_fs
	addi x26,x10,0
L.817:
L.815:
L.813:
	addi x10,x26,0
L.812:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl f_close
	.align	4
f_close:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	lw x12,0+16(x8)
	jal x1,f_sync
	addi x27,x10,0
	bne x27,x0,L.820
	lw x12,0+16(x8)
	jal x1,validate
	addi x27,x10,0
	bne x27,x0,L.822
	lw x30,0+16(x8)
	sw x0,0(x30)
L.822:
L.820:
	addi x10,x27,0
L.819:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl f_lseek
	.align	4
f_lseek:
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
	mv x26,x13
	addi x12,x27,0
	jal x1,validate
	addi x25,x10,0
	beq x25,x0,L.825
	addi x10,x25,0
	jal x0,L.824
L.825:
	li x30,7
	add x30,x27,x30
	lbu x30,0(x30)
	beq x30,x0,L.827
	li x30,7
	add x30,x27,x30
	lbu x10,0(x30)
	jal x0,L.824
L.827:
	li x30,12
	add x30,x27,x30
	lw x30,0(x30)
	bleu x26,x30,L.829
	li x30,6
	add x30,x27,x30
	lbu x30,0(x30)
	andi x30,x30,2
	bne x30,x0,L.829
	li x30,12
	add x30,x27,x30
	lw x26,0(x30)
L.829:
	li x30,8
	add x30,x27,x30
	lw x29,0(x30)
	sw x29,-12+16(x8)
	sw x0,-8+16(x8)
	sw x0,0(x30)
	beq x26,x0,L.831
	lw x30,0(x27)
	li x29,2
	add x30,x30,x29
	lbu x30,0(x30)
	li x29,9
	sll x23,x30,x29
	lw x30,-12+16(x8)
	beq x30,x0,L.833
	li x29,1
	sub x28,x26,x29
	divu x28,x28,x23
	sub x30,x30,x29
	divu x30,x30,x23
	bltu x28,x30,L.833
	li x30,1
	li x29,8
	add x29,x27,x29
	lw x28,-12+16(x8)
	sub x28,x28,x30
	sub x30,x23,x30
	xori x30,x30,-1
	and x30,x28,x30
	sw x30,0(x29)
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	sub x26,x26,x30
	li x30,20
	add x30,x27,x30
	lw x24,0(x30)
	jal x0,L.834
L.833:
	li x30,16
	add x30,x27,x30
	lw x24,0(x30)
	bne x24,x0,L.835
	lw x12,0(x27)
	addi x13,x0,0
	jal x1,create_chain
	addi x24,x10,0
	li x30,1
	bne x24,x30,L.837
	li x30,7
	add x30,x27,x30
	li x29,2
	sb x29,0(x30)
	li x10,2
	jal x0,L.824
L.837:
	li x30,0xffffffff
	bne x24,x30,L.839
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.824
L.839:
	li x30,16
	add x30,x27,x30
	sw x24,0(x30)
L.835:
	li x30,20
	add x30,x27,x30
	sw x24,0(x30)
L.834:
	beq x24,x0,L.841
	jal x0,L.844
L.843:
	li x30,6
	add x30,x27,x30
	lbu x30,0(x30)
	andi x30,x30,2
	beq x30,x0,L.846
	lw x12,0(x27)
	addi x13,x24,0
	jal x1,create_chain
	addi x24,x10,0
	bne x24,x0,L.847
	addi x26,x23,0
	jal x0,L.845
L.846:
	lw x12,0(x27)
	addi x13,x24,0
	jal x1,get_fat
	addi x24,x10,0
L.847:
	li x30,0xffffffff
	bne x24,x30,L.850
	li x30,7
	add x30,x27,x30
	li x29,1
	sb x29,0(x30)
	li x10,1
	jal x0,L.824
L.850:
	li x30,1
	bleu x24,x30,L.854
	lw x30,0(x27)
	li x29,20
	add x30,x30,x29
	lw x30,0(x30)
	bltu x24,x30,L.852
L.854:
	li x30,7
	add x30,x27,x30
	li x29,2
	sb x29,0(x30)
	li x10,2
	jal x0,L.824
L.852:
	li x30,20
	add x30,x27,x30
	sw x24,0(x30)
	li x30,8
	add x30,x27,x30
	lw x29,0(x30)
	add x29,x29,x23
	sw x29,0(x30)
	sub x26,x26,x23
L.844:
	bgtu x26,x23,L.843
L.845:
	li x30,8
	add x30,x27,x30
	lw x29,0(x30)
	add x29,x29,x26
	sw x29,0(x30)
	li x30,511
	and x30,x26,x30
	beq x30,x0,L.855
	lw x12,0(x27)
	addi x13,x24,0
	jal x1,clust2sect
	sw x10,-8+16(x8)
	lw x30,-8+16(x8)
	bne x30,x0,L.857
	li x30,7
	add x30,x27,x30
	li x29,2
	sb x29,0(x30)
	li x10,2
	jal x0,L.824
L.857:
	lw x30,-8+16(x8)
	li x29,9
	srl x29,x26,x29
	add x30,x30,x29
	sw x30,-8+16(x8)
L.855:
L.841:
L.831:
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,511
	and x30,x30,x29
	beq x30,x0,L.859
	lw x30,-8+16(x8)
	li x29,24
	add x29,x27,x29
	lw x29,0(x29)
	beq x30,x29,L.859
	li x30,24
	add x30,x27,x30
	lw x29,-8+16(x8)
	sw x29,0(x30)
L.859:
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	li x29,12
	add x29,x27,x29
	lw x29,0(x29)
	bleu x30,x29,L.861
	li x30,12
	add x30,x27,x30
	li x29,8
	add x29,x27,x29
	lw x29,0(x29)
	sw x29,0(x30)
	li x30,6
	add x30,x27,x30
	lbu x29,0(x30)
	ori x29,x29,32
	sb x29,0(x30)
L.861:
	addi x10,x25,0
L.824:
	lw x1,24(x2)
	lw x23,28(x2)
	lw x24,32(x2)
	lw x25,36(x2)
	lw x26,40(x2)
	lw x27,44(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.globl f_opendir
	.align	4
f_opendir:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	sw x13,36(x8)
	addi x30,x27,0
	bne x30,x0,L.864
	li x10,9
	jal x0,L.863
L.864:
	addi x12,x8,-8+32
	addi x13,x8,4+32
	addi x14,x0,0
	jal x1,find_volume
	addi x26,x10,0
	bne x26,x0,L.866
	lw x30,-8+32(x8)
	sw x30,0(x27)
	li x30,24
	add x30,x27,x30
	addi x29,x8,-20+32
	sw x29,0(x30)
	li x30,28
	add x30,x27,x30
	la x29,LfnBuf
	sw x29,0(x30)
	addi x12,x27,0
	lw x13,4+32(x8)
	jal x1,follow_path
	addi x26,x10,0
	bne x26,x0,L.868
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	beq x30,x0,L.870
	li x30,20
	add x30,x27,x30
	lw x30,0(x30)
	li x29,11
	add x30,x30,x29
	lbu x30,0(x30)
	andi x30,x30,16
	beq x30,x0,L.872
	lw x12,-8+32(x8)
	li x30,20
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,ld_clust
	li x29,8
	add x29,x27,x29
	sw x10,0(x29)
	jal x0,L.873
L.872:
	li x26,5
L.873:
L.870:
	bne x26,x0,L.874
	li x30,4
	add x30,x27,x30
	lw x29,-8+32(x8)
	li x28,6
	add x29,x29,x28
	lhu x29,0(x29)
	sh x29,0(x30)
	addi x12,x27,0
	addi x13,x0,0
	jal x1,dir_sdi
	addi x26,x10,0
L.874:
L.868:
	li x30,4
	bne x26,x30,L.876
	li x26,5
L.876:
L.866:
	beq x26,x0,L.878
	sw x0,0(x27)
L.878:
	addi x10,x26,0
L.863:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.globl f_closedir
	.align	4
f_closedir:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	lw x12,0+16(x8)
	jal x1,validate
	addi x27,x10,0
	bne x27,x0,L.881
	lw x30,0+16(x8)
	sw x0,0(x30)
L.881:
	addi x10,x27,0
L.880:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl f_readdir
	.align	4
f_readdir:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x12,0+16(x8)
	jal x1,validate
	addi x27,x10,0
	bne x27,x0,L.884
	lw x30,4+16(x8)
	bne x30,x0,L.886
	lw x12,0+16(x8)
	addi x13,x0,0
	jal x1,dir_sdi
	addi x27,x10,0
	jal x0,L.887
L.886:
	lw x30,0+16(x8)
	li x29,24
	add x30,x30,x29
	addi x29,x8,-16+16
	sw x29,0(x30)
	lw x30,0+16(x8)
	li x29,28
	add x30,x30,x29
	la x29,LfnBuf
	sw x29,0(x30)
	lw x12,0+16(x8)
	addi x13,x0,0
	jal x1,dir_read
	addi x27,x10,0
	li x30,4
	bne x27,x30,L.888
	lw x30,0+16(x8)
	li x29,16
	add x30,x30,x29
	sw x0,0(x30)
	addi x27,x0,0
L.888:
	bne x27,x0,L.890
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	jal x1,get_fileinfo
	lw x12,0+16(x8)
	addi x13,x0,0
	jal x1,dir_next
	addi x27,x10,0
	li x30,4
	bne x27,x30,L.892
	lw x30,0+16(x8)
	li x29,16
	add x30,x30,x29
	sw x0,0(x30)
	addi x27,x0,0
L.892:
L.890:
L.887:
L.884:
	addi x10,x27,0
L.883:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl f_stat
	.align	4
f_stat:
	addi x2,x2,-112
	sw  x8,108(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,64(x8)
	sw x13,68(x8)
	addi x12,x8,-40+64
	addi x13,x8,0+64
	addi x14,x0,0
	jal x1,find_volume
	addi x27,x10,0
	bne x27,x0,L.895
	addi x30,x8,-52+64
	sw x30,-16+64(x8)
	la x30,LfnBuf
	sw x30,-12+64(x8)
	addi x12,x8,-40+64
	lw x13,0+64(x8)
	jal x1,follow_path
	addi x27,x10,0
	bne x27,x0,L.899
	lw x30,-20+64(x8)
	beq x30,x0,L.901
	lw x30,4+64(x8)
	beq x30,x0,L.902
	addi x12,x8,-40+64
	lw x13,4+64(x8)
	jal x1,get_fileinfo
	jal x0,L.902
L.901:
	li x27,6
L.902:
L.899:
L.895:
	addi x10,x27,0
L.894:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,108(x2)
	addi  x2,x2,112
	jalr x0,x1,0

	.globl f_getfree
	.align	4
f_getfree:
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
	sw x13,20(x8)
	sw x14,24(x8)
	lw x12,8+16(x8)
	addi x13,x8,0+16
	addi x14,x0,0
	jal x1,find_volume
	addi x25,x10,0
	lw x30,8+16(x8)
	lw x27,0(x30)
	bne x25,x0,L.907
	li x30,16
	add x30,x27,x30
	lw x30,0(x30)
	li x29,20
	add x29,x27,x29
	lw x29,0(x29)
	li x28,2
	sub x29,x29,x28
	bgtu x30,x29,L.909
	lw x30,4+16(x8)
	li x29,16
	add x29,x27,x29
	lw x29,0(x29)
	sw x29,0(x30)
	jal x0,L.910
L.909:
	lbu x30,0(x27)
	sb x30,-9+16(x8)
	sw x0,-8+16(x8)
	lbu x30,-9+16(x8)
	li x29,1
	bne x30,x29,L.911
	li x23,2
L.913:
	addi x12,x27,0
	addi x13,x23,0
	jal x1,get_fat
	addi x24,x10,0
	li x30,0xffffffff
	bne x24,x30,L.916
	li x25,1
	jal x0,L.912
L.916:
	li x30,1
	bne x24,x30,L.918
	li x25,2
	jal x0,L.912
L.918:
	bne x24,x0,L.920
	lw x30,-8+16(x8)
	li x29,1
	add x30,x30,x29
	sw x30,-8+16(x8)
L.920:
L.914:
	li x30,1
	add x30,x23,x30
	addi x23,x30,0
	li x29,20
	add x29,x27,x29
	lw x29,0(x29)
	bltu x30,x29,L.913
	jal x0,L.912
L.911:
	li x30,20
	add x30,x27,x30
	lw x23,0(x30)
	li x30,32
	add x30,x27,x30
	lw x30,0(x30)
	sw x30,-16+16(x8)
	addi x22,x0,0
	addi x26,x0,0
L.922:
	bne x22,x0,L.925
	addi x12,x27,0
	lw x30,-16+16(x8)
	li x29,1
	add x29,x30,x29
	sw x29,-16+16(x8)
	addi x13,x30,0
	jal x1,move_window
	addi x25,x10,0
	beq x25,x0,L.927
	jal x0,L.924
L.927:
	li x30,48
	add x26,x27,x30
	li x22,512
L.925:
	lbu x30,-9+16(x8)
	li x29,2
	bne x30,x29,L.929
	li x30,1
	add x30,x26,x30
	lbu x30,0(x30)
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x29,8
	sll x30,x30,x29
	lbu x29,0(x26)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	or x30,x30,x29
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	bne x30,x0,L.931
	lw x30,-8+16(x8)
	li x29,1
	add x30,x30,x29
	sw x30,-8+16(x8)
L.931:
	li x30,2
	add x26,x26,x30
	li x30,2
	sub x22,x22,x30
	jal x0,L.930
L.929:
	li x30,3
	add x30,x26,x30
	lbu x30,0(x30)
	li x29,24
	sll x30,x30,x29
	li x29,2
	add x29,x26,x29
	lbu x29,0(x29)
	li x28,16
	sll x29,x29,x28
	or x30,x30,x29
	li x29,1
	add x29,x26,x29
	lbu x29,0(x29)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	or x30,x30,x29
	lbu x29,0(x26)
	or x30,x30,x29
	li x29,0xfffffff
	and x30,x30,x29
	bne x30,x0,L.933
	lw x30,-8+16(x8)
	li x29,1
	add x30,x30,x29
	sw x30,-8+16(x8)
L.933:
	li x30,4
	add x26,x26,x30
	li x30,4
	sub x22,x22,x30
L.930:
L.923:
	li x30,1
	sub x30,x23,x30
	addi x23,x30,0
	bne x30,x0,L.922
L.924:
L.912:
	li x30,16
	add x30,x27,x30
	lw x29,-8+16(x8)
	sw x29,0(x30)
	li x30,5
	add x30,x27,x30
	lbu x29,0(x30)
	ori x29,x29,1
	sb x29,0(x30)
	lw x30,4+16(x8)
	lw x29,-8+16(x8)
	sw x29,0(x30)
L.910:
L.907:
	addi x10,x25,0
L.906:
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

	.globl f_truncate
	.align	4
f_truncate:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	mv x27,x12
	addi x12,x27,0
	jal x1,validate
	addi x26,x10,0
	bne x26,x0,L.936
	li x30,7
	add x30,x27,x30
	lbu x30,0(x30)
	beq x30,x0,L.938
	li x30,7
	add x30,x27,x30
	lbu x26,0(x30)
	jal x0,L.939
L.938:
	li x30,6
	add x30,x27,x30
	lbu x30,0(x30)
	andi x30,x30,2
	bne x30,x0,L.940
	li x26,7
L.940:
L.939:
L.936:
	bne x26,x0,L.942
	li x30,12
	add x30,x27,x30
	lw x30,0(x30)
	li x29,8
	add x29,x27,x29
	lw x29,0(x29)
	bleu x30,x29,L.944
	li x30,12
	add x30,x27,x30
	li x29,8
	add x29,x27,x29
	lw x29,0(x29)
	sw x29,0(x30)
	li x30,6
	add x30,x27,x30
	lbu x29,0(x30)
	ori x29,x29,32
	sb x29,0(x30)
	li x30,8
	add x30,x27,x30
	lw x30,0(x30)
	bne x30,x0,L.946
	lw x12,0(x27)
	li x30,16
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,remove_chain
	addi x26,x10,0
	li x30,16
	add x30,x27,x30
	sw x0,0(x30)
	jal x0,L.947
L.946:
	lw x12,0(x27)
	li x30,20
	add x30,x27,x30
	lw x13,0(x30)
	jal x1,get_fat
	sw x10,-8+16(x8)
	addi x26,x0,0
	lw x30,-8+16(x8)
	li x29,0xffffffff
	bne x30,x29,L.948
	li x26,1
L.948:
	lw x30,-8+16(x8)
	li x29,1
	bne x30,x29,L.950
	li x26,2
L.950:
	bne x26,x0,L.952
	lw x30,-8+16(x8)
	lw x29,0(x27)
	li x28,20
	add x29,x29,x28
	lw x29,0(x29)
	bgeu x30,x29,L.952
	lw x12,0(x27)
	li x30,20
	add x30,x27,x30
	lw x13,0(x30)
	li x14,0xfffffff
	jal x1,put_fat
	addi x26,x10,0
	bne x26,x0,L.954
	lw x12,0(x27)
	lw x13,-8+16(x8)
	jal x1,remove_chain
	addi x26,x10,0
L.954:
L.952:
L.947:
L.944:
	beq x26,x0,L.956
	li x30,7
	add x30,x27,x30
	addi x29,x26,0
	sb x29,0(x30)
L.956:
L.942:
	addi x10,x26,0
L.935:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl f_unlink
	.align	4
f_unlink:
	addi x2,x2,-144
	sw  x8,140(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,96(x8)
	addi x12,x8,-40+96
	addi x13,x8,0+96
	li x14,1
	jal x1,find_volume
	addi x27,x10,0
	bne x27,x0,L.959
	addi x30,x8,-60+96
	sw x30,-16+96(x8)
	la x30,LfnBuf
	sw x30,-12+96(x8)
	addi x12,x8,-40+96
	lw x13,0+96(x8)
	jal x1,follow_path
	addi x27,x10,0
	jal x0,L.963
	li x27,6
L.963:
	bne x27,x0,L.966
	lw x30,-20+96(x8)
	sw x30,-44+96(x8)
	lw x30,-44+96(x8)
	bne x30,x0,L.969
	li x27,6
	jal x0,L.970
L.969:
	lw x30,-44+96(x8)
	li x29,11
	add x30,x30,x29
	lbu x30,0(x30)
	andi x30,x30,1
	beq x30,x0,L.971
	li x27,7
L.971:
L.970:
	lw x12,-40+96(x8)
	lw x13,-44+96(x8)
	jal x1,ld_clust
	sw x10,-48+96(x8)
	bne x27,x0,L.973
	lw x29,-44+96(x8)
	li x28,11
	add x29,x29,x28
	lbu x29,0(x29)
	andi x29,x29,16
	beq x29,x0,L.973
	lw x30,-48+96(x8)
	li x29,2
	bgeu x30,x29,L.975
	li x27,2
	jal x0,L.976
L.975:
	addi x12,x8,-96+96
	addi x13,x8,-40+96
	li x14,36
	jal x1,mem_cpy
	lw x30,-48+96(x8)
	sw x30,-88+96(x8)
	addi x12,x8,-96+96
	li x13,2
	jal x1,dir_sdi
	addi x27,x10,0
	bne x27,x0,L.978
	addi x12,x8,-96+96
	addi x13,x0,0
	jal x1,dir_read
	addi x27,x10,0
	bne x27,x0,L.980
	li x27,7
L.980:
	li x30,4
	bne x27,x30,L.982
	addi x27,x0,0
L.982:
L.978:
L.976:
L.973:
	bne x27,x0,L.984
	addi x12,x8,-40+96
	jal x1,dir_remove
	addi x27,x10,0
	bne x27,x0,L.986
	lw x30,-48+96(x8)
	beq x30,x0,L.988
	lw x12,-40+96(x8)
	lw x13,-48+96(x8)
	jal x1,remove_chain
	addi x27,x10,0
L.988:
	bne x27,x0,L.990
	lw x12,-40+96(x8)
	jal x1,sync_fs
	addi x27,x10,0
L.990:
L.986:
L.984:
L.966:
L.959:
	addi x10,x27,0
L.958:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,140(x2)
	addi  x2,x2,144
	jalr x0,x1,0

	.globl f_mkdir
	.align	4
f_mkdir:
	addi x2,x2,-128
	sw  x8,124(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	sw x12,80(x8)
	jal x1,get_fattime
	sw x10,-48+80(x8)
	addi x12,x8,-40+80
	addi x13,x8,0+80
	li x14,1
	jal x1,find_volume
	addi x27,x10,0
	bne x27,x0,L.993
	addi x30,x8,-68+80
	sw x30,-16+80(x8)
	la x30,LfnBuf
	sw x30,-12+80(x8)
	addi x12,x8,-40+80
	lw x13,0+80(x8)
	jal x1,follow_path
	addi x27,x10,0
	bne x27,x0,L.997
	li x27,8
L.997:
	jal x0,L.999
	li x27,6
L.999:
	li x30,4
	bne x27,x30,L.1002
	lw x12,-40+80(x8)
	addi x13,x0,0
	jal x1,create_chain
	sw x10,-52+80(x8)
	addi x27,x0,0
	lw x30,-52+80(x8)
	bne x30,x0,L.1004
	li x27,7
L.1004:
	lw x30,-52+80(x8)
	li x29,1
	bne x30,x29,L.1006
	li x27,2
L.1006:
	lw x30,-52+80(x8)
	li x29,0xffffffff
	bne x30,x29,L.1008
	li x27,1
L.1008:
	bne x27,x0,L.1010
	lw x12,-40+80(x8)
	jal x1,sync_window
	addi x27,x10,0
L.1010:
	bne x27,x0,L.1012
	lw x12,-40+80(x8)
	lw x13,-52+80(x8)
	jal x1,clust2sect
	sw x10,-56+80(x8)
	lw x30,-40+80(x8)
	li x29,48
	add x26,x30,x29
	addi x12,x26,0
	addi x13,x0,0
	li x14,512
	jal x1,mem_set
	addi x12,x26,0
	li x13,32
	li x14,11
	jal x1,mem_set
	li x30,46
	sb x30,0(x26)
	li x30,11
	add x30,x26,x30
	li x29,16
	sb x29,0(x30)
	li x30,22
	add x30,x26,x30
	lw x29,-48+80(x8)
	sb x29,0(x30)
	li x30,23
	add x30,x26,x30
	lw x29,-48+80(x8)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	li x30,24
	add x30,x26,x30
	lw x29,-48+80(x8)
	li x28,16
	srl x29,x29,x28
	sb x29,0(x30)
	li x30,25
	add x30,x26,x30
	lw x29,-48+80(x8)
	li x28,24
	srl x29,x29,x28
	sb x29,0(x30)
	addi x12,x26,0
	lw x13,-52+80(x8)
	jal x1,st_clust
	li x30,32
	add x12,x26,x30
	addi x13,x26,0
	li x14,32
	jal x1,mem_cpy
	li x30,33
	add x30,x26,x30
	li x29,46
	sb x29,0(x30)
	lw x30,-32+80(x8)
	sw x30,-72+80(x8)
	lw x30,-40+80(x8)
	lbu x29,0(x30)
	li x28,3
	bne x29,x28,L.1015
	lw x29,-72+80(x8)
	li x28,36
	add x30,x30,x28
	lw x30,0(x30)
	bne x29,x30,L.1015
	sw x0,-72+80(x8)
L.1015:
	li x30,32
	add x12,x26,x30
	lw x13,-72+80(x8)
	jal x1,st_clust
	lw x30,-40+80(x8)
	li x29,2
	add x30,x30,x29
	lbu x30,0(x30)
	sb x30,-41+80(x8)
	jal x0,L.1020
L.1017:
	lw x30,-56+80(x8)
	li x29,1
	add x29,x30,x29
	sw x29,-56+80(x8)
	lw x29,-40+80(x8)
	li x28,44
	add x29,x29,x28
	sw x30,0(x29)
	lw x30,-40+80(x8)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	lw x12,-40+80(x8)
	jal x1,sync_window
	addi x27,x10,0
	beq x27,x0,L.1021
	jal x0,L.1019
L.1021:
	addi x12,x26,0
	addi x13,x0,0
	li x14,512
	jal x1,mem_set
L.1018:
	lbu x30,-41+80(x8)
	addi x30,x30,-1
	sb x30,-41+80(x8)
L.1020:
	lbu x30,-41+80(x8)
	bne x30,x0,L.1017
L.1019:
L.1012:
	bne x27,x0,L.1023
	addi x12,x8,-40+80
	jal x1,dir_register
	addi x27,x10,0
L.1023:
	beq x27,x0,L.1025
	lw x12,-40+80(x8)
	lw x13,-52+80(x8)
	jal x1,remove_chain
	jal x0,L.1026
L.1025:
	lw x26,-20+80(x8)
	li x30,11
	add x30,x26,x30
	li x29,16
	sb x29,0(x30)
	li x30,22
	add x30,x26,x30
	lw x29,-48+80(x8)
	sb x29,0(x30)
	li x30,23
	add x30,x26,x30
	lw x29,-48+80(x8)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	li x30,24
	add x30,x26,x30
	lw x29,-48+80(x8)
	li x28,16
	srl x29,x29,x28
	sb x29,0(x30)
	li x30,25
	add x30,x26,x30
	lw x29,-48+80(x8)
	li x28,24
	srl x29,x29,x28
	sb x29,0(x30)
	addi x12,x26,0
	lw x13,-52+80(x8)
	jal x1,st_clust
	lw x30,-40+80(x8)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	lw x12,-40+80(x8)
	jal x1,sync_fs
	addi x27,x10,0
L.1026:
L.1002:
L.993:
	addi x10,x27,0
L.992:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,124(x2)
	addi  x2,x2,128
	jalr x0,x1,0

	.globl f_chmod
	.align	4
f_chmod:
	addi x2,x2,-112
	sw  x8,108(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,64(x8)
	sw x13,68(x8)
	sw x14,72(x8)
	lw x30,4+64(x8)
	sb x30,4+64(x8)
	lw x30,8+64(x8)
	sb x30,8+64(x8)
	addi x12,x8,-40+64
	addi x13,x8,0+64
	li x14,1
	jal x1,find_volume
	addi x27,x10,0
	bne x27,x0,L.1029
	addi x30,x8,-56+64
	sw x30,-16+64(x8)
	la x30,LfnBuf
	sw x30,-12+64(x8)
	addi x12,x8,-40+64
	lw x13,0+64(x8)
	jal x1,follow_path
	addi x27,x10,0
	jal x0,L.1033
	li x27,6
L.1033:
	bne x27,x0,L.1036
	lw x30,-20+64(x8)
	sw x30,-44+64(x8)
	lw x30,-44+64(x8)
	bne x30,x0,L.1039
	li x27,6
	jal x0,L.1040
L.1039:
	lbu x30,8+64(x8)
	andi x30,x30,39
	sb x30,8+64(x8)
	lw x30,-44+64(x8)
	li x29,11
	add x30,x30,x29
	lbu x29,8+64(x8)
	lbu x28,4+64(x8)
	and x28,x28,x29
	lbu x7,0(x30)
	xori x29,x29,-1
	slli x29,x29,8*(4-1)
	srli x29,x29,8*(4-1)
	and x29,x7,x29
	or x29,x28,x29
	sb x29,0(x30)
	lw x30,-40+64(x8)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	lw x12,-40+64(x8)
	jal x1,sync_fs
	addi x27,x10,0
L.1040:
L.1036:
L.1029:
	addi x10,x27,0
L.1028:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,108(x2)
	addi  x2,x2,112
	jalr x0,x1,0

	.globl f_utime
	.align	4
f_utime:
	addi x2,x2,-112
	sw  x8,108(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,64(x8)
	sw x13,68(x8)
	addi x12,x8,-40+64
	addi x13,x8,0+64
	li x14,1
	jal x1,find_volume
	addi x27,x10,0
	bne x27,x0,L.1042
	addi x30,x8,-56+64
	sw x30,-16+64(x8)
	la x30,LfnBuf
	sw x30,-12+64(x8)
	addi x12,x8,-40+64
	lw x13,0+64(x8)
	jal x1,follow_path
	addi x27,x10,0
	jal x0,L.1046
	li x27,6
L.1046:
	bne x27,x0,L.1049
	lw x30,-20+64(x8)
	sw x30,-44+64(x8)
	lw x30,-44+64(x8)
	bne x30,x0,L.1052
	li x27,6
	jal x0,L.1053
L.1052:
	lw x30,-44+64(x8)
	li x29,22
	add x30,x30,x29
	lw x29,4+64(x8)
	li x28,6
	add x29,x29,x28
	lhu x29,0(x29)
	sb x29,0(x30)
	lw x30,-44+64(x8)
	li x29,23
	add x30,x30,x29
	lw x29,4+64(x8)
	li x28,6
	add x29,x29,x28
	lhu x29,0(x29)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	lw x30,-44+64(x8)
	li x29,24
	add x30,x30,x29
	lw x29,4+64(x8)
	li x28,4
	add x29,x29,x28
	lhu x29,0(x29)
	sb x29,0(x30)
	lw x30,-44+64(x8)
	li x29,25
	add x30,x30,x29
	lw x29,4+64(x8)
	li x28,4
	add x29,x29,x28
	lhu x29,0(x29)
	li x28,8
	sra x29,x29,x28
	sb x29,0(x30)
	lw x30,-40+64(x8)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	lw x12,-40+64(x8)
	jal x1,sync_fs
	addi x27,x10,0
L.1053:
L.1049:
L.1042:
	addi x10,x27,0
L.1041:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,108(x2)
	addi  x2,x2,112
	jalr x0,x1,0

	.globl f_rename
	.align	4
f_rename:
	addi x2,x2,-176
	sw  x8,172(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	sw x12,128(x8)
	sw x13,132(x8)
	addi x12,x8,-40+128
	addi x13,x8,0+128
	li x14,1
	jal x1,find_volume
	addi x27,x10,0
	bne x27,x0,L.1055
	lw x30,-40+128(x8)
	sw x30,-76+128(x8)
	addi x30,x8,-88+128
	sw x30,-16+128(x8)
	la x30,LfnBuf
	sw x30,-12+128(x8)
	addi x12,x8,-40+128
	lw x13,0+128(x8)
	jal x1,follow_path
	addi x27,x10,0
	jal x0,L.1059
	li x27,6
L.1059:
	bne x27,x0,L.1062
	lw x30,-20+128(x8)
	bne x30,x0,L.1064
	li x27,4
	jal x0,L.1065
L.1064:
	addi x12,x8,-109+128
	lw x30,-20+128(x8)
	li x29,11
	add x13,x30,x29
	li x14,21
	jal x1,mem_cpy
	addi x12,x8,-76+128
	addi x13,x8,-40+128
	li x14,36
	jal x1,mem_cpy
	addi x12,x8,4+128
	jal x1,get_ldnumber
	blt x10,x0,L.1068
	addi x12,x8,-76+128
	lw x13,4+128(x8)
	jal x1,follow_path
	addi x27,x10,0
	jal x0,L.1069
L.1068:
	li x27,11
L.1069:
	bne x27,x0,L.1070
	li x27,8
L.1070:
	li x30,4
	bne x27,x30,L.1072
	addi x12,x8,-76+128
	jal x1,dir_register
	addi x27,x10,0
	bne x27,x0,L.1074
	lw x30,-56+128(x8)
	sw x30,-116+128(x8)
	lw x30,-116+128(x8)
	li x29,13
	add x12,x30,x29
	addi x13,x8,-107+128
	li x14,19
	jal x1,mem_cpy
	lw x30,-116+128(x8)
	li x29,11
	add x30,x30,x29
	lbu x29,-109+128(x8)
	ori x29,x29,32
	sb x29,0(x30)
	lw x30,-40+128(x8)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
	lw x30,-32+128(x8)
	lw x29,-68+128(x8)
	beq x30,x29,L.1078
	lw x30,-116+128(x8)
	li x29,11
	add x30,x30,x29
	lbu x30,0(x30)
	andi x30,x30,16
	beq x30,x0,L.1078
	lw x12,-40+128(x8)
	lw x13,-116+128(x8)
	jal x1,ld_clust
	addi x30,x10,0
	lw x12,-40+128(x8)
	addi x13,x30,0
	jal x1,clust2sect
	sw x10,-120+128(x8)
	lw x30,-120+128(x8)
	bne x30,x0,L.1082
	li x27,2
	jal x0,L.1083
L.1082:
	lw x12,-40+128(x8)
	lw x13,-120+128(x8)
	jal x1,move_window
	addi x27,x10,0
	lw x30,-40+128(x8)
	li x29,80
	add x30,x30,x29
	sw x30,-116+128(x8)
	bne x27,x0,L.1084
	lw x30,-116+128(x8)
	li x29,1
	add x30,x30,x29
	lbu x30,0(x30)
	li x29,46
	bne x30,x29,L.1084
	lw x30,-40+128(x8)
	lbu x29,0(x30)
	li x28,3
	bne x29,x28,L.1089
	lw x29,-68+128(x8)
	li x28,36
	add x30,x30,x28
	lw x30,0(x30)
	bne x29,x30,L.1089
	addi x26,x0,0
	jal x0,L.1090
L.1089:
	lw x26,-68+128(x8)
L.1090:
	sw x26,-120+128(x8)
	lw x12,-116+128(x8)
	lw x13,-120+128(x8)
	jal x1,st_clust
	lw x30,-40+128(x8)
	li x29,4
	add x30,x30,x29
	li x29,1
	sb x29,0(x30)
L.1084:
L.1083:
L.1078:
	bne x27,x0,L.1091
	addi x12,x8,-40+128
	jal x1,dir_remove
	addi x27,x10,0
	bne x27,x0,L.1093
	lw x12,-40+128(x8)
	jal x1,sync_fs
	addi x27,x10,0
L.1093:
L.1091:
L.1074:
L.1072:
L.1065:
L.1062:
L.1055:
	addi x10,x27,0
L.1054:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,172(x2)
	addi  x2,x2,176
	jalr x0,x1,0

	.globl f_gets
	.align	4
f_gets:
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
	mv x26,x14
	addi x24,x0,0
	lw x23,0+16(x8)
	jal x0,L.1097
L.1096:
	addi x12,x26,0
	addi x13,x8,-6+16
	li x14,1
	addi x15,x8,-12+16
	jal x1,f_read
	lw x30,-12+16(x8)
	li x29,1
	beq x30,x29,L.1099
	jal x0,L.1098
L.1099:
	lbu x30,-6+16(x8)
	addi x25,x30,0
	jal x0,L.1101
	jal x0,L.1097
L.1101:
	addi x30,x23,0
	li x29,1
	add x23,x30,x29
	sb x25,0(x30)
	addi x24,x24,1
	slli x30,x25,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,10
	bne x30,x29,L.1103
	jal x0,L.1098
L.1103:
L.1097:
	addi x30,x27,-1
	blt x24,x30,L.1096
L.1098:
	sb x0,0(x23)
	beq x24,x0,L.1106
	lw x22,0+16(x8)
	jal x0,L.1107
L.1106:
	addi x22,x0,0
L.1107:
	addi x10,x22,0
L.1095:
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
putc_bfd:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	sw x13,20(x8)
	lw x30,4+16(x8)
	sb x30,4+16(x8)
	jal x0,L.1110
	addi x12,x27,0
	li x13,13
	jal x1,putc_bfd
L.1110:
	li x30,4
	add x30,x27,x30
	lw x26,0(x30)
	bge x26,x0,L.1112
	jal x0,L.1109
L.1112:
	addi x30,x26,0
	addi x26,x30,1
	li x29,12
	add x29,x27,x29
	add x30,x30,x29
	lb x29,4+16(x8)
	sb x29,0(x30)
	li x30,61
	blt x26,x30,L.1114
	lw x12,0(x27)
	li x30,12
	add x13,x27,x30
	addi x14,x26,0
	addi x15,x8,-8+16
	jal x1,f_write
	lw x30,-8+16(x8)
	addi x29,x26,0
	bne x30,x29,L.1117
	addi x25,x0,0
	jal x0,L.1118
L.1117:
	li x25,-1
L.1118:
	addi x26,x25,0
L.1114:
	li x30,4
	add x30,x27,x30
	sw x26,0(x30)
	li x30,8
	add x30,x27,x30
	lw x29,0(x30)
	addi x29,x29,1
	sw x29,0(x30)
L.1109:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl f_putc
	.align	4
f_putc:
	addi x2,x2,-128
	sw  x8,124(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,96(x8)
	sw x13,100(x8)
	lw x30,0+96(x8)
	sb x30,0+96(x8)
	lw x30,4+96(x8)
	sw x30,-80+96(x8)
	sw x0,-76+96(x8)
	sw x0,-72+96(x8)
	addi x12,x8,-80+96
	lb x13,0+96(x8)
	jal x1,putc_bfd
	lw x30,-76+96(x8)
	blt x30,x0,L.1122
	lw x12,-80+96(x8)
	addi x13,x8,-68+96
	lw x30,-76+96(x8)
	addi x14,x30,0
	addi x15,x8,-84+96
	jal x1,f_write
	bne x10,x0,L.1122
	lw x30,-76+96(x8)
	lw x29,-84+96(x8)
	bne x30,x29,L.1122
	lw x10,-72+96(x8)
	jal x0,L.1119
L.1122:
	li x10,-1
L.1119:
	lw x1,24(x2)
	lw  x8,124(x2)
	addi  x2,x2,128
	jalr x0,x1,0

	.globl f_puts
	.align	4
f_puts:
	addi x2,x2,-144
	sw  x8,140(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	mv x27,x12
	sw x13,100(x8)
	lw x30,4+96(x8)
	sw x30,-80+96(x8)
	sw x0,-76+96(x8)
	sw x0,-72+96(x8)
	jal x0,L.1133
L.1132:
	addi x12,x8,-80+96
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lb x13,0(x30)
	jal x1,putc_bfd
L.1133:
	lb x30,0(x27)
	bne x30,x0,L.1132
	lw x30,-76+96(x8)
	blt x30,x0,L.1135
	lw x12,-80+96(x8)
	addi x13,x8,-68+96
	lw x30,-76+96(x8)
	addi x14,x30,0
	addi x15,x8,-84+96
	jal x1,f_write
	bne x10,x0,L.1135
	lw x30,-76+96(x8)
	lw x29,-84+96(x8)
	bne x30,x29,L.1135
	lw x10,-72+96(x8)
	jal x0,L.1129
L.1135:
	li x10,-1
L.1129:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,140(x2)
	addi  x2,x2,144
	jalr x0,x1,0

	.globl f_printf
	.align	4
f_printf:
	addi x2,x2,-208
	sw  x8,204(x2)
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
	sw x12,128(x8)
	sw x13,132(x8)
	sw x14,136(x8)
	sw x15,140(x8)
	sw x16,144(x8)
	sw x17,148(x8)
	lw x30,0+128(x8)
	sw x30,-96+128(x8)
	sw x0,-92+128(x8)
	sw x0,-88+128(x8)
	addi x20,x8,8+128
L.1147:
	lw x30,4+128(x8)
	li x29,1
	add x29,x30,x29
	sw x29,4+128(x8)
	lb x26,0(x30)
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	bne x30,x0,L.1151
	jal x0,L.1149
L.1151:
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,37
	beq x30,x29,L.1153
	addi x12,x8,-96+128
	slli x13,x26,8*(4-1)
	srai x13,x13,8*(4-1)
	jal x1,putc_bfd
	jal x0,L.1147
L.1153:
	addi x19,x0,0
	slli x30,x0,8*(4-1)
	srli x30,x30,8*(4-1)
	addi x24,x30,0
	lw x30,4+128(x8)
	li x29,1
	add x29,x30,x29
	sw x29,4+128(x8)
	lb x26,0(x30)
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,48
	bne x30,x29,L.1155
	li x19,1
	lw x30,4+128(x8)
	li x29,1
	add x29,x30,x29
	sw x29,4+128(x8)
	lb x26,0(x30)
	jal x0,L.1160
L.1155:
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,45
	bne x30,x29,L.1160
	li x19,2
	lw x30,4+128(x8)
	li x29,1
	add x29,x30,x29
	sw x29,4+128(x8)
	lb x26,0(x30)
	jal x0,L.1160
L.1159:
	li x30,10
	mul x30,x30,x24
	slli x29,x26,8*(4-1)
	srai x29,x29,8*(4-1)
	add x30,x30,x29
	li x29,48
	sub x24,x30,x29
	lw x30,4+128(x8)
	li x29,1
	add x29,x30,x29
	sw x29,4+128(x8)
	lb x26,0(x30)
L.1160:
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,48
	blt x30,x29,L.1162
	li x29,57
	ble x30,x29,L.1159
L.1162:
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,108
	beq x30,x29,L.1165
	li x29,76
	bne x30,x29,L.1163
L.1165:
	slli x30,x19,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,4
	addi x19,x30,0
	lw x30,4+128(x8)
	li x29,1
	add x29,x30,x29
	sw x29,4+128(x8)
	lb x26,0(x30)
L.1163:
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	bne x30,x0,L.1166
	jal x0,L.1149
L.1166:
	addi x27,x26,0
	slli x30,x27,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,97
	blt x30,x29,L.1168
	li x29,122
	bgt x30,x29,L.1168
	slli x30,x27,8*(4-1)
	srai x30,x30,8*(4-1)
	addi x30,x30,-32
	addi x27,x30,0
L.1168:
	slli x30,x27,8*(4-1)
	srai x30,x30,8*(4-1)
	sw x30,-104+128(x8)
	lw x30,-104+128(x8)
	li x29,79
	beq x30,x29,L.1191
	bgt x30,x29,L.1195
L.1194:
	lw x30,-104+128(x8)
	li x29,66
	beq x30,x29,L.1190
	li x29,67
	beq x30,x29,L.1189
	li x29,68
	beq x30,x29,L.1192
	jal x0,L.1170
L.1195:
	lw x30,-104+128(x8)
	li x29,83
	beq x30,x29,L.1173
	li x29,85
	beq x30,x29,L.1192
	li x29,88
	beq x30,x29,L.1193
	jal x0,L.1170
L.1173:
	li x30,4
	add x30,x20,x30
	addi x20,x30,0
	li x29,-4
	add x30,x30,x29
	lw x18,0(x30)
	addi x22,x0,0
	jal x0,L.1177
L.1174:
L.1175:
	li x30,1
	add x22,x22,x30
L.1177:
	add x30,x22,x18
	lb x30,0(x30)
	bne x30,x0,L.1174
	slli x30,x19,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,2
	bne x30,x0,L.1184
	jal x0,L.1181
L.1180:
	addi x12,x8,-96+128
	li x13,32
	jal x1,putc_bfd
L.1181:
	addi x30,x22,0
	li x29,1
	add x22,x30,x29
	bltu x30,x24,L.1180
	jal x0,L.1184
L.1183:
	addi x12,x8,-96+128
	addi x30,x18,0
	li x29,1
	add x18,x30,x29
	lb x13,0(x30)
	jal x1,putc_bfd
L.1184:
	lb x30,0(x18)
	bne x30,x0,L.1183
	jal x0,L.1187
L.1186:
	addi x12,x8,-96+128
	li x13,32
	jal x1,putc_bfd
L.1187:
	addi x30,x22,0
	li x29,1
	add x22,x30,x29
	bltu x30,x24,L.1186
	jal x0,L.1147
L.1189:
	addi x12,x8,-96+128
	li x30,4
	add x30,x20,x30
	addi x20,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	slli x13,x30,8*(4-1)
	srai x13,x13,8*(4-1)
	jal x1,putc_bfd
	jal x0,L.1147
L.1190:
	li x21,2
	jal x0,L.1171
L.1191:
	li x21,8
	jal x0,L.1171
L.1192:
	li x21,10
	jal x0,L.1171
L.1193:
	li x21,16
	jal x0,L.1171
L.1170:
	addi x12,x8,-96+128
	slli x13,x26,8*(4-1)
	srai x13,x13,8*(4-1)
	jal x1,putc_bfd
	jal x0,L.1147
L.1171:
	slli x30,x19,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,4
	beq x30,x0,L.1198
	li x30,4
	add x30,x20,x30
	addi x20,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-108+128(x8)
	jal x0,L.1199
L.1198:
	slli x30,x27,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,68
	bne x30,x29,L.1200
	li x30,4
	add x30,x20,x30
	addi x20,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-112+128(x8)
	jal x0,L.1201
L.1200:
	li x30,4
	add x30,x20,x30
	addi x20,x30,0
	li x29,-4
	add x30,x30,x29
	lw x30,0(x30)
	sw x30,-112+128(x8)
L.1201:
	lw x30,-112+128(x8)
	sw x30,-108+128(x8)
L.1199:
	lw x23,-108+128(x8)
	slli x30,x27,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,68
	bne x30,x29,L.1202
	li x30,0x80000000
	and x30,x23,x30
	beq x30,x0,L.1202
	sub x23,x0,x23
	slli x30,x19,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,8
	addi x19,x30,0
L.1202:
	addi x25,x0,0
L.1204:
	slli x30,x21,8*(4-1)
	srli x30,x30,8*(4-1)
	remu x29,x23,x30
	addi x27,x29,0
	divu x23,x23,x30
	slli x30,x27,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,9
	ble x30,x29,L.1207
	slli x30,x26,8*(4-1)
	srai x30,x30,8*(4-1)
	li x29,120
	bne x30,x29,L.1210
	li x30,39
	sw x30,-116+128(x8)
	jal x0,L.1211
L.1210:
	li x30,7
	sw x30,-116+128(x8)
L.1211:
	slli x30,x27,8*(4-1)
	srai x30,x30,8*(4-1)
	lw x29,-116+128(x8)
	add x30,x30,x29
	addi x27,x30,0
L.1207:
	addi x30,x25,0
	li x29,1
	add x25,x30,x29
	addi x29,x8,-20+128
	add x30,x30,x29
	slli x29,x27,8*(4-1)
	srai x29,x29,8*(4-1)
	addi x29,x29,48
	sb x29,0(x30)
L.1205:
	beq x23,x0,L.1212
	li x30,16
	bltu x25,x30,L.1204
L.1212:
	slli x30,x19,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,8
	beq x30,x0,L.1213
	addi x30,x25,0
	li x29,1
	add x25,x30,x29
	addi x29,x8,-20+128
	add x30,x30,x29
	li x29,45
	sb x29,0(x30)
L.1213:
	addi x22,x25,0
	slli x30,x19,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,1
	beq x30,x0,L.1216
	li x30,48
	sw x30,-116+128(x8)
	jal x0,L.1217
L.1216:
	li x30,32
	sw x30,-116+128(x8)
L.1217:
	lw x30,-116+128(x8)
	addi x27,x30,0
	jal x0,L.1219
L.1218:
	addi x12,x8,-96+128
	slli x13,x27,8*(4-1)
	srai x13,x13,8*(4-1)
	jal x1,putc_bfd
L.1219:
	slli x30,x19,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,2
	bne x30,x0,L.1221
	addi x30,x22,0
	li x29,1
	add x22,x30,x29
	bltu x30,x24,L.1218
L.1221:
L.1222:
	addi x12,x8,-96+128
	li x30,1
	sub x30,x25,x30
	addi x25,x30,0
	addi x29,x8,-20+128
	add x30,x30,x29
	lb x13,0(x30)
	jal x1,putc_bfd
L.1223:
	bne x25,x0,L.1222
	jal x0,L.1226
L.1225:
	addi x12,x8,-96+128
	slli x13,x27,8*(4-1)
	srai x13,x13,8*(4-1)
	jal x1,putc_bfd
L.1226:
	addi x30,x22,0
	li x29,1
	add x22,x30,x29
	bltu x30,x24,L.1225
	jal x0,L.1147
L.1149:
	lw x30,-92+128(x8)
	blt x30,x0,L.1228
	lw x12,-96+128(x8)
	addi x13,x8,-84+128
	lw x30,-92+128(x8)
	addi x14,x30,0
	addi x15,x8,-100+128
	jal x1,f_write
	bne x10,x0,L.1228
	lw x30,-92+128(x8)
	lw x29,-100+128(x8)
	bne x30,x29,L.1228
	lw x10,-88+128(x8)
	jal x0,L.1142
L.1228:
	li x10,-1
L.1142:
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
	lw  x8,204(x2)
	addi  x2,x2,208
	jalr x0,x1,0

	.align 4
	.bss
	.align	2
LfnBuf:
	.space	512
	.align	2
Fsid:
	.space	2
	.align	4
FatFs:
	.space	4
	.align 4
	.data
	.align	1
L.521:
	.byte	0x2b
	.byte	0x2c
	.byte	0x3b
	.byte	0x3d
	.byte	0x5b
	.byte	0x5d
	.byte	0x0
	.align	1
L.474:
	.byte	0x22
	.byte	0x2a
	.byte	0x3a
	.byte	0x3c
	.byte	0x3e
	.byte	0x3f
	.byte	0x7c
	.byte	0x7f
	.byte	0x0
	.align 4

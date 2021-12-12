	.align 4
	.text
	.globl CS_H
	.align	4
CS_H:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x30,0x40000004
	li x29,1
	sb x29,0(x30)
L.2:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl CS_L
	.align	4
CS_L:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x30,0x40000004
	sb x0,0(x30)
L.3:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl dly_us
	.align	4
dly_us:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	sw x12,16(x8)
	jal x1,rdcyc
	addi x26,x10,0
	li x30,50
	lw x29,0+16(x8)
	mul x30,x30,x29
	add x27,x26,x30
	bleu x27,x26,L.11
L.7:
L.8:
	jal x1,rdcyc
	bltu x10,x27,L.7
	jal x0,L.6
L.10:
L.11:
	jal x1,rdcyc
	bgtu x10,x27,L.10
L.6:
	addi x10,x0,0
L.4:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl initspi
	.align	4
initspi:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
L.13:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl writereadbytespi
	.align	4
writereadbytespi:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x30,0x40000008
	sb x12,0(x30)
	li x30,0x40000008
	lbu x10,0(x30)
L.14:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align 4
	.data
	.align	1
Stat:
	.byte	0x1
	.align 4
	.text
	.align	4
xmit_mmc:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	mv x26,x13
L.16:
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	lbu x25,0(x30)
	slli x12,x25,8*(4-1)
	srli x12,x12,8*(4-1)
	jal x1,writereadbytespi
L.17:
	li x30,1
	sub x30,x26,x30
	addi x26,x30,0
	bne x30,x0,L.16
L.15:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
rcvr_mmc:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	mv x26,x13
L.20:
	li x12,255
	jal x1,writereadbytespi
	addi x30,x10,0
	addi x25,x30,0
	addi x30,x27,0
	li x29,1
	add x27,x30,x29
	sb x25,0(x30)
L.21:
	li x30,1
	sub x30,x26,x30
	addi x26,x30,0
	bne x30,x0,L.20
L.19:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
wait_ready:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x26,28(x2)
	sw x27,32(x2)
	li x27,5000
	jal x0,L.27
L.24:
	addi x12,x8,-5+16
	li x13,1
	jal x1,rcvr_mmc
	lbu x30,-5+16(x8)
	li x29,255
	bne x30,x29,L.28
	jal x0,L.26
L.28:
	li x12,100
	jal x1,dly_us
L.25:
	li x30,1
	sub x27,x27,x30
L.27:
	bne x27,x0,L.24
L.26:
	beq x27,x0,L.31
	li x26,1
	jal x0,L.32
L.31:
	addi x26,x0,0
L.32:
	addi x10,x26,0
L.23:
	lw x1,24(x2)
	lw x26,28(x2)
	lw x27,32(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
deselect:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	jal x1,CS_H
	addi x12,x8,-5+16
	li x13,1
	jal x1,rcvr_mmc
L.33:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align	4
select:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	jal x1,CS_L
	addi x12,x8,-5+16
	li x13,1
	jal x1,rcvr_mmc
	jal x1,wait_ready
	beq x10,x0,L.35
	li x10,1
	jal x0,L.34
L.35:
	jal x1,deselect
	addi x10,x0,0
L.34:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align	4
rcvr_datablock:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	li x27,1000
	jal x0,L.41
L.38:
	addi x12,x8,-6+16
	li x13,1
	jal x1,rcvr_mmc
	lbu x30,-6+16(x8)
	li x29,255
	beq x30,x29,L.42
	jal x0,L.40
L.42:
	li x12,100
	jal x1,dly_us
L.39:
	li x30,1
	sub x27,x27,x30
L.41:
	bne x27,x0,L.38
L.40:
	lbu x30,-6+16(x8)
	li x29,254
	beq x30,x29,L.44
	addi x10,x0,0
	jal x0,L.37
L.44:
	lw x12,0+16(x8)
	lw x13,4+16(x8)
	jal x1,rcvr_mmc
	addi x12,x8,-6+16
	li x13,2
	jal x1,rcvr_mmc
	li x10,1
L.37:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.align	4
xmit_datablock:
	addi x2,x2,-48
	sw  x8,44(x2)
	addi  x8,x2,32
	sw x1,24(x2)
	sw x12,16(x8)
	sw x13,20(x8)
	lw x30,4+16(x8)
	sb x30,4+16(x8)
	jal x1,wait_ready
	bne x10,x0,L.47
	addi x10,x0,0
	jal x0,L.46
L.47:
	lbu x30,4+16(x8)
	sb x30,-6+16(x8)
	addi x12,x8,-6+16
	li x13,1
	jal x1,xmit_mmc
	lbu x30,4+16(x8)
	li x29,253
	beq x30,x29,L.49
	lw x12,0+16(x8)
	li x13,512
	jal x1,xmit_mmc
	addi x12,x8,-6+16
	li x13,2
	jal x1,rcvr_mmc
	addi x12,x8,-6+16
	li x13,1
	jal x1,rcvr_mmc
	lbu x30,-6+16(x8)
	andi x30,x30,31
	li x29,5
	beq x30,x29,L.51
	addi x10,x0,0
	jal x0,L.46
L.51:
L.49:
	li x10,1
L.46:
	lw x1,24(x2)
	lw  x8,44(x2)
	addi  x2,x2,48
	jalr x0,x1,0

	.align	4
send_cmd:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	mv x27,x12
	mv x26,x13
	slli x30,x27,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,128
	beq x30,x0,L.54
	slli x30,x27,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,127
	addi x27,x30,0
	li x12,55
	addi x13,x0,0
	jal x1,send_cmd
	addi x30,x10,0
	addi x25,x30,0
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,1
	ble x30,x29,L.56
	slli x10,x25,8*(4-1)
	srli x10,x10,8*(4-1)
	jal x0,L.53
L.56:
L.54:
	slli x30,x27,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,12
	beq x30,x29,L.58
	jal x1,deselect
	jal x1,select
	bne x10,x0,L.60
	li x10,255
	jal x0,L.53
L.60:
L.58:
	slli x30,x27,8*(4-1)
	srli x30,x30,8*(4-1)
	ori x30,x30,64
	sb x30,-11+16(x8)
	li x30,24
	srl x30,x26,x30
	sb x30,-10+16(x8)
	li x30,16
	srl x30,x26,x30
	sb x30,-9+16(x8)
	li x30,8
	srl x30,x26,x30
	sb x30,-8+16(x8)
	addi x30,x26,0
	sb x30,-7+16(x8)
	li x25,1
	slli x30,x27,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.66
	li x25,149
L.66:
	slli x30,x27,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,8
	bne x30,x29,L.68
	li x25,135
L.68:
	sb x25,-6+16(x8)
	addi x12,x8,-11+16
	li x13,6
	jal x1,xmit_mmc
	slli x30,x27,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,12
	bne x30,x29,L.71
	addi x12,x8,-5+16
	li x13,1
	jal x1,rcvr_mmc
L.71:
	li x25,10
L.73:
	addi x12,x8,-5+16
	li x13,1
	jal x1,rcvr_mmc
L.74:
	lbu x29,-5+16(x8)
	andi x29,x29,128
	beq x29,x0,L.76
	slli x29,x25,8*(4-1)
	srli x29,x29,8*(4-1)
	addi x29,x29,-1
	addi x25,x29,0
	slli x29,x29,8*(4-1)
	srli x29,x29,8*(4-1)
	bne x29,x0,L.73
L.76:
	lbu x10,-5+16(x8)
L.53:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl disk_status
	.align	4
disk_status:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	slli x30,x12,8*(4-1)
	srli x30,x30,8*(4-1)
	beq x30,x0,L.78
	li x10,1
	jal x0,L.77
L.78:
	la x30,Stat
	lbu x10,0(x30)
L.77:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl disk_initialize
	.align	4
disk_initialize:
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
	lw x30,0+16(x8)
	sb x30,0+16(x8)
	jal x1,initspi
	lbu x30,0+16(x8)
	beq x30,x0,L.81
	li x10,3
	jal x0,L.80
L.81:
	li x12,10000
	jal x1,dly_us
	jal x1,CS_H
	li x27,10
	jal x0,L.86
L.83:
	addi x12,x8,-8+16
	li x13,1
	jal x1,rcvr_mmc
L.84:
	slli x30,x27,8*(4-1)
	srli x30,x30,8*(4-1)
	addi x30,x30,-1
	addi x27,x30,0
L.86:
	slli x30,x27,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.83
	addi x25,x0,0
	addi x12,x0,0
	addi x13,x0,0
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,1
	bne x30,x29,L.87
	li x12,8
	li x13,426
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,1
	bne x30,x29,L.89
	addi x12,x8,-8+16
	li x13,4
	jal x1,rcvr_mmc
	lbu x30,-6+16(x8)
	li x29,1
	bne x30,x29,L.90
	lbu x30,-5+16(x8)
	li x29,170
	bne x30,x29,L.90
	li x26,1000
	jal x0,L.98
L.95:
	li x12,169
	li x13,0x40000000
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.99
	jal x0,L.97
L.99:
	li x12,1000
	jal x1,dly_us
L.96:
	li x30,1
	sub x26,x26,x30
L.98:
	bne x26,x0,L.95
L.97:
	beq x26,x0,L.90
	li x12,58
	addi x13,x0,0
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.90
	addi x12,x8,-8+16
	li x13,4
	jal x1,rcvr_mmc
	lbu x30,-8+16(x8)
	andi x30,x30,64
	beq x30,x0,L.104
	li x23,12
	jal x0,L.105
L.104:
	li x23,4
L.105:
	addi x30,x23,0
	addi x25,x30,0
	jal x0,L.90
L.89:
	li x12,169
	addi x13,x0,0
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	li x29,1
	bgt x30,x29,L.106
	li x25,2
	li x30,169
	sb x30,-9+16(x8)
	jal x0,L.107
L.106:
	li x30,1
	addi x25,x30,0
	sb x30,-9+16(x8)
L.107:
	li x26,1000
	jal x0,L.111
L.108:
	lbu x12,-9+16(x8)
	addi x13,x0,0
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.112
	jal x0,L.110
L.112:
	li x12,1000
	jal x1,dly_us
L.109:
	li x30,1
	sub x26,x26,x30
L.111:
	bne x26,x0,L.108
L.110:
	beq x26,x0,L.116
	li x12,16
	li x13,512
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	beq x30,x0,L.114
L.116:
	addi x25,x0,0
L.114:
L.90:
L.87:
	la x30,CardType
	sb x25,0(x30)
	slli x30,x25,8*(4-1)
	srli x30,x30,8*(4-1)
	beq x30,x0,L.118
	addi x23,x0,0
	jal x0,L.119
L.118:
	li x23,1
L.119:
	addi x30,x23,0
	addi x24,x30,0
	la x30,Stat
	sb x24,0(x30)
	jal x1,deselect
	slli x10,x24,8*(4-1)
	srli x10,x10,8*(4-1)
L.80:
	lw x1,24(x2)
	lw x23,28(x2)
	lw x24,32(x2)
	lw x25,36(x2)
	lw x26,40(x2)
	lw x27,44(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.globl disk_read
	.align	4
disk_read:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x24,28(x2)
	sw x25,32(x2)
	sw x26,36(x2)
	sw x27,40(x2)
	sw x12,16(x8)
	mv x27,x13
	sw x14,24(x8)
	mv x26,x15
	lw x30,0+16(x8)
	sb x30,0+16(x8)
	lbu x12,0+16(x8)
	jal x1,disk_status
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,1
	beq x30,x0,L.121
	li x10,3
	jal x0,L.120
L.121:
	la x30,CardType
	lbu x30,0(x30)
	andi x30,x30,8
	bne x30,x0,L.123
	lw x30,8+16(x8)
	li x29,9
	sll x30,x30,x29
	sw x30,8+16(x8)
L.123:
	li x30,1
	bleu x26,x30,L.126
	li x25,18
	jal x0,L.127
L.126:
	li x25,17
L.127:
	addi x30,x25,0
	sb x30,-5+16(x8)
	lbu x12,-5+16(x8)
	lw x13,8+16(x8)
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.128
L.130:
	addi x12,x27,0
	li x13,512
	jal x1,rcvr_datablock
	bne x10,x0,L.133
	jal x0,L.132
L.133:
	li x30,512
	add x27,x27,x30
L.131:
	li x30,1
	sub x30,x26,x30
	addi x26,x30,0
	bne x30,x0,L.130
L.132:
	lbu x30,-5+16(x8)
	li x29,18
	bne x30,x29,L.135
	li x12,12
	addi x13,x0,0
	jal x1,send_cmd
L.135:
L.128:
	jal x1,deselect
	beq x26,x0,L.138
	li x24,1
	jal x0,L.139
L.138:
	addi x24,x0,0
L.139:
	addi x10,x24,0
L.120:
	lw x1,24(x2)
	lw x24,28(x2)
	lw x25,32(x2)
	lw x26,36(x2)
	lw x27,40(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl disk_write
	.align	4
disk_write:
	addi x2,x2,-64
	sw  x8,60(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x25,28(x2)
	sw x26,32(x2)
	sw x27,36(x2)
	sw x12,16(x8)
	mv x27,x13
	sw x14,24(x8)
	mv x26,x15
	lw x30,0+16(x8)
	sb x30,0+16(x8)
	lbu x12,0+16(x8)
	jal x1,disk_status
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,1
	beq x30,x0,L.141
	li x10,3
	jal x0,L.140
L.141:
	la x30,CardType
	lbu x30,0(x30)
	andi x30,x30,8
	bne x30,x0,L.143
	lw x30,8+16(x8)
	li x29,9
	sll x30,x30,x29
	sw x30,8+16(x8)
L.143:
	li x30,1
	bne x26,x30,L.145
	li x12,24
	lw x13,8+16(x8)
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.146
	addi x12,x27,0
	li x13,254
	jal x1,xmit_datablock
	beq x10,x0,L.146
	addi x26,x0,0
	jal x0,L.146
L.145:
	la x30,CardType
	lbu x30,0(x30)
	andi x30,x30,6
	beq x30,x0,L.149
	li x12,151
	addi x13,x26,0
	jal x1,send_cmd
L.149:
	li x12,25
	lw x13,8+16(x8)
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.151
L.153:
	addi x12,x27,0
	li x13,252
	jal x1,xmit_datablock
	bne x10,x0,L.156
	jal x0,L.155
L.156:
	li x30,512
	add x27,x27,x30
L.154:
	li x30,1
	sub x30,x26,x30
	addi x26,x30,0
	bne x30,x0,L.153
L.155:
	addi x12,x0,0
	li x13,253
	jal x1,xmit_datablock
	bne x10,x0,L.158
	li x26,1
L.158:
L.151:
L.146:
	jal x1,deselect
	beq x26,x0,L.161
	li x25,1
	jal x0,L.162
L.161:
	addi x25,x0,0
L.162:
	addi x10,x25,0
L.140:
	lw x1,24(x2)
	lw x25,28(x2)
	lw x26,32(x2)
	lw x27,36(x2)
	lw  x8,60(x2)
	addi  x2,x2,64
	jalr x0,x1,0

	.globl disk_ioctl
	.align	4
disk_ioctl:
	addi x2,x2,-80
	sw  x8,76(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	sw x12,32(x8)
	sw x13,36(x8)
	sw x14,40(x8)
	lw x30,0+32(x8)
	sb x30,0+32(x8)
	lw x30,4+32(x8)
	sb x30,4+32(x8)
	lbu x12,0+32(x8)
	jal x1,disk_status
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	andi x30,x30,1
	beq x30,x0,L.164
	li x10,3
	jal x0,L.163
L.164:
	li x30,1
	sw x30,-8+32(x8)
	lbu x27,4+32(x8)
	beq x27,x0,L.169
	li x30,1
	beq x27,x30,L.172
	li x30,3
	beq x27,x30,L.186
	jal x0,L.166
L.169:
	jal x1,select
	beq x10,x0,L.167
	sw x0,-8+32(x8)
	jal x0,L.167
L.172:
	li x12,9
	addi x13,x0,0
	jal x1,send_cmd
	addi x30,x10,0
	slli x30,x30,8*(4-1)
	srli x30,x30,8*(4-1)
	bne x30,x0,L.167
	addi x12,x8,-24+32
	li x13,16
	jal x1,rcvr_datablock
	beq x10,x0,L.167
	lbu x30,-24+32(x8)
	li x29,6
	sra x30,x30,x29
	li x29,1
	bne x30,x29,L.175
	lbu x30,-15+32(x8)
	lbu x29,-16+32(x8)
	slli x29,x29,8*(4-2)
	srli x29,x29,8*(4-2)
	li x28,8
	sll x29,x29,x28
	add x30,x30,x29
	lbu x29,-17+32(x8)
	andi x29,x29,63
	li x28,16
	sll x29,x29,x28
	add x30,x30,x29
	li x29,1
	add x30,x30,x29
	sw x30,-28+32(x8)
	lw x30,8+32(x8)
	lw x29,-28+32(x8)
	li x28,10
	sll x29,x29,x28
	sw x29,0(x30)
	jal x0,L.176
L.175:
	li x30,3
	li x29,1
	li x28,2
	lbu x7,-19+32(x8)
	andi x7,x7,15
	lbu x6,-14+32(x8)
	andi x6,x6,128
	li x5,7
	sra x6,x6,x5
	add x7,x7,x6
	lbu x6,-15+32(x8)
	and x6,x6,x30
	sll x6,x6,x29
	add x7,x7,x6
	add x7,x7,x28
	sb x7,-29+32(x8)
	lbu x7,-16+32(x8)
	li x6,6
	sra x7,x7,x6
	lbu x6,-17+32(x8)
	slli x6,x6,8*(4-2)
	srli x6,x6,8*(4-2)
	sll x28,x6,x28
	add x28,x7,x28
	lbu x7,-18+32(x8)
	and x30,x7,x30
	slli x30,x30,8*(4-2)
	srli x30,x30,8*(4-2)
	li x7,10
	sll x30,x30,x7
	add x30,x28,x30
	add x30,x30,x29
	sw x30,-28+32(x8)
	lw x30,8+32(x8)
	lw x29,-28+32(x8)
	lbu x28,-29+32(x8)
	addi x28,x28,-9
	sll x29,x29,x28
	sw x29,0(x30)
L.176:
	sw x0,-8+32(x8)
	jal x0,L.167
L.186:
	lw x30,8+32(x8)
	li x29,128
	sw x29,0(x30)
	sw x0,-8+32(x8)
	jal x0,L.167
L.166:
	li x30,4
	sw x30,-8+32(x8)
L.167:
	jal x1,deselect
	lw x10,-8+32(x8)
L.163:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,76(x2)
	addi  x2,x2,80
	jalr x0,x1,0

	.align 4
	.bss
	.align	1
CardType:
	.space	1
	.align 4

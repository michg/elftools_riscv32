	.align 4
	.text
	.align 4
	.data
	.globl uart1
	.align	4
uart1:
	.word	0x20000000
	.globl putcmon
	.align 4
	.text
	.align	4
putcmon:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	la x30,uart1
	lw x30,0(x30)
	slli x29,x12,8*(4-1)
	srli x29,x29,8*(4-1)
	sw x29,0(x30)
L.6:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.globl main
	.align	4
main:
	addi x2,x2,-144
	sw  x8,140(x2)
	addi  x8,x2,48
	sw x1,24(x2)
	sw x27,28(x2)
	la x30,xfunc_out
	la x29,putcmon
	sw x29,0(x30)
	la x12,L.8
	jal x1,xprintf
	la x12,FatFs
	la x13,L.9
	addi x14,x0,0
	jal x1,f_mount
	addi x27,x10,0
	la x12,Fil
	la x13,L.10
	li x14,1
	jal x1,f_open
	addi x27,x10,0
	bne x27,x0,L.11
	la x12,L.13
	jal x1,xprintf
	addi x12,x8,-84+96
	li x13,80
	la x14,Fil
	jal x1,f_gets
	la x12,L.14
	addi x13,x8,-84+96
	jal x1,xprintf
	la x12,Fil
	jal x1,f_close
L.11:
	la x12,L.15
	jal x1,xprintf
	addi x10,x0,0
L.7:
	lw x1,24(x2)
	lw x27,28(x2)
	lw  x8,140(x2)
	addi  x2,x2,144
	jalr x0,x1,0

	.globl get_fattime
	.align	4
get_fattime:
	addi x2,x2,-32
	sw  x8,28(x2)
	addi  x8,x2,16
	li x10,0x42fc0000
L.16:
	lw  x8,28(x2)
	addi  x2,x2,32
	jalr x0,x1,0

	.align 4
	.bss
	.globl Fil
	.align	4
Fil:
	.space	36
	.globl FatFs
	.align	4
FatFs:
	.space	560
	.align 4
	.data
	.align	1
L.15:
	.byte	0x42
	.byte	0x79
	.byte	0x65
	.byte	0x2e
	.byte	0xa
	.byte	0xd
	.byte	0x0
	.align	1
L.14:
	.byte	0x25
	.byte	0x73
	.byte	0x0
	.align	1
L.13:
	.byte	0x72
	.byte	0x65
	.byte	0x61
	.byte	0x64
	.byte	0x69
	.byte	0x6e
	.byte	0x67
	.byte	0x20
	.byte	0x66
	.byte	0x72
	.byte	0x6f
	.byte	0x6d
	.byte	0x20
	.byte	0x67
	.byte	0x72
	.byte	0x65
	.byte	0x65
	.byte	0x74
	.byte	0x73
	.byte	0x2e
	.byte	0x74
	.byte	0x78
	.byte	0x74
	.byte	0x3a
	.byte	0xa
	.byte	0xd
	.byte	0x0
	.align	1
L.10:
	.byte	0x67
	.byte	0x72
	.byte	0x65
	.byte	0x65
	.byte	0x74
	.byte	0x73
	.byte	0x2e
	.byte	0x74
	.byte	0x78
	.byte	0x74
	.byte	0x0
	.align	1
L.9:
	.byte	0x0
	.align	1
L.8:
	.byte	0x4d
	.byte	0x4d
	.byte	0x43
	.byte	0x2f
	.byte	0x53
	.byte	0x44
	.byte	0x2d
	.byte	0x43
	.byte	0x61
	.byte	0x72
	.byte	0x64
	.byte	0x62
	.byte	0x6f
	.byte	0x6f
	.byte	0x74
	.byte	0x6c
	.byte	0x6f
	.byte	0x61
	.byte	0x64
	.byte	0x65
	.byte	0x72
	.byte	0x20
	.byte	0x44
	.byte	0x65
	.byte	0x6d
	.byte	0x6f
	.byte	0x2c
	.byte	0x20
	.byte	0x0
	.align 4

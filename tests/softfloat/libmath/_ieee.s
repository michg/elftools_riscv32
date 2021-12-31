	.align 4
	.text
	.align 4
	.data
	.globl _mInfinity
	.align	4
_mInfinity:
	.word	0xff800000
	.globl _pInfinity
	.align	4
_pInfinity:
	.word	0x7f800000
	.globl _qNaN
	.align	4
_qNaN:
	.word	0x7fc00000
	.globl _sNaN
	.align	4
_sNaN:
	.word	0x7f800001
	.align 4

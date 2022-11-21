	.file	"random.c"
	.intel_syntax noprefix
	.text
	.globl	generate
	.type	generate, @function
generate:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1759218605
	shr	rdx, 32
	sar	edx, 12
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 10000
	sub	eax, ecx
	mov	edx, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, edx
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	mov	rax, QWORD PTR -8[rbp]
	movsd	QWORD PTR [rax], xmm0
	nop
	leave
	ret
	.size	generate, .-generate
	.section	.rodata
.LC1:
	.string	"sin(%lf) ~= %lf.\n"
	.text
	.globl	print
	.type	print, @function
print:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	rax, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 2
	call	printf@PLT
	nop
	leave
	ret
	.size	print, .-print
	.globl	getAns
	.type	getAns, @function
getAns:
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -24[rbp], xmm0
	mov	QWORD PTR -32[rbp], rdi
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	DWORD PTR -12[rbp], eax
	cmp	DWORD PTR -12[rbp], 0
	jle	.L4
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, DWORD PTR -12[rbp]
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	jmp	.L5
.L4:
	mov	eax, DWORD PTR -12[rbp]
	neg	eax
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm0, xmm1
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
.L5:
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR [rax], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -16[rbp], 1
	jmp	.L6
.L7:
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	xmm1, QWORD PTR .LC4[rip]
	xorpd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	mov	eax, DWORD PTR -16[rbp]
	add	eax, eax
	add	eax, 1
	imul	eax, DWORD PTR -16[rbp]
	add	eax, eax
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR -8[rbp]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -16[rbp], 1
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR [rax]
	addsd	xmm0, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movsd	QWORD PTR [rax], xmm0
.L6:
	movsd	xmm0, QWORD PTR -8[rbp]
	comisd	xmm0, QWORD PTR .LC5[rip]
	ja	.L7
	movsd	xmm0, QWORD PTR .LC6[rip]
	comisd	xmm0, QWORD PTR -8[rbp]
	ja	.L7
	nop
	nop
	pop	rbp
	ret
	.size	getAns, .-getAns
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -24[rbp]
	mov	rdi, rax
	call	generate
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, -16[rbp]
	mov	rdi, rdx
	movq	xmm0, rax
	call	getAns
	lea	rdx, -16[rbp]
	lea	rax, -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	print
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1079574528
	.align 8
.LC2:
	.long	1413754136
	.long	1075388923
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 16
.LC4:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC5:
	.long	-1698910392
	.long	1048238066
	.align 8
.LC6:
	.long	-1698910392
	.long	-1099245582
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits

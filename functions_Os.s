	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Enter the length of A: "
.LC1:
	.string	"%d"
.LC2:
	.string	"Unacceptable length value!"
	.text
	.globl	inputLength
	.type	inputLength, @function
inputLength:
.LFB24:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	lea	rsi, .LC0[rip]
	mov	rbx, rdi
	xor	eax, eax
	mov	edi, 1
	call	__printf_chk@PLT
	xor	eax, eax
	mov	rsi, rbx
	lea	rdi, .LC1[rip]
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR [rbx], 0
	jg	.L1
	mov	edi, 1
	lea	rsi, .LC2[rip]
	xor	eax, eax
	call	__printf_chk@PLT
	mov	edi, 1
	call	exit@PLT
.L1:
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	inputLength, .-inputLength
	.section	.rodata.str1.1
.LC3:
	.string	"Now enter the elements of array A separated with spaces or new lines: "
.LC4:
	.string	"%ld"
	.text
	.globl	inputA
	.type	inputA, @function
inputA:
.LFB25:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xor	eax, eax
	lea	r13, .LC4[rip]
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xor	r12d, r12d
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	ebp, esi
	lea	rsi, .LC3[rip]
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	rbx, rdi
	mov	edi, 1
	push	rdx
	.cfi_def_cfa_offset 48
	call	__printf_chk@PLT
.L6:
	cmp	r12d, ebp
	jge	.L9
	mov	rsi, rbx
	mov	rdi, r13
	xor	eax, eax
	inc	r12d
	call	__isoc99_scanf@PLT
	add	rbx, 8
	jmp	.L6
.L9:
	pop	rax
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	inputA, .-inputA
	.globl	formatFindMin
	.type	formatFindMin, @function
formatFindMin:
.LFB26:
	.cfi_startproc
	endbr64
	mov	r8, QWORD PTR [rdi]
	mov	ecx, 1
	mov	eax, 1
.L11:
	cmp	esi, ecx
	jle	.L15
	mov	r9, QWORD PTR [rdi+rcx*8]
	cmp	r9, r8
	jl	.L14
	jne	.L12
	inc	eax
	jmp	.L12
.L14:
	mov	r8, r9
	mov	eax, 1
.L12:
	inc	rcx
	jmp	.L11
.L15:
	sub	esi, eax
	mov	rax, r8
	mov	DWORD PTR [rdx], esi
	ret
	.cfi_endproc
.LFE26:
	.size	formatFindMin, .-formatFindMin
	.globl	formatGetB
	.type	formatGetB, @function
formatGetB:
.LFB27:
	.cfi_startproc
	endbr64
	xor	eax, eax
	xor	r8d, r8d
.L17:
	cmp	edx, eax
	jle	.L20
	mov	r9, QWORD PTR [rdi+rax*8]
	cmp	r9, rcx
	je	.L18
	movsx	r10, r8d
	inc	r8d
	mov	QWORD PTR [rsi+r10*8], r9
.L18:
	inc	rax
	jmp	.L17
.L20:
	ret
	.cfi_endproc
.LFE27:
	.size	formatGetB, .-formatGetB
	.section	.rodata.str1.1
.LC5:
	.string	"This is array B: "
.LC6:
	.string	"%ld "
	.text
	.globl	output
	.type	output, @function
output:
.LFB28:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xor	eax, eax
	lea	r13, .LC6[rip]
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12, rdi
	mov	edi, 1
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	ebp, esi
	lea	rsi, .LC5[rip]
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xor	ebx, ebx
	push	rdx
	.cfi_def_cfa_offset 48
	call	__printf_chk@PLT
.L22:
	cmp	ebp, ebx
	jle	.L25
	mov	rdx, QWORD PTR [r12+rbx*8]
	mov	rsi, r13
	mov	edi, 1
	xor	eax, eax
	inc	rbx
	call	__printf_chk@PLT
	jmp	.L22
.L25:
	pop	rax
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE28:
	.size	output, .-output
	.section	.rodata.str1.1
.LC7:
	.string	"This is randomly generated A: "
	.text
	.globl	generateA
	.type	generateA, @function
generateA:
.LFB29:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xor	eax, eax
	lea	r13, .LC6[rip]
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12, rdi
	mov	edi, 1
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	ebp, esi
	lea	rsi, .LC7[rip]
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xor	ebx, ebx
	push	rdx
	.cfi_def_cfa_offset 48
	call	__printf_chk@PLT
.L27:
	cmp	ebp, ebx
	jle	.L30
	call	rand@PLT
	mov	rsi, r13
	mov	edi, 1
	movsx	rdx, eax
	xor	eax, eax
	mov	QWORD PTR [r12+rbx*8], rdx
	inc	rbx
	call	__printf_chk@PLT
	jmp	.L27
.L30:
	pop	rax
	.cfi_def_cfa_offset 40
	mov	edi, 10
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT
	.cfi_endproc
.LFE29:
	.size	generateA, .-generateA
	.section	.rodata.str1.1
.LC8:
	.string	"Enter 1 to manually input A, enter 0 to generate A randomly: "
.LC9:
	.string	"Wrong value of choice!"
	.text
	.globl	pickTypeOfInput
	.type	pickTypeOfInput, @function
pickTypeOfInput:
.LFB30:
	.cfi_startproc
	endbr64
	sub	rsp, 24
	.cfi_def_cfa_offset 32
	lea	rsi, .LC8[rip]
	mov	edi, 1
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	call	__printf_chk@PLT
	lea	rsi, 4[rsp]
	lea	rdi, .LC1[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR 4[rsp]
	cmp	eax, 1
	jbe	.L31
	mov	edi, 1
	lea	rsi, .LC9[rip]
	xor	eax, eax
	call	__printf_chk@PLT
	mov	edi, 1
	call	exit@PLT
.L31:
	mov	rdx, QWORD PTR 8[rsp]
	sub	rdx, QWORD PTR fs:40
	je	.L33
	call	__stack_chk_fail@PLT
.L33:
	add	rsp, 24
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
	.size	pickTypeOfInput, .-pickTypeOfInput
	.globl	getInputFileContents
	.type	getInputFileContents, @function
getInputFileContents:
.LFB31:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	lea	r14, .LC4[rip]
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	mov	r13, rdx
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	xor	r12d, r12d
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	mov	ebp, esi
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	rbx, rdi
.L36:
	cmp	r12d, ebp
	jge	.L39
	mov	rdx, rbx
	mov	rsi, r14
	mov	rdi, r13
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	inc	r12d
	add	rbx, 8
	jmp	.L36
.L39:
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE31:
	.size	getInputFileContents, .-getInputFileContents
	.globl	outputToFile
	.type	outputToFile, @function
outputToFile:
.LFB32:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	lea	r14, .LC6[rip]
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	mov	r13, rdx
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	mov	r12, rdi
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	mov	ebp, esi
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xor	ebx, ebx
.L41:
	cmp	ebp, ebx
	jle	.L44
	mov	rcx, QWORD PTR [r12+rbx*8]
	mov	rdx, r14
	mov	esi, 1
	mov	rdi, r13
	xor	eax, eax
	inc	rbx
	call	__fprintf_chk@PLT
	jmp	.L41
.L44:
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE32:
	.size	outputToFile, .-outputToFile
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

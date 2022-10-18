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
	.p2align 4
	.globl	inputLength
	.type	inputLength, @function
inputLength:
.LFB39:
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
	mov	rsi, rbx
	lea	rdi, .LC1[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR [rbx]
	test	eax, eax
	jle	.L5
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	mov	edi, 1
	lea	rsi, .LC2[rip]
	xor	eax, eax
	call	__printf_chk@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE39:
	.size	inputLength, .-inputLength
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Now enter the elements of array A separated with spaces or new lines: "
	.section	.rodata.str1.1
.LC4:
	.string	"%ld"
	.text
	.p2align 4
	.globl	inputA
	.type	inputA, @function
inputA:
.LFB40:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xor	eax, eax
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	ebp, esi
	lea	rsi, .LC3[rip]
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	mov	edi, 1
	call	__printf_chk@PLT
	test	ebp, ebp
	jle	.L6
	lea	eax, -1[rbp]
	lea	rbp, .LC4[rip]
	lea	r12, 8[rbx+rax*8]
	.p2align 4,,10
	.p2align 3
.L8:
	mov	rsi, rbx
	mov	rdi, rbp
	xor	eax, eax
	add	rbx, 8
	call	__isoc99_scanf@PLT
	cmp	rbx, r12
	jne	.L8
.L6:
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	inputA, .-inputA
	.p2align 4
	.globl	formatFindMin
	.type	formatFindMin, @function
formatFindMin:
.LFB41:
	.cfi_startproc
	endbr64
	mov	r8, QWORD PTR [rdi]
	cmp	esi, 1
	jle	.L15
	lea	ecx, -2[rsi]
	lea	rax, 8[rdi]
	lea	r9, 16[rdi+rcx*8]
	mov	edi, 1
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L18:
	sete	cl
	add	rax, 8
	movzx	ecx, cl
	add	edi, ecx
	cmp	r9, rax
	je	.L12
.L14:
	mov	rcx, QWORD PTR [rax]
	cmp	r8, rcx
	jle	.L18
	add	rax, 8
	mov	r8, rcx
	mov	edi, 1
	cmp	r9, rax
	jne	.L14
.L12:
	sub	esi, edi
	mov	rax, r8
	mov	DWORD PTR [rdx], esi
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	mov	edi, 1
	mov	rax, r8
	sub	esi, edi
	mov	DWORD PTR [rdx], esi
	ret
	.cfi_endproc
.LFE41:
	.size	formatFindMin, .-formatFindMin
	.p2align 4
	.globl	formatGetB
	.type	formatGetB, @function
formatGetB:
.LFB42:
	.cfi_startproc
	endbr64
	test	edx, edx
	jle	.L19
	lea	eax, -1[rdx]
	xor	edx, edx
	lea	r9, 8[rdi+rax*8]
	.p2align 4,,10
	.p2align 3
.L22:
	mov	rax, QWORD PTR [rdi]
	cmp	rax, rcx
	je	.L21
	movsx	r8, edx
	add	edx, 1
	mov	QWORD PTR [rsi+r8*8], rax
.L21:
	add	rdi, 8
	cmp	rdi, r9
	jne	.L22
.L19:
	ret
	.cfi_endproc
.LFE42:
	.size	formatGetB, .-formatGetB
	.section	.rodata.str1.1
.LC5:
	.string	"This is array B: "
.LC6:
	.string	"%ld "
	.text
	.p2align 4
	.globl	output
	.type	output, @function
output:
.LFB43:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xor	eax, eax
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	ebp, esi
	lea	rsi, .LC5[rip]
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	mov	edi, 1
	call	__printf_chk@PLT
	test	ebp, ebp
	jle	.L24
	lea	eax, -1[rbp]
	lea	rbp, .LC6[rip]
	lea	r12, 8[rbx+rax*8]
	.p2align 4,,10
	.p2align 3
.L26:
	mov	rdx, QWORD PTR [rbx]
	mov	rsi, rbp
	mov	edi, 1
	xor	eax, eax
	add	rbx, 8
	call	__printf_chk@PLT
	cmp	rbx, r12
	jne	.L26
.L24:
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	output, .-output
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"This is randomly generated A: "
	.text
	.p2align 4
	.globl	generateA
	.type	generateA, @function
generateA:
.LFB44:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xor	eax, eax
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	ebp, esi
	lea	rsi, .LC7[rip]
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	mov	edi, 1
	call	__printf_chk@PLT
	test	ebp, ebp
	jle	.L30
	lea	eax, -1[rbp]
	lea	rbp, .LC6[rip]
	lea	r12, 8[rbx+rax*8]
	.p2align 4,,10
	.p2align 3
.L31:
	call	rand@PLT
	add	rbx, 8
	mov	rsi, rbp
	mov	edi, 1
	movsx	rdx, eax
	xor	eax, eax
	mov	QWORD PTR -8[rbx], rdx
	call	__printf_chk@PLT
	cmp	rbx, r12
	jne	.L31
.L30:
	pop	rbx
	.cfi_def_cfa_offset 24
	mov	edi, 10
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT
	.cfi_endproc
.LFE44:
	.size	generateA, .-generateA
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Enter 1 to manually input A, enter 0 to generate A randomly: "
	.section	.rodata.str1.1
.LC9:
	.string	"Wrong value of choice!"
	.text
	.p2align 4
	.globl	pickTypeOfInput
	.type	pickTypeOfInput, @function
pickTypeOfInput:
.LFB45:
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
	ja	.L38
	mov	rdx, QWORD PTR 8[rsp]
	sub	rdx, QWORD PTR fs:40
	jne	.L39
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L38:
	.cfi_restore_state
	mov	edi, 1
	lea	rsi, .LC9[rip]
	xor	eax, eax
	call	__printf_chk@PLT
	mov	edi, 1
	call	exit@PLT
.L39:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE45:
	.size	pickTypeOfInput, .-pickTypeOfInput
	.p2align 4
	.globl	getInputFileContents
	.type	getInputFileContents, @function
getInputFileContents:
.LFB46:
	.cfi_startproc
	endbr64
	test	esi, esi
	jle	.L45
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	lea	eax, -1[rsi]
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	lea	r13, 8[rdi+rax*8]
	lea	r12, .LC4[rip]
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	rbp, rdx
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	rbx, rdi
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L42:
	mov	rdx, rbx
	mov	rsi, r12
	mov	rdi, rbp
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	add	rbx, 8
	cmp	rbx, r13
	jne	.L42
	add	rsp, 8
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
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE46:
	.size	getInputFileContents, .-getInputFileContents
	.p2align 4
	.globl	outputToFile
	.type	outputToFile, @function
outputToFile:
.LFB47:
	.cfi_startproc
	endbr64
	test	esi, esi
	jle	.L53
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	lea	eax, -1[rsi]
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	lea	r13, 8[rdi+rax*8]
	lea	r12, .LC6[rip]
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	mov	rbp, rdx
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	rbx, rdi
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L50:
	mov	rcx, QWORD PTR [rbx]
	mov	rdx, r12
	mov	esi, 1
	mov	rdi, rbp
	xor	eax, eax
	add	rbx, 8
	call	__fprintf_chk@PLT
	cmp	rbx, r13
	jne	.L50
	add	rsp, 8
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
	.p2align 4,,10
	.p2align 3
.L53:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret
	.cfi_endproc
.LFE47:
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

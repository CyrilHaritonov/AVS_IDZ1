	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"hf:r:"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.ascii	"Keys:\n -h or --help to see list of keys and arguments\n -f "
	.ascii	"or --iofiles <input file name>:<output file name> to take in"
	.ascii	"put file c"
	.string	"ontent as A (where first number is the length of A and following are content) and write B to output file\n -r or --random <length> to generate an array A of specified length with random content\nRun without keys to take A content from console standard input."
	.section	.rodata.str1.1
.LC2:
	.string	":"
.LC3:
	.string	"r"
.LC4:
	.string	"Wrong input file name!"
.LC5:
	.string	"w"
.LC6:
	.string	"Wrong output file name!"
.LC7:
	.string	"%d"
.LC8:
	.string	" "
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"\nTime taken to execute this program: %f"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	lea	rcx, longOptions.0[rip]
	lea	rdx, .LC0[rip]
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	lea	r8, -108[rbp]
	push	r13
	push	r12
	push	rbx
	sub	rsp, 72
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -108[rbp], 0
	call	getopt_long@PLT
	cmp	eax, 104
	je	.L2
	cmp	eax, 114
	je	.L3
	cmp	eax, 102
	je	.L49
	lea	rdi, -104[rbp]
	mov	rbx, rsp
	call	inputLength@PLT
	movsx	rax, DWORD PTR -104[rbp]
	mov	rcx, rsp
	mov	rsi, rax
	lea	rax, 15[0+rax*8]
	mov	rdx, rax
	and	rax, -4096
	and	rdx, -16
	sub	rcx, rax
.L21:
	cmp	rsp, rcx
	je	.L22
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L21
.L49:
	mov	rdi, QWORD PTR optarg[rip]
	lea	r13, .LC2[rip]
	mov	rbx, rsp
	mov	rsi, r13
	call	strtok@PLT
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	r12, rax
	test	rax, rax
	je	.L50
	mov	rsi, r13
	xor	edi, edi
	call	strtok@PLT
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	r13, rax
	test	rax, rax
	je	.L51
	lea	rdx, -104[rbp]
	lea	rsi, .LC7[rip]
	mov	rdi, r12
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	movsx	rax, DWORD PTR -104[rbp]
	mov	rcx, rsp
	mov	rsi, rax
	lea	rax, 15[0+rax*8]
	mov	rdx, rax
	and	rax, -4096
	and	rdx, -16
	sub	rcx, rax
.L9:
	cmp	rsp, rcx
	je	.L10
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L9
.L3:
	mov	rdi, QWORD PTR optarg[rip]
	lea	rsi, .LC8[rip]
	mov	r12, rsp
	call	strtok@PLT
	mov	edx, 10
	xor	esi, esi
	mov	rdi, rax
	call	strtol@PLT
	lea	rdi, -96[rbp]
	xor	esi, esi
	mov	rbx, rax
	mov	r13d, eax
	call	gettimeofday@PLT
	movsx	rbx, ebx
	mov	rcx, rsp
	lea	rax, 15[0+rbx*8]
	mov	rdx, rax
	and	rax, -4096
	and	rdx, -16
	sub	rcx, rax
.L15:
	cmp	rsp, rcx
	je	.L16
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L15
.L2:
	lea	rdi, .LC1[rip]
	call	puts@PLT
	lea	rdi, -96[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	lea	rdi, -80[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
.L6:
	mov	rax, QWORD PTR -80[rbp]
	pxor	xmm0, xmm0
	sub	rax, QWORD PTR -96[rbp]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm0, rax
	mov	rax, QWORD PTR -72[rbp]
	sub	rax, QWORD PTR -88[rbp]
	lea	rsi, .LC11[rip]
	mulsd	xmm0, QWORD PTR .LC9[rip]
	cvtsi2sd	xmm1, rax
	mov	edi, 1
	mov	eax, 1
	addsd	xmm0, xmm1
	mulsd	xmm0, QWORD PTR .LC10[rip]
	call	__printf_chk@PLT
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	jne	.L52
	lea	rsp, -40[rbp]
	xor	eax, eax
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L22:
	.cfi_restore_state
	and	edx, 4095
	sub	rsp, rdx
	test	rdx, rdx
	jne	.L53
.L23:
	mov	r12, rsp
	mov	rdi, r12
	call	inputA@PLT
	lea	rdi, -96[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -104[rbp]
	lea	rdx, -100[rbp]
	mov	rdi, r12
	call	formatFindMin@PLT
	movsx	rdx, DWORD PTR -100[rbp]
	mov	rsi, rsp
	lea	rdx, 15[0+rdx*8]
	mov	rcx, rdx
	and	rdx, -4096
	and	rcx, -16
	sub	rsi, rdx
.L24:
	cmp	rsp, rsi
	je	.L25
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L24
.L16:
	and	edx, 4095
	sub	rsp, rdx
	test	rdx, rdx
	jne	.L54
.L17:
	mov	r14, rsp
	mov	esi, r13d
	mov	rdi, r14
	call	generateA@PLT
	lea	rdx, -100[rbp]
	mov	esi, r13d
	mov	rdi, r14
	call	formatFindMin@PLT
	movsx	rdx, DWORD PTR -100[rbp]
	mov	rsi, rsp
	lea	rdx, 15[0+rdx*8]
	mov	rcx, rdx
	and	rdx, -4096
	and	rcx, -16
	sub	rsi, rdx
.L18:
	cmp	rsp, rsi
	je	.L19
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L18
.L10:
	and	edx, 4095
	sub	rsp, rdx
	test	rdx, rdx
	jne	.L55
.L11:
	mov	r14, rsp
	mov	rdx, r12
	mov	rdi, r14
	call	getInputFileContents@PLT
	lea	rdi, -96[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -104[rbp]
	lea	rdx, -100[rbp]
	mov	rdi, r14
	call	formatFindMin@PLT
	movsx	rdx, DWORD PTR -100[rbp]
	mov	rsi, rsp
	lea	rdx, 15[0+rdx*8]
	mov	rcx, rdx
	and	rdx, -4096
	and	rcx, -16
	sub	rsi, rdx
.L12:
	cmp	rsp, rsi
	je	.L13
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L12
.L55:
	or	QWORD PTR -8[rsp+rdx], 0
	jmp	.L11
.L54:
	or	QWORD PTR -8[rsp+rdx], 0
	jmp	.L17
.L53:
	or	QWORD PTR -8[rsp+rdx], 0
	jmp	.L23
.L13:
	and	ecx, 4095
	sub	rsp, rcx
	test	rcx, rcx
	je	.L14
	or	QWORD PTR -8[rsp+rcx], 0
.L14:
	mov	edx, DWORD PTR -104[rbp]
	mov	r15, rsp
	mov	rcx, rax
	mov	rdi, r14
	mov	rsi, r15
	call	formatGetB@PLT
	lea	rdi, -80[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -100[rbp]
	mov	rdx, r13
	mov	rdi, r15
	call	outputToFile@PLT
	mov	rdi, r12
	call	fclose@PLT
	mov	rdi, r13
	call	fclose@PLT
	mov	rsp, rbx
	jmp	.L6
.L19:
	and	ecx, 4095
	sub	rsp, rcx
	test	rcx, rcx
	je	.L20
	or	QWORD PTR -8[rsp+rcx], 0
.L20:
	mov	r15, rsp
	mov	rcx, rax
	mov	edx, r13d
	mov	rdi, r14
	mov	rsi, r15
	call	formatGetB@PLT
	lea	rdi, -80[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -100[rbp]
	mov	rdi, r15
	call	output@PLT
	mov	rsp, r12
	jmp	.L6
.L25:
	and	ecx, 4095
	sub	rsp, rcx
	test	rcx, rcx
	je	.L26
	or	QWORD PTR -8[rsp+rcx], 0
.L26:
	mov	edx, DWORD PTR -104[rbp]
	mov	r13, rsp
	mov	rcx, rax
	mov	rdi, r12
	mov	rsi, r13
	call	formatGetB@PLT
	lea	rdi, -80[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -100[rbp]
	mov	rdi, r13
	call	output@PLT
	mov	rsp, rbx
	jmp	.L6
.L52:
	call	__stack_chk_fail@PLT
.L51:
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L50:
	lea	rdi, .LC4[rip]
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.section	.rodata.str1.1
.LC12:
	.string	"iofiles"
.LC13:
	.string	"help"
.LC14:
	.string	"random"
	.section	.data.rel.local,"aw"
	.align 32
	.type	longOptions.0, @object
	.size	longOptions.0, 96
longOptions.0:
	.quad	.LC12
	.long	1
	.zero	4
	.quad	0
	.long	102
	.zero	4
	.quad	.LC13
	.long	0
	.zero	4
	.quad	0
	.long	104
	.zero	4
	.quad	.LC14
	.long	1
	.zero	4
	.quad	0
	.long	114
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
	.long	0
	.long	1093567616
	.align 8
.LC10:
	.long	-1598689907
	.long	1051772663
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

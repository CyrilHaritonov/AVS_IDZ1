	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"hf:r:"
.LC1:
	.ascii	"Keys:\n -h or --help to see list of keys and arguments\n -f "
	.ascii	"or --iofiles <input file name>:<output file name> to take in"
	.ascii	"put file c"
	.string	"ontent as A (where first number is the length of A and following are content) and write B to output file\n -r or --random <length> to generate an array A of specified length with random content\nRun without keys to take A content from console standard input."
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
.LC11:
	.string	"\nTime taken to execute this program: %f"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB36:
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
	lea	r8, -100[rbp]
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
	mov	DWORD PTR -100[rbp], 0
	call	getopt_long@PLT
	cmp	eax, 104
	je	.L2
	cmp	eax, 114
	je	.L3
	cmp	eax, 102
	lea	r14, -96[rbp]
	jne	.L46
	jmp	.L51
.L2:
	lea	rdi, .LC1[rip]
	call	puts@PLT
	lea	rdi, -88[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	lea	rdi, -72[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	jmp	.L6
.L51:
	mov	rdi, QWORD PTR optarg[rip]
	lea	r13, .LC2[rip]
	mov	rbx, rsp
	mov	rsi, r13
	call	strtok@PLT
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT
	lea	rdi, .LC4[rip]
	mov	r12, rax
	test	rax, rax
	je	.L49
	mov	rsi, r13
	xor	edi, edi
	call	strtok@PLT
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	r13, rax
	test	rax, rax
	jne	.L8
	lea	rdi, .LC6[rip]
.L49:
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L8:
	mov	rdx, r14
	lea	rsi, .LC7[rip]
	mov	rdi, r12
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	movsx	rax, DWORD PTR -96[rbp]
	mov	rcx, rsp
	lea	rdx, 15[0+rax*8]
	mov	rsi, rax
	mov	rax, rdx
	and	rdx, -4096
	and	rax, -16
	sub	rcx, rdx
.L9:
	cmp	rsp, rcx
	je	.L10
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L9
.L10:
	and	eax, 4095
	sub	rsp, rax
	test	rax, rax
	je	.L11
	or	QWORD PTR -8[rsp+rax], 0
.L11:
	mov	r14, rsp
	mov	rdx, r12
	mov	rdi, r14
	call	getInputFileContents@PLT
	lea	rdi, -88[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -96[rbp]
	lea	rdx, -92[rbp]
	mov	rdi, r14
	call	formatFindMin@PLT
	mov	rcx, rax
	movsx	rax, DWORD PTR -92[rbp]
	lea	rsi, 15[0+rax*8]
	mov	rax, rsp
	mov	rdx, rsi
	and	rsi, -4096
	and	rdx, -16
	sub	rax, rsi
.L12:
	cmp	rsp, rax
	je	.L13
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L12
.L13:
	and	edx, 4095
	sub	rsp, rdx
	test	rdx, rdx
	je	.L14
	or	QWORD PTR -8[rsp+rdx], 0
.L14:
	mov	edx, DWORD PTR -96[rbp]
	mov	r15, rsp
	mov	rdi, r14
	mov	rsi, r15
	call	formatGetB@PLT
	lea	rdi, -72[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -92[rbp]
	mov	rdx, r13
	mov	rdi, r15
	call	outputToFile@PLT
	mov	rdi, r12
	call	fclose@PLT
	mov	rdi, r13
	call	fclose@PLT
	jmp	.L48
.L3:
	mov	rdi, QWORD PTR optarg[rip]
	lea	rsi, .LC8[rip]
	mov	r12, rsp
	call	strtok@PLT
	mov	edx, 10
	xor	esi, esi
	mov	rdi, rax
	call	strtol@PLT
	lea	rdi, -88[rbp]
	xor	esi, esi
	mov	rbx, rax
	mov	r13d, eax
	call	gettimeofday@PLT
	movsx	rbx, ebx
	mov	rcx, rsp
	lea	rdx, 15[0+rbx*8]
	mov	rax, rdx
	and	rdx, -4096
	and	rax, -16
	sub	rcx, rdx
.L15:
	cmp	rsp, rcx
	je	.L16
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L15
.L16:
	and	eax, 4095
	sub	rsp, rax
	test	rax, rax
	je	.L17
	or	QWORD PTR -8[rsp+rax], 0
.L17:
	mov	r14, rsp
	mov	esi, r13d
	mov	rdi, r14
	call	generateA@PLT
	lea	rdx, -92[rbp]
	mov	esi, r13d
	mov	rdi, r14
	call	formatFindMin@PLT
	mov	rcx, rax
	movsx	rax, DWORD PTR -92[rbp]
	lea	rsi, 15[0+rax*8]
	mov	rax, rsp
	mov	rdx, rsi
	and	rsi, -4096
	and	rdx, -16
	sub	rax, rsi
.L18:
	cmp	rsp, rax
	je	.L19
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L18
.L19:
	and	edx, 4095
	sub	rsp, rdx
	test	rdx, rdx
	je	.L20
	or	QWORD PTR -8[rsp+rdx], 0
.L20:
	mov	r15, rsp
	mov	edx, r13d
	mov	rdi, r14
	mov	rsi, r15
	call	formatGetB@PLT
	lea	rdi, -72[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -92[rbp]
	mov	rdi, r15
	call	output@PLT
	mov	rsp, r12
	jmp	.L6
.L46:
	mov	rdi, r14
	mov	rbx, rsp
	call	inputLength@PLT
	movsx	rax, DWORD PTR -96[rbp]
	mov	rcx, rsp
	lea	rdx, 15[0+rax*8]
	mov	rsi, rax
	mov	rax, rdx
	and	rdx, -4096
	and	rax, -16
	sub	rcx, rdx
.L21:
	cmp	rsp, rcx
	je	.L22
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L21
.L22:
	and	eax, 4095
	sub	rsp, rax
	test	rax, rax
	je	.L23
	or	QWORD PTR -8[rsp+rax], 0
.L23:
	mov	r12, rsp
	mov	rdi, r12
	call	inputA@PLT
	lea	rdi, -88[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -96[rbp]
	lea	rdx, -92[rbp]
	mov	rdi, r12
	call	formatFindMin@PLT
	mov	rcx, rax
	movsx	rax, DWORD PTR -92[rbp]
	lea	rsi, 15[0+rax*8]
	mov	rax, rsp
	mov	rdx, rsi
	and	rsi, -4096
	and	rdx, -16
	sub	rax, rsi
.L24:
	cmp	rsp, rax
	je	.L25
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L24
.L25:
	and	edx, 4095
	sub	rsp, rdx
	test	rdx, rdx
	je	.L26
	or	QWORD PTR -8[rsp+rdx], 0
.L26:
	mov	edx, DWORD PTR -96[rbp]
	mov	r13, rsp
	mov	rdi, r12
	mov	rsi, r13
	call	formatGetB@PLT
	lea	rdi, -72[rbp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	esi, DWORD PTR -92[rbp]
	mov	rdi, r13
	call	output@PLT
.L48:
	mov	rsp, rbx
.L6:
	mov	rax, QWORD PTR -72[rbp]
	sub	rax, QWORD PTR -88[rbp]
	lea	rsi, .LC11[rip]
	mov	edi, 1
	cvtsi2sd	xmm0, rax
	mov	rax, QWORD PTR -64[rbp]
	mulsd	xmm0, QWORD PTR .LC9[rip]
	sub	rax, QWORD PTR -80[rbp]
	cvtsi2sd	xmm1, rax
	mov	al, 1
	addsd	xmm0, xmm1
	mulsd	xmm0, QWORD PTR .LC10[rip]
	call	__printf_chk@PLT
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	lea	rsp, -40[rbp]
	xor	eax, eax
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
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

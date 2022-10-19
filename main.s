	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"hf:r:"
	.align 8
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
	.align 8
.LC11:
	.string	"\nTime taken to execute this program: %f"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 408
	mov	DWORD PTR -276[rbp], edi
	mov	QWORD PTR -288[rbp], rsi
	mov	DWORD PTR -244[rbp], 0
	lea	rax, -244[rbp]
	mov	rsi, QWORD PTR -288[rbp]
	mov	edi, DWORD PTR -276[rbp]
	mov	r8, rax
	lea	rax, longOptions.0[rip]
	mov	rcx, rax
	lea	rax, .LC0[rip]
	mov	rdx, rax
	call	getopt_long@PLT
	mov	DWORD PTR -52[rbp], eax
	cmp	DWORD PTR -52[rbp], 114
	je	.L2
	cmp	DWORD PTR -52[rbp], 114
	jg	.L3
	cmp	DWORD PTR -52[rbp], 102
	je	.L4
	cmp	DWORD PTR -52[rbp], 104
	jne	.L3
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -224[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	lea	rax, -240[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	jmp	.L5
.L4:
	mov	rax, rsp
	mov	rbx, rax
	mov	rax, QWORD PTR optarg[rip]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strtok@PLT
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -112[rbp], rax
	cmp	QWORD PTR -112[rbp], 0
	jne	.L6
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L6:
	lea	rax, .LC2[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -120[rbp], rax
	cmp	QWORD PTR -120[rbp], 0
	jne	.L7
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L7:
	lea	rdx, -248[rbp]
	mov	rax, QWORD PTR -112[rbp]
	lea	rcx, .LC7[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -248[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -128[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -304[rbp], rdx
	mov	QWORD PTR -296[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -320[rbp], rdx
	mov	QWORD PTR -312[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L8:
	cmp	rsp, rdx
	je	.L9
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L8
.L9:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L10
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L10:
	mov	rax, rsp
	add	rax, 7
	shr	rax, 3
	sal	rax, 3
	mov	QWORD PTR -136[rbp], rax
	mov	ecx, DWORD PTR -248[rbp]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rax, QWORD PTR -136[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	getInputFileContents@PLT
	lea	rax, -224[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	mov	ecx, DWORD PTR -248[rbp]
	lea	rdx, -252[rbp]
	mov	rax, QWORD PTR -136[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	formatFindMin@PLT
	mov	QWORD PTR -144[rbp], rax
	mov	eax, DWORD PTR -252[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -152[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -336[rbp], rdx
	mov	QWORD PTR -328[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -352[rbp], rdx
	mov	QWORD PTR -344[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L11:
	cmp	rsp, rdx
	je	.L12
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L11
.L12:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L13
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L13:
	mov	rax, rsp
	add	rax, 7
	shr	rax, 3
	sal	rax, 3
	mov	QWORD PTR -160[rbp], rax
	mov	edx, DWORD PTR -248[rbp]
	mov	rcx, QWORD PTR -144[rbp]
	mov	rsi, QWORD PTR -160[rbp]
	mov	rax, QWORD PTR -136[rbp]
	mov	rdi, rax
	call	formatGetB@PLT
	lea	rax, -240[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	mov	ecx, DWORD PTR -252[rbp]
	mov	rdx, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -160[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	outputToFile@PLT
	mov	rax, QWORD PTR -112[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -120[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	mov	rsp, rbx
	jmp	.L5
.L2:
	mov	rax, rsp
	mov	rbx, rax
	mov	rax, QWORD PTR optarg[rip]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strtok@PLT
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT
	mov	DWORD PTR -56[rbp], eax
	lea	rax, -224[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	mov	eax, DWORD PTR -56[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -64[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -368[rbp], rdx
	mov	QWORD PTR -360[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -384[rbp], rdx
	mov	QWORD PTR -376[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	edi, 16
	mov	edx, 0
	div	rdi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L14:
	cmp	rsp, rdx
	je	.L15
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L14
.L15:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L16
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L16:
	mov	rax, rsp
	add	rax, 7
	shr	rax, 3
	sal	rax, 3
	mov	QWORD PTR -72[rbp], rax
	mov	edx, DWORD PTR -56[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	generateA@PLT
	lea	rdx, -256[rbp]
	mov	ecx, DWORD PTR -56[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	formatFindMin@PLT
	mov	QWORD PTR -80[rbp], rax
	mov	eax, DWORD PTR -256[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L17:
	cmp	rsp, rdx
	je	.L18
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L17
.L18:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L19
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L19:
	mov	rax, rsp
	add	rax, 7
	shr	rax, 3
	sal	rax, 3
	mov	QWORD PTR -96[rbp], rax
	mov	rcx, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR -56[rbp]
	mov	rsi, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	formatGetB@PLT
	lea	rax, -240[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	mov	edx, DWORD PTR -256[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	output@PLT
	nop
	mov	rsp, rbx
	jmp	.L5
.L3:
	mov	rax, rsp
	mov	rbx, rax
	lea	rax, -260[rbp]
	mov	rdi, rax
	call	inputLength@PLT
	mov	eax, DWORD PTR -260[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -168[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -400[rbp], rdx
	mov	QWORD PTR -392[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -416[rbp], rdx
	mov	QWORD PTR -408[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	edi, 16
	mov	edx, 0
	div	rdi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L20:
	cmp	rsp, rdx
	je	.L21
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L20
.L21:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L22
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L22:
	mov	rax, rsp
	add	rax, 7
	shr	rax, 3
	sal	rax, 3
	mov	QWORD PTR -176[rbp], rax
	mov	edx, DWORD PTR -260[rbp]
	mov	rax, QWORD PTR -176[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	inputA@PLT
	lea	rax, -224[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	mov	ecx, DWORD PTR -260[rbp]
	lea	rdx, -264[rbp]
	mov	rax, QWORD PTR -176[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	formatFindMin@PLT
	mov	QWORD PTR -184[rbp], rax
	mov	eax, DWORD PTR -264[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -192[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -432[rbp], rdx
	mov	QWORD PTR -424[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -448[rbp], rdx
	mov	QWORD PTR -440[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L23:
	cmp	rsp, rdx
	je	.L24
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L23
.L24:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L25
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L25:
	mov	rax, rsp
	add	rax, 7
	shr	rax, 3
	sal	rax, 3
	mov	QWORD PTR -200[rbp], rax
	mov	edx, DWORD PTR -260[rbp]
	mov	rcx, QWORD PTR -184[rbp]
	mov	rsi, QWORD PTR -200[rbp]
	mov	rax, QWORD PTR -176[rbp]
	mov	rdi, rax
	call	formatGetB@PLT
	lea	rax, -240[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	mov	edx, DWORD PTR -264[rbp]
	mov	rax, QWORD PTR -200[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	output@PLT
	nop
	mov	rsp, rbx
.L5:
	mov	rax, QWORD PTR -240[rbp]
	mov	rdx, QWORD PTR -224[rbp]
	sub	rax, rdx
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	movsd	xmm0, QWORD PTR .LC9[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -208[rbp], xmm0
	mov	rax, QWORD PTR -232[rbp]
	mov	rdx, QWORD PTR -216[rbp]
	sub	rax, rdx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -208[rbp]
	movsd	xmm0, QWORD PTR .LC10[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -208[rbp], xmm0
	mov	rax, QWORD PTR -208[rbp]
	movq	xmm0, rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
	.section	.rodata
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
	.section	.rodata
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

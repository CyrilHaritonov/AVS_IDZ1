	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Enter the length of A: "# строка для printf в inputLength
.LC1:
	.string	"%d"# строка для scanf в inputLength
.LC2:
	.string	"Unacceptable length value!"# строка для printf в inputLength
	.text
	.globl	inputLength
	.type	inputLength, @function
inputLength:# объявляем void inputLength(int *n)
	push	rbp
	mov	rbp, rsp#пролог
	sub	rsp, 16# выделяем память на стеке
	mov	QWORD PTR -8[rbp], rdi# кладем аргумент на стек [rbp-8] = n
	lea	rdi, .LC0[rip]# берем указатель на строку и кладем его в rdi который будет аргументом при вызове printf
	mov	eax, 0
	call	printf@PLT# вызываем printf
	mov	rsi, QWORD PTR -8[rbp]# rsi = n
	lea	rdi, .LC1[rip]# rdi = указатель на форматную строку для scanf
	mov	eax, 0
	call	__isoc99_scanf@PLT# вызываем scanf
	mov	rax, QWORD PTR -8[rbp]# rax = n
	mov	eax, DWORD PTR [rax]# eax = *n (разименовываем)
	test	eax, eax# сравниваем *n и 0
	jg	.L3# если 0 больше то прыгаем на метку
	lea	rdi, .LC2[rip]# rdi = указатель на строку для printf
	mov	eax, 0
	call	printf@PLT# вызываем printf
	mov	edi, 1# аргумент для exit
	call	exit@PLT# вызываем exit
.L3:# если (*n <= 0) не true
	leave# эпилог
	ret# возвращаемся
	.size	inputLength, .-inputLength
	.section	.rodata
	.align 8
.LC3:
	.string	"Now enter the elements of array A separated with spaces or new lines: "# строка для printf
.LC4:
	.string	"%ld"# строка для scanf
	.text
	.globl	inputA
	.type	inputA, @function
inputA:# объявляем void inputA(long *A, int n)
	push	rbp
	mov	rbp, rsp# пролог
	sub	rsp, 32# выделяем память на стеке
	mov	QWORD PTR -24[rbp], rdi# сохраняем аргументы на стек [rbp - 24] = A
	mov	DWORD PTR -28[rbp], esi# [rbp - 28] = n
	lea	rdi, .LC3[rip]# берем указатель на строку
	mov	eax, 0
	call	printf@PLT# вызываем printf
	mov	r12, 0# r12 = 0 (это int i)
	jmp	.L5# прыгаем к сравнению
.L6:
	lea	rdx, 0[0+r12*8]# rdx = offset текущего элемента относительно начала A
	mov	rax, QWORD PTR -24[rbp]# rax = A
	add	rax, rdx# rax = &A[i]
	mov rsi, rax
	lea	rdi, .LC4[rip]# rdi = адрес строки для scanf
	mov	eax, 0
	call	__isoc99_scanf@PLT# вызываем scanf
	add	r12, 1# ++i
.L5:
	cmp	r12d, DWORD PTR -28[rbp]# сравниваем i и n
	jl	.L6# если i < n то прыгаем в тело цикла
	leave# эпилог
	ret
	.size	inputA, .-inputA
	.globl	formatFindMin
	.type	formatFindMin, @function
formatFindMin:# объявляем long formatFindMin(const long *A, int n, int *new_n)
	push	rbp
	mov	rbp, rsp# пролог
	mov	QWORD PTR -24[rbp], rdi# [rbp - 24] = A
	mov	DWORD PTR -28[rbp], esi# [rbp - 28] = n
	mov	QWORD PTR -40[rbp], rdx# [rbp-40] = new_n
	mov	rax, QWORD PTR -24[rbp]# rax = A
	mov	rax, QWORD PTR [rax]# rax = *A
	mov	r13, rax # minimum = A[0]
	mov	r14, 1# amount = 1
	mov	r12, 1# i = 1
	jmp	.L8# к сравнению
.L11:# тело цикла for
	lea	rdx, 0[0+r12*8]# offset текущего элемента A
	mov	rax, QWORD PTR -24[rbp]# rax =  A
	add	rax, rdx
	mov	rax, QWORD PTR [rax]# rax = *A
	cmp	r13, rax# сравниваем minimum и A[i]
	jle	.L9# если minimum <= A[i] то прыгаем
	lea	rdx, 0[0+r12*8]# offset для текущего элемента A
	mov	rax, QWORD PTR -24[rbp]# rax = A
	add	rax, rdx
	mov	rax, QWORD PTR [rax]# rax = *A
	mov	r13, rax# minimum = A[i]
	mov	r14, 1# amount = 1
	jmp	.L10
.L9:
	lea	rdx, 0[0+r12*8]# offset для текущего элемента A
	mov	rax, QWORD PTR -24[rbp]# rax = A
	add	rax, rdx
	mov	rax, QWORD PTR [rax]# rax = *A
	cmp	r13, rax# сравниваем minimum и A[i]
	jne	.L10
	add	r14, 1# amount++
.L10:
	add	r12, 1# ++i
.L8:
	cmp	r12d, DWORD PTR -28[rbp]# сравниваем i и n
	jl	.L11# если i < n прыгаем в тело цикла
	mov	eax, DWORD PTR -28[rbp]# eax = n
	sub	eax, r14d# eax -= amount
	mov	edx, eax
	mov	rax, QWORD PTR -40[rbp]# rax = new_n
	mov	DWORD PTR [rax], edx# *new_n = edx
	mov	rax, r13# rax = minimum
	pop	rbp# эпилог
	ret
	.size	formatFindMin, .-formatFindMin
	.globl	formatGetB
	.type	formatGetB, @function
formatGetB:# объявляем void formatGetB(const long *A, long *B, int n, long minimum)
	push	rbp
	mov	rbp, rsp# пролог
	mov	QWORD PTR -24[rbp], rdi# [rbp - 24] = A
	mov	QWORD PTR -32[rbp], rsi# [rbp - 32] = B
	mov	DWORD PTR -36[rbp], edx# [rbp - 36] = n
	mov	QWORD PTR -48[rbp], rcx# [rbp - 48] = minimum
	mov	r13, 0# j = 0
	mov	r12, 0# i = 0
	jmp	.L14# прыгаем к сравнению
.L16:
	lea	rdx, 0[0+r12*8]# offset для текущего элемента A
	mov	rax, QWORD PTR -24[rbp]# rax = A
	add	rax, rdx# rax = &A[i]
	mov	rax, QWORD PTR [rax]# rax = A[i]
	cmp	QWORD PTR -48[rbp], rax# сравниваем minimum и A[i]
	je	.L15# если равны то прыгаем
	lea	rdx, 0[0+r12*8]# offset для текущего элемента A
	mov	rax, QWORD PTR -24[rbp]# rax = A
	lea	rcx, [rdx+rax]# rcx = &A[i]
	mov	eax, r13d# eax = j
	lea	edx, 1[rax]# edx = j + 1
	movsx	r13d, edx# j = j + 1
	cdqe
	lea	rdx, 0[0+rax*8]# offset для текущего элемента B
	mov	rax, QWORD PTR -32[rbp]# rax = B
	add	rdx, rax# rdx = B[j + 1]
	mov	rax, QWORD PTR [rcx]# rax = A[i]
	mov	QWORD PTR [rdx], rax# B[j + 1] = A[i]
.L15:
	add	r12, 1# ++i
.L14:
	cmp	r12d, DWORD PTR -36[rbp]# сравниваем i и n
	jl	.L16# если i < n то прыгаем в тело цикла
	pop	rbp# эпилог
	ret
	.size	formatGetB, .-formatGetB
	.section	.rodata
.LC5:
	.string	"This is array B: "# строка для printf
.LC6:
	.string	"%ld "# строка для printf
	.text
	.globl	output
	.type	output, @function
output:# объявляем void output(long *B, int n)
	push	rbp# пролог
	mov	rbp, rsp
	sub	rsp, 32# выделяем память на стеке
	mov	QWORD PTR -24[rbp], rdi# [rbp - 24] = B
	mov	DWORD PTR -28[rbp], esi# [rbp - 28] = n
	lea	rdi, .LC5[rip]# rdi = указатель на строку
	mov	eax, 0
	call	printf@PLT# вызываем printf
	mov	r12, 0# i = 0
	jmp	.L18# прыгаем к условию цикла
.L19:
	mov	eax, r12d# eax = i
	cdqe
	lea	rdx, 0[0+rax*8]# offset для текущего элемента B
	mov	rax, QWORD PTR -24[rbp]# rax = B
	add	rax, rdx
	mov	rsi, QWORD PTR [rax]# rsi = *rax
	lea	rdi, .LC6[rip]# rdi = указатель на строку
	mov	eax, 0
	call	printf@PLT# вызываем printf
	add	r12, 1# ++i
.L18:
	cmp	r12d, DWORD PTR -28[rbp]# сравниваем i и n
	jl	.L19# если i < n то прыгаем
	leave# эпилог
	ret
	.size	output, .-output
	.section	.rodata
	.align 8
.LC7:
	.string	"This is randomly generated A: "# строка для printf
	.text
	.globl	generateA
	.type	generateA, @function
generateA:# объявляем void generateA(long *A, int n)
	push	rbp
	mov	rbp, rsp# пролог
	sub	rsp, 32# выделяем память на стеке
	mov	QWORD PTR -24[rbp], rdi# [rbp - 24] = A
	mov	DWORD PTR -28[rbp], esi# [rbp - 28] = n
	lea	rdi, .LC7[rip]# rdi = указатель на строку
	mov	eax, 0
	call	printf@PLT# вызываем printf
	mov	r12, 0# i = 0
	jmp	.L21# прыгаем к сравнению
.L22:
	call	rand@PLT# вызываем rand
	mov	edx, r12d# edx = i
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*8]# offset для текущего A[i]
	mov	rdx, QWORD PTR -24[rbp]# rdx = A
	add	rdx, rcx# rdx = &A[i]
	cdqe
	mov	QWORD PTR [rdx], rax# A[i] = rand()
	mov	eax, r12d# eax = i
	cdqe
	lea	rdx, 0[0+rax*8]# offset для текущего A[i]
	mov	rax, QWORD PTR -24[rbp]# rax = A
	add	rax, rdx# rax = &A[i]
	mov	rsi, QWORD PTR [rax]# rsi = A[i]
	lea	rdi, .LC6[rip]# rdi = указатель на строку
	mov	eax, 0
	call	printf@PLT# вызываем printf
	add	r12, 1# ++i
.L21:
	cmp	r12d, DWORD PTR -28[rbp]# сравниваем i и n
	jl	.L22# если i < n то прыгаем
	mov	edi, 10# edi = '\n'
	call	putchar@PLT# вызываем putchar
	leave
	ret
	.size	generateA, .-generateA
	.section	.rodata
	.align 8
.LC8:
	.string	"Enter 1 to manually input A, enter 0 to generate A randomly: "# строка для printf
.LC9:
	.string	"Wrong value of choice!"# строка для printf
	.text
	.globl	pickTypeOfInput
	.type	pickTypeOfInput, @function
pickTypeOfInput:# объявление int pickTypeOfInput()
	push	rbp
	mov	rbp, rsp# пролог
	sub	rsp, 16# выделение памяти на стеке
	lea	rdi, .LC8[rip]# rdi = указатель на строку
	mov	eax, 0
	call	printf@PLT# вызов printf
	lea	rsi, [r12]# rsi = &choice
	lea	rdi, .LC1[rip]# rax = указатель на строку
	mov	eax, 0
	call	__isoc99_scanf@PLT# вызываем scanf
	mov	eax, r12d# eax = choice
	cmp	eax, 1# сравниваем choice и 1
	je	.L24# если choice == 1, то прыгаем
	mov	eax, r12d#  eax = choice
	test	eax, eax# проверяем равно ли choice нулю
	je	.L24# если да то прыгаем
	lea	rdi, .LC9[rip]# rdi = указатель на строку
	mov	eax, 0
	call	printf@PLT# вызываем printf
	mov	edi, 1# edi = 1
	call	exit@PLT# вызываем exit
.L24:
	mov	eax, r12d# eax = choice
	leave# эпилог
	ret
	.size	pickTypeOfInput, .-pickTypeOfInput
	.globl	getInputFileContents
	.type	getInputFileContents, @function
getInputFileContents:# объявляем void getInputFileContents(long *A, int n, FILE *file_name)
	push	rbp
	mov	rbp, rsp# пролог
	sub	rsp, 48# выделяем память на стеке
	mov	QWORD PTR -24[rbp], rdi# [rbp - 24] = A
	mov	DWORD PTR -28[rbp], esi# [rbp - 28] = n
	mov	QWORD PTR -40[rbp], rdx# [rbp - 40] = file_name
	mov	r12, 0# i = 0
	jmp	.L27# прыгаем к сравнению
.L28:
	mov	eax, r12d# eax = i
	cdqe
	lea	rdx, 0[0+rax*8]# offset для текущего A[i]
	mov	rax, QWORD PTR -24[rbp]# rax = A
	add	rdx, rax# rdx = &A[i]
	mov	rdi, QWORD PTR -40[rbp]# rdi = file_name
	lea	rsi, .LC4[rip]# rsi = указатель на строку
	mov	eax, 0
	call	__isoc99_fscanf@PLT# вызываем scanf
	add r12, 1# i + 1
.L27:
	cmp	r12d, DWORD PTR -28[rbp]# сравниваем i и n
	jl	.L28# если i < n то прыгаем
	leave# эпилог
	ret
	.size	getInputFileContents, .-getInputFileContents
	.globl	outputToFile
	.type	outputToFile, @function
outputToFile:# void outputToFile(long *B, int n, FILE *file_name)
	push	rbp
	mov	rbp, rsp# пролог
	sub	rsp, 48# выделяем память на стеке
	mov	QWORD PTR -24[rbp], rdi# [rbp - 24] = B
	mov	DWORD PTR -28[rbp], esi# [rbp - 28] = n
	mov	QWORD PTR -40[rbp], rdx# [rbp - 40] = file_name
	mov	r12, 0# i = 0
	jmp	.L30# прыгаем к сравнению
.L31:
	mov	eax, r12d# eax = i
	cdqe
	lea	rdx, 0[0+rax*8]# offset для текущего B[i]
	mov	rax, QWORD PTR -24[rbp]# rax = B
	add	rax, rdx# rax = &B[i]
	mov	rdx, QWORD PTR [rax]# rdx = B[i]
	mov	rdi, QWORD PTR -40[rbp]# rdi = file_name
	lea	rsi, .LC6[rip]# rsi = указатель на строку
	mov	eax, 0
	call	fprintf@PLT# вызываем fprintf
	add	r12, 1# ++i
.L30:
	cmp	r12d, DWORD PTR -28[rbp]# сравниваем i и n
	jl	.L31# если i < n то прыгаем
	leave
	ret
	.size	outputToFile, .-outputToFile

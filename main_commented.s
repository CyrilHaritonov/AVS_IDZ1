	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"hf:r:"# строка с аргументами командной строки
	.align 8
.LC1:
	.ascii	"Keys:\n -h or --help to see list of keys and arguments\n -f "# строки для printf при ключе -h
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
main:# объявляем функцию int main(int argc, char *argv[])
	push	rbp
	mov	rbp, rsp# пролог
	push	r15# сохраняем регистры в соответствии с конценцией вызывов
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 408# выделяем память на стеке
	mov	DWORD PTR -276[rbp], edi# [rbp - 276] = argc
	mov	QWORD PTR -288[rbp], rsi# [rbp - 288] = argv
	mov	DWORD PTR -244[rbp], 0# optionIndex = 0
	lea	r8, -244[rbp]# r8 = optionIndex
	mov	rsi, QWORD PTR -288[rbp]# rsi = argv
	mov	edi, DWORD PTR -276[rbp]# edi = argc
	lea	rcx, longOptions.0[rip]# rcx = longOptions
	lea	rdx, .LC0[rip]# rdx = указатель на строку
	call	getopt_long@PLT# вызываем getopt_long
	mov	DWORD PTR -52[rbp], eax# arg = getopt_long()
	cmp	DWORD PTR -52[rbp], 114# сравниваем arg и 'r'
	je	.L2 # если arg == 'r' прыгаем
	cmp	DWORD PTR -52[rbp], 114# сравниваем arg и 'r'
	jg	.L3 # если arg > 'r' прыгаем
	cmp	DWORD PTR -52[rbp], 102# сравниваем arg и 'f'
	je	.L4 # если arg == 'f' прыгаем
	cmp	DWORD PTR -52[rbp], 104# сравниваем arg и 'h'
	jne	.L3 # если arg != 'h' прыгаем
	lea	rdi, .LC1[rip]# rdi = указатель на строку
	call	puts@PLT # вызываем puts
	lea	rdi, -224[rbp]#  rdi  = &start
	mov	esi, 0 # esi = NULL
	call	gettimeofday@PLT # вызываем gettimeofday
	lea	rdi, -240[rbp] # rdi = &end
	mov	esi, 0 # esi = NULL
	call	gettimeofday@PLT # вызываем gettimeofday
	jmp	.L5 # break из switch
.L4:
	mov	rbx, rsp # rbx = rsp
	mov	rdi, QWORD PTR optarg[rip] # rdi = optarg
	lea	rsi, .LC2[rip] # rsi = указатель на строку
	call	strtok@PLT # вызвыаем strtok
	mov	QWORD PTR -104[rbp], rax # file_name = strtok()
	mov	rdi, QWORD PTR -104[rbp] # rdi = file_name
	lea	rsi, .LC3[rip] # rsi = указатель на строку
	call	fopen@PLT # вызываем fopen
	mov	QWORD PTR -112[rbp], rax # file_input = fopen()
	cmp	QWORD PTR -112[rbp], 0 # проверяем валидный ли file_input
	jne	.L6 # если валидный то прыгаем
	lea	rdi, .LC4[rip] # rdi = указатель на строку
	call	puts@PLT # вызываем  puts
	mov	edi, 1 # edi = 1
	call	exit@PLT # вызываем puts
.L6:
	lea	rsi, .LC2[rip] # rsi = указатель на строку
	mov	edi, 0 # edi = NULL
	call	strtok@PLT # вызываем  strtok
	mov	QWORD PTR -104[rbp], rax # file_name = strtok()
	mov	rdi, QWORD PTR -104[rbp] # rdi = file_name
	lea	rsi, .LC5[rip] # rdx = указатель на строку
	call	fopen@PLT  # вызываем fopen
	mov	QWORD PTR -120[rbp], rax # file_output = fopen()
	cmp	QWORD PTR -120[rbp], 0 # проверяю валидность file_output
	jne	.L7 # если валидный то прыгаю
	lea	rdi, .LC6[rip] # rdi = указатель на строку
	call	puts@PLT # вызвыаем puts
	mov	edi, 1 # edi = 1
	call	exit@PLT # вызываем exit
.L7:
	lea	rdx, -248[rbp] # rdx = &n
	mov	rdi, QWORD PTR -112[rbp] # rdi = file_input
	lea	rsi, .LC7[rip] # rsi = указатель на строку
	mov	eax, 0
	call	__isoc99_fscanf@PLT # вызываем fscanf
	mov	eax, DWORD PTR -248[rbp]  # /
	movsx	rdx, eax              # |
	sub	rdx, 1                    # |
	mov	QWORD PTR -128[rbp], rdx  # |
	movsx	rdx, eax              # |
	mov	QWORD PTR -304[rbp], rdx  # |
	mov	QWORD PTR -296[rbp], 0    # |
	movsx	rdx, eax              # |
	mov	QWORD PTR -320[rbp], rdx  # |
	mov	QWORD PTR -312[rbp], 0    # |
	cdqe                          # |  создаем массив long A[n]
	lea	rdx, 0[0+rax*8]           # |
	mov	eax, 16                   # |
	sub	rax, 1                    # |
	add	rax, rdx                  # |
	mov	esi, 16                   # |
	mov	edx, 0                    # |
	div	rsi                       # |
	imul	rax, rax, 16          # |
	mov	rcx, rax                  # |
	and	rcx, -4096                # |
	mov	rdx, rsp                  # |
	sub	rdx, rcx                  # |
.L8:                              # |
	cmp	rsp, rdx                  # |
	je	.L9                       # |
	sub	rsp, 4096                 # |
	or	QWORD PTR 4088[rsp], 0    # |
	jmp	.L8                       # |
.L9:                              # |
	mov	rdx, rax                  # |
	and	edx, 4095                 # |
	sub	rsp, rdx                  # |
	mov	rdx, rax                  # |
	and	edx, 4095                 # |
	test	rdx, rdx              # |
	je	.L10                      # |
	and	eax, 4095                 # |
	sub	rax, 8                    # |
	add	rax, rsp                  # |
	or	QWORD PTR [rax], 0        # |
.L10:                             # |
	mov	rax, rsp # rax = rsp      # |
	add	rax, 7                    # |
	shr	rax, 3                    # |
	sal	rax, 3                    # |
	mov	QWORD PTR -136[rbp], rax  # \ [rbp - 136] = A
	mov	esi, DWORD PTR -248[rbp]  # esi = n
	mov	rdx, QWORD PTR -112[rbp]  # rdx = file_input
	mov	rdi, QWORD PTR -136[rbp]  # rdi = A
	call	getInputFileContents@PLT # вызываем getInputFileContents
	lea	rdi, -224[rbp] # rdi = &start
	mov	esi, 0 # esi = NULL
	call	gettimeofday@PLT # вызываем gettimeofday
	mov	esi, DWORD PTR -248[rbp] # esi = n
	lea	rdx, -252[rbp] # rdx = &new_n
	mov	rdi, QWORD PTR -136[rbp] # rdi =  A
	call	formatFindMin@PLT # вызываем formatFindMin
	mov	QWORD PTR -144[rbp], rax # min = formatFindMin()
	mov	eax, DWORD PTR -252[rbp] # eax = new_n
	movsx	rdx, eax             # /
	sub	rdx, 1                   # |
	mov	QWORD PTR -152[rbp], rdx # |
	movsx	rdx, eax             # |
	mov	QWORD PTR -336[rbp], rdx # |
	mov	QWORD PTR -328[rbp], 0   # |
	movsx	rdx, eax             # |
	mov	QWORD PTR -352[rbp], rdx # |
	mov	QWORD PTR -344[rbp], 0   # |
	cdqe                         # |
	lea	rdx, 0[0+rax*8]          # |
	mov	eax, 16                  # |
	sub	rax, 1                   # |
	add	rax, rdx                 # |
	mov	esi, 16                  # |
	mov	edx, 0                   # |
	div	rsi                      # |
	imul	rax, rax, 16         # |
	mov	rcx, rax                 # |
	and	rcx, -4096               # | создаем массив long B[new_n]
	mov	rdx, rsp                 # |
	sub	rdx, rcx                 # |
.L11:                            # |
	cmp	rsp, rdx                 # |
	je	.L12                     # |
	sub	rsp, 4096                # |
	or	QWORD PTR 4088[rsp], 0   # |
	jmp	.L11                     # |
.L12:                            # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	sub	rsp, rdx                 # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	test	rdx, rdx             # |
	je	.L13                     # |
	and	eax, 4095                # |
	sub	rax, 8                   # |
	add	rax, rsp                 # |
	or	QWORD PTR [rax], 0       # |
.L13:                            # |
	mov	rax, rsp                 # |
	add	rax, 7                   # |
	shr	rax, 3                   # |
	sal	rax, 3                   # |
	mov	QWORD PTR -160[rbp], rax # \ [rbp - 160] = B
	mov	edx, DWORD PTR -248[rbp] # edx = n
	mov	rcx, QWORD PTR -144[rbp] # rcx = min
	mov	rsi, QWORD PTR -160[rbp] # rsi = B
	mov	rdi, QWORD PTR -136[rbp] # rdi = A
	call	formatGetB@PLT # вызываем formatGetB
	lea	rdi, -240[rbp] # rdi =  &end
	mov	esi, 0 # esi = NULL
	call	gettimeofday@PLT # вызываем gettimeofday
	mov	esi, DWORD PTR -252[rbp] # esi =  new_n
	mov	rdx, QWORD PTR -120[rbp] # rdx = file_output
	mov	rdi, QWORD PTR -160[rbp] # rdi = B
	call	outputToFile@PLT # вызываем outputToFile
	mov	rdi, QWORD PTR -112[rbp] # rdi = file_input
	call	fclose@PLT # вызвыаем fclose
	mov	rdi, QWORD PTR -120[rbp] # rdi = file_output
	call	fclose@PLT # вызываем flose
	mov	rsp, rbx # восстанавливаем rsp
	jmp	.L5 # break из switch
.L2:
	mov	rbx, rsp # сохраняем rsp
	mov	rdi, QWORD PTR optarg[rip] # rdi = optarg
	lea	rsi, .LC8[rip] # rsi = указатель на строку
	call	strtok@PLT # вызываем strtok
	mov	edx, 10 # edx = 10
	mov	esi, 0 # esi = NULL
	mov	rdi, rax # rdi = strtok()
	call	strtol@PLT # вызвыаем strtol
	mov	DWORD PTR -56[rbp], eax # n = (int) strtol()
	lea	rdi, -224[rbp] # rdi = &start
	mov	esi, 0 # esi = NULL
	call	gettimeofday@PLT # вызываем gettimeofday
	mov	eax, DWORD PTR -56[rbp] # eax = n
	movsx	rdx, eax             # /
	sub	rdx, 1                   # |
	mov	QWORD PTR -64[rbp], rdx  # |
	movsx	rdx, eax             # |
	mov	QWORD PTR -368[rbp], rdx # |
	mov	QWORD PTR -360[rbp], 0   # |
	movsx	rdx, eax             # |
	mov	QWORD PTR -384[rbp], rdx # |
	mov	QWORD PTR -376[rbp], 0   # |
	cdqe                         # |
	lea	rdx, 0[0+rax*8]          # |
	mov	eax, 16                  # |
	sub	rax, 1                   # |
	add	rax, rdx                 # |
	mov	edi, 16                  # |
	mov	edx, 0                   # |
	div	rdi                      # |
	imul	rax, rax, 16         # |
	mov	rcx, rax                 # | создаем массив long A[n]
	and	rcx, -4096               # |
	mov	rdx, rsp                 # |
	sub	rdx, rcx                 # |
.L14:                            # |
	cmp	rsp, rdx                 # |
	je	.L15                     # |
	sub	rsp, 4096                # |
	or	QWORD PTR 4088[rsp], 0   # |
	jmp	.L14                     # |
.L15:                            # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	sub	rsp, rdx                 # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	test	rdx, rdx             # |
	je	.L16                     # |
	and	eax, 4095                # |
	sub	rax, 8                   # |
	add	rax, rsp                 # |
	or	QWORD PTR [rax], 0       # |
.L16:                            # |
	mov	rax, rsp                 # |
	add	rax, 7                   # |
	shr	rax, 3                   # |
	sal	rax, 3                   # |
	mov	QWORD PTR -72[rbp], rax  # \ [rbp - 72] = A
	mov	esi, DWORD PTR -56[rbp] # esi = n
	mov	rdi, QWORD PTR -72[rbp] # rdi = A
	call	generateA@PLT # вызываем generateA
	lea	rdx, -256[rbp] # rdx = &new_n
	mov	esi, DWORD PTR -56[rbp] # esi = n
	mov	rdi, QWORD PTR -72[rbp] # rdi = A
	call	formatFindMin@PLT # вызываем formatFindMin
	mov	QWORD PTR -80[rbp], rax # min = formatFindMin()
	mov	eax, DWORD PTR -256[rbp] # /
	movsx	rdx, eax             # |
	sub	rdx, 1                   # |
	mov	QWORD PTR -88[rbp], rdx  # |
	movsx	rdx, eax             # |
	mov	r14, rdx                 # |
	mov	r15d, 0                  # |
	movsx	rdx, eax             # |
	mov	r12, rdx                 # |
	mov	r13d, 0                  # |
	cdqe                         # |
	lea	rdx, 0[0+rax*8]          # |
	mov	eax, 16                  # |
	sub	rax, 1                   # | создаем массив long B[new_n]
	add	rax, rdx                 # |
	mov	esi, 16                  # |
	mov	edx, 0                   # |
	div	rsi                      # |
	imul	rax, rax, 16         # |
	mov	rcx, rax                 # |
	and	rcx, -4096               # |
	mov	rdx, rsp                 # |
	sub	rdx, rcx                 # |
.L17:                            # |
	cmp	rsp, rdx                 # |
	je	.L18                     # |
	sub	rsp, 4096                # |
	or	QWORD PTR 4088[rsp], 0   # |
	jmp	.L17                     # |
.L18:                            # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	sub	rsp, rdx                 # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	test	rdx, rdx             # |
	je	.L19                     # |
	and	eax, 4095                # |
	sub	rax, 8                   # |
	add	rax, rsp                 # |
	or	QWORD PTR [rax], 0       # |
.L19:                            # |
	mov	rax, rsp                 # |
	add	rax, 7                   # |
	shr	rax, 3                   # |
	sal	rax, 3                   # |
	mov	QWORD PTR -96[rbp], rax  # \ [rbp - 96] = B
	mov	rcx, QWORD PTR -80[rbp]  # rcx = min
	mov	edx, DWORD PTR -56[rbp]  # edx = n
	mov	rsi, QWORD PTR -96[rbp]  # rsi = B
	mov	rdi, QWORD PTR -72[rbp]  # rdi = A
	call	formatGetB@PLT # вызываем formatGetB
	lea	rdi, -240[rbp] # rdi = &end
	mov	esi, 0 # esi = NULL
	call	gettimeofday@PLT # вызываем gettimeofday
	mov	esi, DWORD PTR -256[rbp] # esi = new_n
	mov	rdi, QWORD PTR -96[rbp] # rdi = B
	call	output@PLT #  вызываем output
	mov	rsp, rbx # возращаем esp к исходному
	jmp	.L5 # break из switch
.L3:
	mov	rbx, rsp # сохраняем rsp
	lea	rdi, -260[rbp] # rdi = &n
	call	inputLength@PLT # вызываем inputLength
	mov	eax, DWORD PTR -260[rbp] # /
	movsx	rdx, eax             # |
	sub	rdx, 1                   # |
	mov	QWORD PTR -168[rbp], rdx # |
	movsx	rdx, eax             # |  создаем массив long A[n]
	mov	QWORD PTR -400[rbp], rdx # |
	mov	QWORD PTR -392[rbp], 0   # |
	movsx	rdx, eax             # |
	mov	QWORD PTR -416[rbp], rdx # |
	mov	QWORD PTR -408[rbp], 0   # |
	cdqe                         # |
	lea	rdx, 0[0+rax*8]          # |
	mov	eax, 16                  # |
	sub	rax, 1                   # |
	add	rax, rdx                 # |
	mov	edi, 16                  # |
	mov	edx, 0                   # |
	div	rdi                      # |
	imul	rax, rax, 16         # |
	mov	rcx, rax                 # |
	and	rcx, -4096               # |
	mov	rdx, rsp                 # |
	sub	rdx, rcx                 # |
.L20:                            # |
	cmp	rsp, rdx                 # |
	je	.L21                     # |
	sub	rsp, 4096                # |
	or	QWORD PTR 4088[rsp], 0   # |
	jmp	.L20                     # |
.L21:                            # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	sub	rsp, rdx                 # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	test	rdx, rdx             # |
	je	.L22                     # |
	and	eax, 4095                # |
	sub	rax, 8                   # |
	add	rax, rsp                 # |
	or	QWORD PTR [rax], 0       # |
.L22:                            # |
	mov	rax, rsp                 # |
	add	rax, 7                   # |
	shr	rax, 3                   # |
	sal	rax, 3                   # |
	mov	QWORD PTR -176[rbp], rax # \ [rbp - 176] = A
	mov	esi, DWORD PTR -260[rbp] # esi = n
	mov	rdi, QWORD PTR -176[rbp] # rdi = A
	call	inputA@PLT #  вызываем inputA
	lea	rdi, -224[rbp] # rdi = &start
	mov	esi, 0 # esi = NULL
	call	gettimeofday@PLT # вызываем gettimeofday
	mov	esi, DWORD PTR -260[rbp] # esi = n
	lea	rdx, -264[rbp] # rdx = &new_n
	mov	rdi, QWORD PTR -176[rbp] # rdi = A
	call	formatFindMin@PLT # вызываем formatFindMin
	mov	QWORD PTR -184[rbp], rax # min = formatFindMin()
	mov	eax, DWORD PTR -264[rbp] # /
	movsx	rdx, eax             # |
	sub	rdx, 1                   # |
	mov	QWORD PTR -192[rbp], rdx # |
	movsx	rdx, eax             # |
	mov	QWORD PTR -432[rbp], rdx # |
	mov	QWORD PTR -424[rbp], 0   # |
	movsx	rdx, eax             # |
	mov	QWORD PTR -448[rbp], rdx # |
	mov	QWORD PTR -440[rbp], 0   # |
	cdqe                         # |
	lea	rdx, 0[0+rax*8]          # |
	mov	eax, 16                  # |
	sub	rax, 1                   # |
	add	rax, rdx                 # |
	mov	esi, 16                  # |
	mov	edx, 0                   # |
	div	rsi                      # |
	imul	rax, rax, 16         # |
	mov	rcx, rax                 # |
	and	rcx, -4096               # |
	mov	rdx, rsp                 # |
	sub	rdx, rcx                 # |
.L23:                            # |
	cmp	rsp, rdx                 # | создаем массив long B[new_n]
	je	.L24                     # |
	sub	rsp, 4096                # |
	or	QWORD PTR 4088[rsp], 0   # |
	jmp	.L23                     # |
.L24:                            # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	sub	rsp, rdx                 # |
	mov	rdx, rax                 # |
	and	edx, 4095                # |
	test	rdx, rdx             # |
	je	.L25                     # |
	and	eax, 4095                # |
	sub	rax, 8                   # |
	add	rax, rsp                 # |
	or	QWORD PTR [rax], 0       # |
.L25:                            # |
	mov	rax, rsp                 # |
	add	rax, 7                   # |
	shr	rax, 3                   # |
	sal	rax, 3                   # |
	mov	QWORD PTR -200[rbp], rax # \ [rbp - 200] = B
	mov	edx, DWORD PTR -260[rbp] # edx = n
	mov	rcx, QWORD PTR -184[rbp] # rcx = min
	mov	rsi, QWORD PTR -200[rbp] # rsi = B
	mov	rdi, QWORD PTR -176[rbp] # rdi = A
	call	formatGetB@PLT # вызываем formatGetB
	lea	rdi, -240[rbp] # rdi = &end
	mov	esi, 0 # esi = NULL
	call	gettimeofday@PLT # вызываем gettimeofday
	mov	esi, DWORD PTR -264[rbp] # esi = new_n
	mov	rdi, QWORD PTR -200[rbp] # rdi = B
	call	output@PLT # вызываем output
	mov	rsp, rbx # восстанавливаем rsp
.L5:
	mov	rax, QWORD PTR -240[rbp] # rax = end.tv_sec
	mov	rdx, QWORD PTR -224[rbp] # rdx = start.tv_sec
	sub	rax, rdx # rax = end.tv_sec - start.tv_sec
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	movsd	xmm0, QWORD PTR .LC9[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -208[rbp], xmm0
	mov	rax, QWORD PTR -232[rbp] # rax = end.tv_usec
	mov	rdx, QWORD PTR -216[rbp] # rdx = start.tv_usec
	sub	rax, rdx # rax = end.tv_usec - start.tv_usec
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -208[rbp] # time_taken + (double) (end.tv_usec - start.tv_usec)) * 1e-6
	movsd	xmm0, QWORD PTR .LC10[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -208[rbp], xmm0
	mov	rax, QWORD PTR -208[rbp]
	movq	xmm0, rax
	lea	rdi, .LC11[rip] # rdi = указатель на строку
	mov	eax, 1 # eax = 1
	call	printf@PLT # вызываем printf
	mov	eax, 0 # eax = 0
	lea	rsp, -40[rbp] # освобождаем память, выделенную на стеке
	pop	rbx # возвращаем регистры к состоянию до вызова функции согласно конвенции
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp # эпилог
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

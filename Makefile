%.s: %.c
	gcc -S -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0 "$<" -o "$@"

%.o: %.s
	gcc -c -masm=intel "$<" -o "$@"

asm: main_commented.s functions_commented.s

obj: main_commented.o functions_commented.o

executable: main_commented.o functions_commented.o
	gcc -lc main_commented.o functions_commented.o -o executable_commented

.PHONY: asm obj
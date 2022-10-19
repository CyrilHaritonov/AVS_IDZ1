main_03.s: main.c
	gcc -S -masm=intel -O3 "$<" -o "$@"

functions_O3.s: functions.c
	gcc -S -masm=intel -O3 "$<" -o "$@"

main_0s.s: main.c
	gcc -S -masm=intel -Os "$<" -o "$@"

functions_Os.s: functions.c
	gcc -S -masm=intel -Os "$<" -o "$@"

%.s: %.c
	gcc -S -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0 "$<" -o "$@"

%.o: %.s
	gcc -c -masm=intel "$<" -o "$@"

%.o: %.c
	gcc -c -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -O0 "$<" -o "$@"

asm: main.s functions.s main_commented.s functions_commented.s functions_max_registers_use.s main_03.s functions_O3.s main_0s.s functions_Os.s

obj: main.o functions.o main_commented.o functions_commented.o functions_max_registers_use.o main_03.o functions_O3.o main_Os.o functions_Os.o

executable_commented: main_commented.o functions_commented.o
	gcc -lc main_commented.o functions_commented.o -o executable_commented

executable_max_registers_use: main_commented.o functions_max_registers_use.o
	gcc -lc main_commented.o functions_max_registers_use.o -o executable_max_registers_use

executable_O3: main_03.o functions_O3.o
	gcc -lc main_03.o functions_O3.o -o executable_O3

executable_Os: main_0s.o functions_Os.o
	gcc -lc main_0s.o functions_Os.o -o executable_Os

executable_default: main.o functions.o
	gcc -lc main.o functions.o -o executable_default
.PHONY: asm obj

test: executable_default executable_commented executable_max_registers_use executable_O3 executable_Os
	echo "executable_default"
	./executable_default < input1
	./executable_default < input2
	./executable_default < input3
	./executable_default -r 5
	./executable_default -f input1:output
	cat output
	echo "executable_commented"
	./executable_commented < input1
	./executable_commented < input2
	./executable_commented < input3
	./executable_commented -r 5
	./executable_commented -f input1:output
	cat output
	echo "executable_max_registers_use"
	./executable_max_registers_use < input1
	./executable_max_registers_use < input2
	./executable_max_registers_use < input3
	./executable_max_registers_use -r 5
	./executable_max_registers_use -f input1:output
	cat output
	echo "executable_O3"
	./executable_O3 < input1
	./executable_O3 < input2
	./executable_O3 < input3
	./executable_O3 -r 5
	./executable_O3 -f input1:output
	cat output
	echo "executable_Os"
	./executable_Os < input1
	./executable_Os < input2
	./executable_Os < input3
	./executable_Os -r 5
	./executable_Os -f input1:output
	cat output
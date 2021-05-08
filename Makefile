
scramble: main.c scramble.asm
	gcc -S -m64 main.c -masm=intel         # C -> ASM
	#cat main.s | less                     # opțional: cod ASM generat de gcc
	gcc -c -m64 -ggdb main.c               # C -> fișier obiect
	nasm -f elf64 -g -F dwarf scramble.asm # ASM -> fișier obiect
	gcc -m64 main.o scramble.o -o scramble # fișiere obiect -> executabil

clean:
	rm -f scramble *.o *.s

all: scramble

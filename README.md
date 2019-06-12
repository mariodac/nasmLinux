;nasm -f elf32 aula1.asm
;ld -m elf_i386 aula1.o -o aula1# nasmLinux
Códigos fontes desenvolvidos durante a disciplina arquitetura de computadores

**Foram desenvolvidos para funcionar em uma arquitetura do sistema operacional Linux**

Para gerar código objeto *i386*:
**nasm -f elf32 arquivo.asm**

Para gerar código executável *i386*:
**ld -m elf_i386 arquivo.o -o executavel.out**


Para gerar código objeto *x86_64*:
**nasm -f elf64 arquivo.asm**

Para gerar código executável *x86_64*:
**ld -m elf_x86_64 arquivo.o -o executavel.out*

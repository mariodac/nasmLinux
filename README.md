# Nasm no Linux

<h3>NASM version 2.13.02</h3>

<h3>SO</h3>

**Distributor ID:	Ubuntu
Description:	Ubuntu 18.04.2 LTS
Release:	18.04
Codename:	bionic**
Códigos fontes desenvolvidos durante a disciplina arquitetura de computadores

**Foram desenvolvidos para funcionar em uma arquitetura do sistema operacional Linux**

Para gerar código objeto *i386*:
**nasm -f elf32 arquivo.asm**

Para gerar código executável *i386*:
**ld -m elf_i386 arquivo.o -o executavel.out**


Para gerar código objeto *x86_64*:
**nasm -f elf64 arquivo.asm**

Para gerar código executável *x86_64*:
**ld -m elf_x86_64 arquivo.o -o executavel.out**

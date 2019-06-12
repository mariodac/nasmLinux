; Aquele hello world para ter sucesso na linguagem rsrs
section .data:
    msg db "Hello Computers!" , 0xa
    len equ $ - msg ;tamanho da mensagem

section .text:
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80 ;ou 0x80h

    mov eax, 1
    mov ebx, 0
    int 0x80

;nasm -f elf32 aula1.asm
;ld -m elf_i386 aula1.o -o aula1

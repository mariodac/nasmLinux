; leitura do teclado e exibição do que foi digitado

SYS_EXIT    equ     1
SYS_WRITE   equ     4
SYS_READ    equ     3
STD_OUT     equ     1
STD_IN      equ     0
RET_EXIT    equ     5
EXEC        equ     0x80


section .data
    msg1    db  "Digite seu nome: ", 0xa
    len1    equ $ - msg1
    msg2    db  "O nome digitado foi: ", 0xf
    len2    equ $ - msg2

section .bss
    nome resb 2


section .text
    global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg1
    mov edx, len1
    int EXEC

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, 10
    int EXEC

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg2
    mov edx, len2
    int EXEC

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, nome
    mov edx, 10
    int EXEC

    mov eax, 1
    mov ebx, 0
    int EXEC
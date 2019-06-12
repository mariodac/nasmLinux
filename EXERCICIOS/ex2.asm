; resolução exercicio 2. exibir mensagens utilizando labels

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

    msg3    db  "Digite seu endereço: ", 0xa
    len3    equ $ - msg3
    msg4    db  "O endereço digitado foi: ", 0xf
    len4    equ $ - msg4

section .bss
    nome resq 20
    endereco resq 20


section .text
    global _start

entradaNome:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg1
    mov edx, len1
    int EXEC
SYS_EXIT
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, nome
    mov edx, 20
    int EXEC

    ; call saidaNome

    ; call finalizar
    ret

saidaNome:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg2
    mov edx, len2
    int EXEC

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, nome
    mov edx, 20
    int EXEC

    ; call entradaEndereco
    ret

entradaEndereco:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg3
    mov edx, len3
    int EXEC

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, endereco
    mov edx, 20
    int EXEC

    ; call saidaEndereco

    ; call finalizar
    ret

saidaEndereco:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg4
    mov edx, len4
    int EXEC

    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, endereco
    mov edx, 20
    int EXEC

    ; call finalizar
    ret

_start:
    call entradaNome
    call saidaNome
    call entradaEndereco
    call saidaEndereco

finalizar:
    mov eax, 1
    mov ebx, 0
    int EXEC
    
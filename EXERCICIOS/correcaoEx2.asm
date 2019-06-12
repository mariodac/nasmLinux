; correção feita pelo professor do exercicio 2
section .data
    msg1    db  "Digite seu nome: "
    len1    equ $ - msg1
    msg2    db  "O nome digitado foi: ", 0xa
    len2    equ $ - msg2

    msg3    db  "Digite seu endereço: "
    len3    equ $ - msg3
    msg4    db  "O endereço digitado foi: ", 0xf
    len4    equ $ - msg4

section .bss
    nome resb 7
    endereco resw 15

section .text
    global _start

_start:
    mov ecx, msg1
    mov edx, len1
    int 80h
    call exibir

    mov ecx, nome
    mov edx, 7
    call leitura

    mov ecx, msg3
    mov edx, len3
    int 80h
    call exibir

    mov ecx, endereco
    mov edx, 15
    call leitura

    mov ecx, nome
    mov edx, 7
    call exibir

    mov ecx, endereco
    mov edx, 15
    call exibir

    jmp encerrar

exibir:
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

leitura:
    mov eax, 3
    mov ebx, 0
    int 80h
    ret

encerrar:
    mov eax, 1
    mov ebx, 0
    int 80h
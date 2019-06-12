; correção feita pelo professor do exercicio 3
section .data
    msg1 db "Digite uma String: "
    len1 equ $-msg1
    msg2 db "Digite outra String: "
    len2 equ $-msg2
    msg3 db "As String são IGUAIS", 0xa
    len3 equ $-msg3
    msg4 db "As String são DIFERENTES", 0xa
    len4 equ $-msg4

section .bss
    string1 resq 2
    string2 resq 2

section .text
    global _start

_start:
    mov rcx, msg1
    mov rdx, len1
    call exibir

    mov rcx, string1
    mov rdx, 20
    call leitura

    mov rcx, msg2
    mov rdx, len2
    call exibir

    mov rcx, string2
    mov rdx, 20
    call leitura

    mov rax, QWORD [string1]
    mov rdx, QWORD [string2]
    cmp rax, rdx
    je iguais

    mov rcx, msg4
    mov rdx, len4
    call exibir

    jmp final

exibir:
    mov rax, 4
    mov rbx, 1
    int 80h
    ret

leitura:
    mov rax, 3
    mov rbx, 0
    int 80h
    ret

iguais:
    mov rcx, msg3
    mov rdx, len3
    call exibir

final:
    mov rax, 1
    mov rbx, 0
    int 80h
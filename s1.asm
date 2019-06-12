; soma números de 0 a 9
section .data
    v1 dw '5', 0xf

section .text
    global _start

_start:
    mov eax, [v1]
    sub eax, '0'    ;converte para Inteiro
    add eax, 2      ;ADD adiciona
    add eax, '0'    ;converte para caractere
    mov [v1], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, v1
    mov edx, 3
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
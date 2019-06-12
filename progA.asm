; somente para exibir o retorno
section .text
    global _start

_start:
    mov eax, 1 ; saida
    mov ebx, 2 ; retorno
    int 0x80
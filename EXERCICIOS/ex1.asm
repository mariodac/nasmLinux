; resolução exercicio 1. exibir mensagens utilizando labels
section .data:
    nome db "Mário Douglas", 0xa
    dataNascimento db "05/08/1995", 0xa
    lenN equ $ - nome
    lenDN equ $ - dataNascimento

section .text:
    global _start

_start:
    call verNome
    call verDataNascimento

_final:
    mov eax, 1
    mov ebx, 0
    int 0x80

verDataNascimento:
    mov eax, 4
    mov ebx, 1
    mov ecx, dataNascimento
    mov edx, lenDN
    int 0x80
    call _final
    ret
    
verNome:
    mov eax, 4
    mov ebx, 1
    mov ecx, nome
    mov edx, lenN
    int 0x80
    call _final
    ret

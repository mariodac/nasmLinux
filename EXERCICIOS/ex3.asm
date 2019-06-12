; resolução exercicio 3. exibir mensagens utilizando labels e jumpers

SYS_EXIT    equ     1
SYS_WRITE   equ     4
SYS_READ    equ     3
STD_OUT     equ     1
STD_IN      equ     0
RET_EXIT    equ     5
EXEC        equ     0x80

section .data:
    msg1 db "Digite a string 1:", 0xa
    len1 equ $ - msg1
    msg2 db "Digite a string 2:", 0xa
    len2 equ $ - msg2
    msg3 db "Strings são iguais", 0xa
    len3 equ $ - msg3
    msg4 db "String são diferentes", 0xa
    len4 equ $ - msg4

section .bss
    string1 resd 2
    string2 resd 2

section .text:
    global _start

entrada1:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg1
    mov edx, len1
    int EXEC

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, string1
    mov edx, 10
    int EXEC

    ; mov eax, SYS_WRITE
    ; mov ebx, STD_OUT
    ; mov ecx, string1
    ; mov edx, 10
    ; int EXEC

    ret

entrada2:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg2
    mov edx, len2
    int EXEC

    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, string2
    mov edx, 10
    int EXEC

    ; mov eax, SYS_WRITE
    ; mov ebx, STD_OUT
    ; mov ecx, string2
    ; mov edx, 10
    ; int EXEC
    ret

_start:
    call entrada1
    call entrada2
    mov eax, DWORD [string1]
    mov edx, DWORD [string2]
    cmp eax, edx
    je iguais
    mov edx, len4
    mov ecx, msg4
    jmp finalizar

iguais:
    mov edx, len3
    mov ecx, msg3

finalizar:
    mov ebx, STD_OUT
    mov eax, SYS_WRITE
    int 0x80

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int EXEC

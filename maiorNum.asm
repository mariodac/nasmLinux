; comparação para encontrar o maior numero

section .data
;db - Define Byte - 1 byte
;dw - Define Word = 2 bytes
;dd - Define Double Word - 4 bytes
;dq - Define Quad Word - 8 bytes
x dd "7"
y dd "5"
msg1 db 'X igual que Y', 0xa
len1 equ $ - msg1
msg2 db 'Y diferente que X', 0xa
len2 equ $ - msg2

section .text
    global _start

_start:
    mov eax, DWORD [x]
    mov edx, DWORD [y]
    cmp eax, edx ;comparação
    jg maior ;je = | jg > | jge >= | jl < | jle <= | jne !=
    mov edx, len2
    mov ecx, msg2
    jmp final

    maior:
        mov edx, len1
        mov ecx, msg1

    final:
        mov ebx, 1
        mov eax, 4
        int 0x80
        mov eax, 1
        mov ebx, 0
        int 0x80

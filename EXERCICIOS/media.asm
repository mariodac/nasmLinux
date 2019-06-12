; ler 4 numeros (de 0 a 9) e realizar a média
section .data
    tit db  10, '+-------+',10,'| MÉDIA |', 10, '+-------+', 0xa
    ltit equ $ - tit
    msg2 db 10, 'Digite N1: ', 0
    lmsg2 equ $-msg2
    msg3 db 10, 'Digite N2: ', 0
    lmsg3 equ $-msg3
    msg4 db 10, 'Digite N3: ', 0
    lmsg4 equ $-msg4
    msg5 db 10, 'Digite N4: ', 0
    lmsg5 equ $-msg5
    msg6 db 10, 'A média foi: ', 0
    lmsg6 equ $-msg6
    linha db 10, 0
    llinha equ $-linha
    quantidade db 10, '4'

section .bss
    n1 resb 10
    n2 resb 10
    n3 resb 10
    n4 resb 10
    result resb 10
    result2 resb 10
    result3 resb 10
    media resb 10

section .text
    global _start

_start:
    mov ecx, tit
    mov edx, ltit
    call exibir
    
    mov ecx, msg2
    mov edx, lmsg2
    call exibir

    mov ecx, n1
    mov edx, 10
    call leitura

    mov ecx, msg3
    mov edx, lmsg3
    call exibir

    mov ecx, n2
    mov edx, 10
    call leitura

    mov ecx, msg4
    mov edx, lmsg4
    call exibir

    mov ecx, n3
    mov edx, 10
    call leitura

    mov ecx, msg5
    mov edx, lmsg5
    call exibir

    mov ecx, n4
    mov edx, 10
    call leitura

    mov ecx, msg6
    mov edx, lmsg6
    call exibir

    call soma

    jmp exit

soma:
    ;add eax,ebx
    ;move os numeros lidos para eax e ebx
    mov eax, [n1]
    mov ebx, [n2]
    ; converte de string para inteiro
    sub eax, '0'
    sub ebx, '0'
    ; realiza soma
    add eax, ebx
    ; converte de inteiro para soma
    add eax, '0'
    ; move o conteudo de eax para result
    mov [result], eax

    ;add eax,ebx
    ;move os numeros lidos para eax e ebx
    mov eax, [n3]
    mov ebx, [n4]
    ; converte de string para inteiro
    sub eax, '0'
    sub ebx, '0'
    ; realiza soma
    add eax, ebx
    ; converte de inteiro para soma
    add eax, '0'
    ; move o conteudo de eax para result
    mov [result2], eax

    ;add eax,ebx
    ;move os numeros lidos para eax e ebx
    mov eax, [result]
    mov ebx, [result2]
    ; converte de string para inteiro
    sub eax, '0'
    sub ebx, '0'
    ; realiza soma
    add eax, ebx
    ; converte de inteiro para soma
    add eax, '0'
    ; move o conteudo de eax para result
    mov [result3], eax

    ; finaliza e imprime na tela
    ; mov ecx, result3
    ; mov edx, 3
    ; call exibir
    
    ;AX e BX
    ;div BX
    ;move os numeros lidos para eax e ebx
    mov al, [result3]
    mov bl, '4'
    mov dx, 0
    mov ah, 0
    ; converte de string para inteiro
    sub al, '0'
    sub bl, '0'
    ; realiza divisão
    div bl
    ; converte de inteiro para soma
    add ax, '0'
    ; move o conteudo de eax para result
    mov [media], ax
    ; finaliza e imprime na tela

    ; mov ecx, result3
    ; mov edx, 1
    ; call exibir

    ; mov ecx, linha
    ; mov edx, llinha
    ; call exibir

    mov ecx, media
    mov edx, 3
    call exibir
    jmp exit

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

exit:
    mov ecx, linha
    mov edx, llinha
    call exibir
    mov eax, 1
    mov ebx, 0
    int 80h

    
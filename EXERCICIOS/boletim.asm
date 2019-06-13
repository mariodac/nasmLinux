; ler 4 numeros (de 0 a 9) e realizar a média e exibir aprovado se média maior que 2
; ou exibir reprovado se média menor que 2
; foi adicionado uma label para realizar a média
section .data
    tit dd 30, '+----------------------------+',30,'| MÉDIA |', 30, '+----------------------------+', 0xa
    ltit equ $ - tit
    tit2 dd 30, '+----------------------------+',30,'| RESULTADO |', 30, '+----------------------------+', 0xa
    ltit2 equ $-tit2
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
    msg7 db 10, 'ALUNO FOI APROVADO!', 0
    lmsg7 equ $-msg7
    msg8 db 10, 'ALUNO FOI REPROVADO!', 0
    lmsg8 equ $-msg8
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
    media resd 10

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

    mov ecx, tit2
    mov edx, ltit2
    call exibir

    mov ecx, msg6
    mov edx, lmsg6
    call exibir

    call soma

    call resultado

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
    ; move o conteudo de eax para result contendo a soma dos primeiros dois numeros
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
    ; move o conteudo de eax para result2 contendo a soma dos ultimos dois numeros
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
    ; move o conteudo de eax para result3 contendo a soma dos 4 números
    mov [result3], eax

    jmp mediaArimetmedia

mediaArimetmedia:
    ;move resultado da soma para al e realiza a divisão
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
    ; move o conteudo de eax para media
    mov [media], ax

    ; finaliza e imprime na tela
    mov ecx, media
    mov edx, 3
    call exibir
    ret

resultado:
    mov eax, DWORD [media]
    mov edx, '2'
    cmp eax, edx
    jg aprovado
    jmp reprovado

aprovado:
    mov ecx, linha
    mov edx, llinha
    call exibir
    mov ecx, msg7
    mov edx, lmsg7
    call exibir
    jmp exit

reprovado:
    mov ecx, linha
    mov edx, llinha
    call exibir
    mov ecx, msg8
    mov edx, lmsg8
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

    
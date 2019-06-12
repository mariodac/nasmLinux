; calculadora com 4 operações básicas: SOMAR, SUBTRAIR, MULTIPLICAR, DIVIDIR
section .data
    tit         db  10, '+-------------+',10,'| Calculadora |', 10, '+-------------+', 0
    ltit        equ $ - tit
    obVal1      db  10, 'Valor 1: ', 0
    lobVal1     equ $ - obVal1 
    obVal2      db  10, 'Valor 2: ', 0
    lobVal2     equ $ - obVal2
    opc1        db  10, '1. Somar',0
    lopc1       equ $ - opc1
    opc2        db  10, '2. Subtrair',0
    lopc2       equ $ - opc2
    opc3        db  10, '3. Multiplicar',0
    lopc3       equ $ - opc3
    opc4        db  10, '4. Dividir',0
    lopc4       equ $ - opc4
    msgOpc      db  10, 'Deseja Realizar? ',0
    lmsgOpc     equ $ - msgOpc
    msgErro     db  10, 'Valor da Opção Inválida',0
    lmsgErro    equ $ - msgErro
    salLinha    db  10,0
    lsalLinha   equ $ - salLinha ;SALTAR LINHA

section .bss
    opc     resb 2
    num1    resb 10
    num2    resb 10
    result  resb 10
    
section .text
    global _start

        _start:
            mov ecx, tit
            mov edx, ltit
            call mst_saida

            mov ecx, obVal1
            mov edx, lobVal1
            call mst_saida
            mov ecx, num1
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h

            mov ecx, obVal2
            mov edx, lobVal2
            call mst_saida
            mov ecx, num2
            mov edx, 10
            mov eax, 3
            mov ebx, 0
            int 80h

            mov ecx, opc1
            mov edx, lopc1
            call mst_saida

            mov ecx, opc2
            mov edx, lopc2
            call mst_saida

            mov ecx, opc3
            mov edx, lopc3
            call mst_saida

            mov ecx, opc4
            mov edx, lopc4
            call mst_saida

            
            mov ecx, msgOpc
            mov edx, lmsgOpc
            call mst_saida
            mov ecx, opc
            mov edx, 2
            mov eax, 3
            mov ebx, 0
            int 80h

            mov ah, [opc]
            sub ah, '0' ; tira o último zero da String e assim ele deixa de ser uma String

            cmp ah, 1
            je  Somar
            cmp ah, 2
            je  Subtrair
            cmp ah, 3
            je  Multiplicar
            cmp ah, 4
            je  Dividir

            mov ecx, msgErro
            mov edx, lmsgErro
            call mst_saida
            jmp exit

        Somar:
            ;add eax,ebx
            ;move os numeros lidos para eax e ebx
            mov eax, [num1]
            mov ebx, [num2]
            ; converte de string para inteiro
            sub eax, '0'
            sub ebx, '0'
            ; realiza soma
            add eax, ebx
            ; converte de inteiro para soma
            add eax, '0'
            ; move o conteudo de eax para result
            mov [result], eax
            ; finaliza e imprime na tela
            mov ecx, result
            mov edx, 3
            call mst_saida
            jmp exit
        
        Subtrair:
            ;sub eax, ebx
            ;move os numeros lidos para eax e ebx
            mov eax, [num1]
            mov ebx, [num2]
            ; converte de string para inteiro
            sub eax, '0'
            sub ebx, '0'
            ; realiza subtração
            sub eax, ebx
            ; converte de inteiro para soma
            add eax, '0'
            ; move o conteudo de eax para result
            mov [result], eax
            ; finaliza e imprime na tela
            mov ecx, result
            mov edx, 3
            call mst_saida
            jmp exit
        
        Multiplicar:
            ;AX e BX
            ;mul BX
            ;move os numeros lidos para eax e ebx
            mov eax, [num1]
            mov ebx, [num2]
            ; converte de string para inteiro
            sub eax, '0'
            sub ebx, '0'
            ; realiza subtração
            mul ebx
            ; converte de inteiro para soma
            add al, '0'
            ; move o conteudo de eax para result
            mov [result], al
            ; finaliza e imprime na tela
            mov ecx, result
            mov edx, 3
            call mst_saida
            jmp exit
        
        Dividir:
            ;AX e BX
            ;div BX
            ;move os numeros lidos para eax e ebx
            mov al, [num1]
            mov bl, [num2]
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
            mov [result], ax
            ; finaliza e imprime na tela
            mov ecx, result
            mov edx, 3
            call mst_saida
            jmp exit
        
        exit:
            mov ecx, salLinha
            mov edx, lsalLinha
            call mst_saida
            mov eax, 1
            mov ebx, 0
            int 80h

        mst_saida:
            mov eax, 4
            mov ebx, 1
            int 80h
            ret

        ; int_to_string:
        ;     add esi, 9
        ;     mov byte[esi], 0
        ;     mov ebx, 10
        ;     .prox_digito:
        ;         xor edx, edx; limpa edx
        ;         div ebx
        ;         add dl, '0'
        ;         dec esi
        ;         mov [esi], dl
        ;         test eax, eax ; testa se EAX tem o conteúdo de EAX
        ;         jnz .prox_digito ; se eax for == 0 continue
        ;         mov eax, esi
        ;         ret

        ; string_to_int:
        ;     xor ebx, ebx ; limpa ebx
        ;     .prox_digito:
        ;         movzx eax, byte[esi] ; MOVZX adiciona zeros na parte faltante
        ;         inc esi
        ;         sub al, '0' ; Converte String para  Inteiro
        ;         imul ebx, 10 ; IMUL instrução de multiplicação onde aceita valores inteiros
        ;                      ;positivos e negativos
        ;         add ebx, eax ; ebx =ebx * 10 + eax
        ;         loop .prox_digito ;while (--ecx)
        ;         mov eax, ebx
        ;         ret

        ; converter_valor:
        ;     lea esi, [num1]
        ;     mov ecx, 3
        ;     call string_to_int
        ;     add eax, 1
        ;     ret


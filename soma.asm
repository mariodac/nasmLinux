; soma números maiores que 9
section .data
    v1 dw '105', 0xb

section .bss
    buffer: resb 10

section .text
    global _start

_start:
    call converter_valor
    call mostrar_valor 

_final:
    mov eax, 1
    mov ebx, 0
    int 0x80

converter_valor:
    lea esi, [v1]
    mov ecx, 3
    call string_to_int
    add eax, 1w
    ret

mostrar_valor:
    lea esi, [buffer]
    call int_to_string
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 10
    int 0x80
    ret

    ;Entrada: ESI (ponteiro da string a ser convertida) ECX (número de dígitos)
    ; Saída: EAX com o valor
string_to_int:
    xor ebx, ebx ; limpa ebx
    .prox_digito:
        movzx eax, byte[esi] ; MOVZX adiciona zeros na parte faltante
        inc esi
        sub al, '0' ; Converte String para  Inteiro
        imul ebx, 10 ; IMUL instrução de multiplicação onde aceita valores inteiros
                     ;positivos e negativos
        add ebx, eax ; ebx =ebx * 10 + eax
        loop .prox_digito ;while (--ecx)
        mov eax, ebx
        ret

;Convert Inteiro para String 
; Entrada: EAX ESI
; Saída: EAX

int_to_string:
    add esi, 9
    mov byte[esi], 0
    mov ebx, 10
    .prox_digito:
        xor edx, edx; limpa edx
        div ebx
        add dl, '0'
        dec esi
        mov [esi], dl
        test eax, eax ; testa se EAX tem o conteúdo de EAX
        jnz .prox_digito ; se eax for == 0 continue
        mov eax, esi
        ret


    
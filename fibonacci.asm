;; fibonacci.asm ;;
;; imprimi numeros fibonacci ate 1000000000	;;
global _start

section .bss

array2 resb 512					;para converter a saida

section .text

;;;;;;;;;;;;;;;;;;;;;; GERADOR FIBONACCI  ;;;;;;;;;;;;;;;;;;;;;;;;;;
input:							;numeros que serão armazenado no input
%assign i 1						;
%assign j 1						;
%rep 1000000000					;limite do fibonacci num -1
	%if j > 1000000000			;
		%exitrep				;
	%endif						;
								;
	dd j						;
								;
	%assign k j+i				;
	%assign i j					;
	%assign j k					;
%endrep							;
inlen equ ($-input)/4			;quantidade de elementos de 4 bytes

;;;;;;;;;;;;;;;;;;;;;;; PARTE PRINCIPAL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_start:
		xor ecx, ecx			;contador da pilha
		mov edi, -1				;auxiliar para celula no contador de entrada
		mov esi, -1				;auxiliar para celula no contador de saída

cycle:							;ciclo principal
		mov [array2+esi],byte 10;coloca \r na saída depois de cada número	
		inc esi					;incrementa contador de saída

		inc edi					;nova célula de 4 bytes de entrada
		cmp edi, inlen			;entrada foi terminada?
		jz exit					;	se sim, vai para EXIT
		
		mov eax, [input+edi*4]	;se não, prepare para dividir eax por
		mov ebx, 10				;	ebx (123 -> 1,2,3)

;;;;;;;;;;;;;;;;;;;;;;; PROCESSA 1 CELULA DA ENTRADA ;;;;;;;;;;;;;;;;;;;;;
chop:							;123 -> 1,2,3
		xor edx, edx			;prepara EDX:EAX
		div ebx					;divide eax por ebx
		add edx, 00110000b		;converte o restante para ascii
		test eax, eax			;nada é deixado para dividir
		jnz prpchop				;se sim -> prepara fazer novamente

transf:							;se não -> transferir para o array de saída
		mov [array2+esi], dl	;move para array, somente 1 byte
		inc esi					;incrementa array de saída
		test ecx, ecx			;há algo para adicionar na pilha?
		jz cycle				;se não -> vá para próxima célula
		pop edx					;se sim -> desempilha
		dec ecx					;decremente pilha
		jmp transf				;transfere para array de saída

prpchop:						;prepara para o corte denovo
		push edx				;salva restante da divisão
		inc ecx					;incrementa contador da pilha
		xor edx, edx			;prepare EDX
		jmp chop				; -> corte

exit:

;;;;;;;;;;;;;;;;;;;;;;; CÁLCULO DO COMPRIMENTO DE SAÍDA ;;;;;;;;;;;;;;;;;;;;
		xor ecx, ecx			;prepara contador
lp:		cmp byte [array2+ecx],0 ;chegou no fim do array de saída?
		jz end					;se sim -> pare de conta
		inc ecx					;se não -> continue incrementando
		jmp lp					;faça de novo
end:							
		
;;;;;;;;;;;;;;;;;;;;;;; IMPRIMI E SAÍDA ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		mov eax, 4		;escreve
		mov ebx, 1		;	para saida padrão
		mov ecx, array2	;	inicia array de saída
		mov edx, ecx	;	tamanho de array de saída
		int 80h			;	chama interrupção

		mov eax, 1		; saida
		mov ebx, 1		;	voltando tudo ao normal
		int 80h			;	encerrando programa
; Código desenvolvido para rodar na arquitetura windows
    global  _main
    extern  _printf

    section .text
_main:
    push    message
    call    _printf
    add     esp, 4
    ret
message:
    db  'Mario Douglas Alves Cabral', 10, 0

%include        'functions.asm'

section .data
msg1     db      "Hello, world!", 0Ah
msg2     db      "Display a line of text", 0Ah

section .text
global _start

_start:
    mov     eax, msg1
    call    print
    mov     eax, msg2
    call    print
    call    quit

%include        'functions.asm'

section .data
msg1     db      "Hello, world!", 0x0A, 0x00
msg2     db      "Display a line of text", 0x0A, 0x00

section .text
global _start

_start:
    mov     eax, msg1
    call    print
    mov     eax, msg2
    call    print
    call    quit

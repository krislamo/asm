; %include        'functions.asm'

SYS_EXIT    equ 1
SYS_WRITE   equ 4
STDOUT      equ 1

section .data
msg     db      "Hello, world!", 0Ah

section .text
global _start

_start:
    mov     edx, 14
    mov     ecx, msg
    mov     ebx, STDOUT
    mov     eax, SYS_WRITE
    int     0x80

    mov     ebx, 0
    mov     eax, SYS_EXIT
    int     0x80

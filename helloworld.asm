; Hello World Program - asmtutor.com
; Compile with: nasm -f elf helloworld.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld.o -o helloworld
; Run with: ./helloworld

SECTION .data
msg     db      'Hello, brave new world!', 0Ah     ; assign msg variable with your message string

SECTION .text
global  _start

_start:
    mov     eax, msg
    call    strlen

    mov     edx, eax        ; our function leaves the result in EAX
    mov     ecx, msg
    mov     ebx, 1          ; STDOUT
    mov     eax, 4          ; SYS_WRITE
    int     80h

    mov     ebx, 0          ; return 0
    mov     eax, 1          ; SYS_EXIT
    int     80h

strlen:
    push    ebx             ; preserve EBX while we use in this function
    mov     ebx, eax        ; move the address in EAX into EBX

nextchar:
    cmp     byte [eax], 0   ; compare the byte pointed to by EAX at this address against zero (Zero is an end of string delimiter)
    jz      finished        ; jump (if the zero flagged has been set) to the point in the code labeled 'finished'
    inc     eax             ; increment the address in EAX by one byte (if the zero flagged has NOT been set)
    jmp     nextchar        ; jump to the point in the code labeled 'nextchar'

finished:
    sub     eax, ebx
    pop     ebx
    ret

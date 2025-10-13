SYS_EXIT    equ 1
SYS_WRITE   equ 4
STDOUT      equ 1

strlen:
    push    ebx
    mov     ebx, eax
nextchar:
    cmp     byte[eax], 0
    jz      finished
    inc     eax
    jmp     nextchar
finished:
    sub     eax, ebx
    pop     ebx
    ret

print:
    push    ebx
    push    ecx
    push    edx

    mov     ebx, eax
    call    strlen
    mov     edx, eax
    mov     ecx, ebx
    mov     ebx, STDOUT
    mov     eax, SYS_WRITE
    int     0x80

    pop     edx
    pop     ecx
    pop     ebx
    ret

quit:
    mov     ebx, 0
    mov     eax, SYS_EXIT
    int     0x80

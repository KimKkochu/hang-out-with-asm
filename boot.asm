[org 0]
[bits 16]
    jmp 0x07c0: _start ; cs set 0x00..

_start:
    mov ax, cs 
    mov ds, ax ; reset ds to cs

    mov ax, 0xB800
    mov es, ax 
    mov di, 0
    mov ax, word [msgBack]
    mov cx, 0x7FF

print:
    mov word [es:di], ax
    add di, 2
    dec cx

    jnz print

    mov edi, 0
    mov byte [es:edi], 'Y'
    inc edi
    mov byte [es:edi], 0x05
    inc edi
    mov byte [es:edi], 'E'
    inc edi
    mov byte [es:edi], 0x16
    inc edi
    mov byte [es:edi], 'A'
    inc edi
    mov byte [es:edi], 0x27
    inc edi
    mov byte [es:edi], 'H'
    inc edi
    mov byte [es:edi], 0x38
    inc edi

    jmp $

msgBack db '.', 0x17

times 510-($-$$) db 0 ; $(now address)

dw 0xAA55
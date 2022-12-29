global _start

section .text
    _start:
        mov rax, 1
        mov rdi, 1
        mov rsi, char
        mov rdx, 1
        mov r10, 0
    
    again:
        cmp r10, 5
        je exit
        syscall
        mov rax, 1
        inc r10
        jmp again
    
    exit:
        mov rax, 60
        mov rdi, 0
        syscall

section .data
    char: db "A"
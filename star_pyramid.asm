global _start

section .bss
    maxlines equ 8
    dataSize equ 44
    output: resb dataSize

section .text
    _start:
        mov rdx, output
        mov r8, 1
        mov r9, 0
    
    line:
        mov byte [rdx], '*' ; write single star
        inc rdx ; advance pointer to next cell to write
        inc r9
        cmp r9, r8
        jne line

    lineDone:
        mov byte [rdx], 10
        inc rdx
        inc r8
        mov r9, 0
        cmp r8, maxlines
        jng line

    done:
        mov rax, 1
        mov rdi, 1
        mov rsi, output
        mov rdx, dataSize
        syscall

        mov rax, 60
        mov rdi, 0
        syscall
global _start

section .text
_start:
    sub rsp, 100 ; buff area allocate

    mov rax, 0
    mov rdi, 0 ; sys_read for rdi, 0 is standard input
    mov rsi, rsp
    mov rdx, 99 ; input string len
    syscall

    mov rax, 1
    mov rdi, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

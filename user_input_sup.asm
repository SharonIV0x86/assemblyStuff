global _start

section .text
_start:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, welcome_msg
    mov rdx, welcome_msg_lenght
    syscall
taking_input:
    mov rax, 0x0
    mov rdi, 0x0
    mov rsi, input
    mov rdx, 0x64
    syscall
    mov rax, rcx ;the user enteres input and once the syscall matches the provided arguments the syscall has a return value the syscall returns the length of the STDIN input in the register rax,
    ;to preserve the value of rax i am moving rax's value into another register which is rcx
display_sup:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, wassup
    mov rdx, wassup_lenght
    syscall
display_full_mesg:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, input
    mov rdx, rcx
    syscall

exit_program:
    mov rax, 0x3C
    mov rdi, 0x45
    syscall

section .data
    welcome_msg: db 'Enter your name: '
    welcome_msg_lenght: equ $-welcome_msg

    wassup: db 'sup, '
    wassup_lenght: equ $-wassup
section .bss
    input: resb 100

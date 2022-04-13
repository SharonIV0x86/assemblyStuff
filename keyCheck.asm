global _start

    SYS_READ equ 0
    SYS_WRITE equ 1
    STDIN equ 0
    STDOUT equ 1
    SYS_EXIT equ 60
section .text
_start:
    jmp main

main:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg_enter_input
    mov rdx, msg_enter_input_len
    syscall

    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, input_key
    mov rdx, 64
    syscall ;the input we have entered the syscall sends the input length to the rax register
    jmp compareData
compareData:
    ;cmp rax, original_key_len
    ;jne accessDenied
    mov rsi, original_key
    mov rdi, input_key
    mov rcx, original_key_len ;for how many times repe needs to be ran, the value needs to be stores in the rcx
    repe cmpsb
    je accessGranted
    jne accessDenied

accessGranted:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg_access_granted
    mov rdx, msg_access_granted_len
    syscall
    jmp exitPnt
accessDenied:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg_access_denied
    mov rdx, msg_access_denied_len
    syscall

exitPnt:
    mov rax, SYS_EXIT
    syscall


section .data
    msg_enter_input db 0x9, "Enter the key ~~~> ",0x10
    msg_enter_input_len equ $-msg_enter_input

    msg_access_granted db 0x9, "Key accepted! ", 0x10
    msg_access_granted_len equ $-msg_access_granted

    msg_access_denied db 0x9 ,"Key rejected! ", 0x10
    msg_access_denied_len equ $-msg_access_denied

    original_key db "SharonIV"
    original_key_len equ $-original_key
section .bss
    input_key: resb 64

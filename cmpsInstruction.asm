global _start

    SYS_READ equ 0
    SYS_WRITE equ 1
    SYS_EXIT equ 60
    STDIN equ 0
    STDOUT equ 1


section .text
_start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, str1
    mov rdx, str1LEN
    syscall

    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, string1
    mov rdx, 64
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, str2
    mov rdx, str2LEN
    syscall

    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, string2
    mov rdx, 64
    syscall

    jmp compareStrings

compareStrings:
    mov rsi, string1
    mov rdi, string2
    mov rcx, rax ;the last one, we made the user to enter input and when that finishes the lenght of the entered input goes in the rax, i assume
    repe cmpsb; to the repe instruction repeats the given instruction for the number of times as the value in rcx = 10 the repe will run 10 times
    je stringsMatcheD
    jne stringsDoNotMatch

stringsMatcheD:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, stringsMatched
    mov rdx, stringsMatchedLen
    syscall
    jmp exit

stringsDoNotMatch:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, stringsDontMatch
    mov rdx, stringsDontMatchLen
    syscall

exit:
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, string2
    mov rdx, 64
    syscall

    mov rax, SYS_EXIT
    mov rdi, 69;its just kinky exit code lol
    syscall

section .bss
    string1 resb 64
    string2 resb 64

section .data
    str1 db 0x9, "Enter the first string: "
    str1LEN equ $-str1

    str2 db 0x9, "Enter the second string: "
    str2LEN equ $-str2

    stringsMatched db 0x9, "STRINGS MATCHED!!poggers", 0x10
    stringsMatchedLen equ $-stringsMatched

    stringsDontMatch db 0x9, "STRINGS DO NOT MATCH!! sadge",0x10
    stringsDontMatchLen equ $-stringsDontMatch


;     string1inpLen equ $-string1

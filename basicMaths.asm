global main

;while linking --> ld -e <label name> file.o -o file
; ld -e main math.o -o maths

section .text

main:
    mov rax, 2
    add rax, 3

    mov rax, 2
    sub rax, 2

    mov rax, 6
    imul rbx, rax, 2; rbx is the destination where (rax x 2) answer will be stored

    mov rdx, 0
    mov rax, 100 ;the value that needs to be deivided should be in rax
    mov rbx, 2; and the other value for division should be in rbx
    idiv rbx
    ;ramainder will be stored in rdx in this case rdx == 0

_exit:
    mov rax, 60
    mov rdi, 11
    syscall
;according to rdx:rax = 0100
    ;0100 / 2 = 50 stored in rax and 2 was stored in rbx




;the way division work is like for need of division with big numbers

;the value of rax and rdx is combined together to form a single number rdx:rax

;example rax = 10 and rdx = 5

;then idiv rbx means rax / rdx

;the rbx will hold the value of 2

;and the remainder is stored back again in the rax


;suppose if you want to divide 100 by 2

;suppose mov rdx, 100
;suppose rax, 0

;rdx:rax = 1000 (and this is the order in which registers will be combined)

;when you do idiv rbx <-----
;the contents of rdx:rax will be combined and the value that becomes will be 1000
;your divisor becomes 1000 / 2 and you didnt wanted this


;SO if you want to divide 100 by 2

; you first need to do  mov  rdx, 0
;and then you can do    mov  rax, 100
                       ;idiv rbx

;upon this the rax and rdx register values will be combined to form one single digit

; so the value to be divided becomes 0100 which is basically just 100!
; and 100/2 = 50 will be stored in rax!



























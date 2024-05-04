TITLE Prog4_3.asm
.model small
.stack 100h
.data
    message db "Hello World!", "$"
.code
main proc
    mov dx, offset message
print_message:
    mov ah, 09h
    int 21h
    mov ah, 0
    int 21h
    mov ax, 4c00h
    int 21h
main endp
end main

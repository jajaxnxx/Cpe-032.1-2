TITLE or.asm
.model small
.stack 100h
.data
    myString db "Proud to be TIPians", "$"
.code
main proc
    mov ax, @data
    mov ds, ax
    mov bx, offset myString
LP1:
    mov dl, [bx]
    cmp dl, '$'
    je Exit
    or dl, 00100000B  ; Inserted line
    mov ah, 02h
    int 21h
    inc bx
    jmp LP1
Exit:
    mov ax, 4c00h
    int 21h
main endp
end main

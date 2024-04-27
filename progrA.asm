.model small
.stack 100h
.data
    prompt1 db 13,10,"Enter a character: $"
    prompt2 db 13,10,"The character you entered is: $"
.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, prompt1
    mov ah, 09h
    int 21h

    mov ah, 01h      ; Read a character from standard input
    int 21h
    mov bl, al       ; Store the character in BL

    lea dx, prompt2
    mov ah, 09h
    int 21h

    mov dl, bl       ; Load the character from BL
    mov ah, 02h      ; Display character
    int 21h

    mov ax, 4c00h    ; Exit program
    int 21h
main endp
end main

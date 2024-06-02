TITLE screen1.asm
.model small
.stack 100h
.data
.code
start:

    mov ax, 0600h
    mov bh, 0Ch
    mov cx, 0000h
    mov dx, 184Fh
    int 10h

    mov ah, 02h
    mov bh, 00h
    mov dh, 10h
    mov dl, 34h
    int 10h

    mov ah, 02h
    mov dl, 'T'
    int 21h

    mov ah, 02h
    mov dl, 'I'
    int 21h

    mov ah, 02h
    mov dl, 'P'
    int 21h

    mov ah, 4Ch
    int 21h

end start

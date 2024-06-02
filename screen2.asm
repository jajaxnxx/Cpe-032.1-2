TITLE screen2.asm
dosseg
.model small
.stack 100h
.data
.code
start:
    mov ax, 0b800h
    mov es, ax

    mov ah, 06h
    mov al, 00h
    mov bh, 20h
    mov ch, 00h
    mov cl, 00h
    mov dh, 18h
    mov dl, 18h
    int 10h

    mov ah, 06h
    mov al, 00h
    mov bh, 40h
    mov ch, 00h
    mov cl, 18h
    mov dh, 18h
    mov dl, 36h
    int 10h

    mov ah, 06h
    mov al, 00h
    mov bh, 10h
    mov ch, 00h
    mov cl, 36h
    mov dh, 18h
    mov dl, 4fh
    int 10h

    mov ah, 4Ch
    int 21h
end start

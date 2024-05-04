.model small
.stack 100h

.data
NUM db 03Dh

.code
MAIN PROC

    mov ax, @data
    mov ds, ax

    mov bl, NUM

    mov cx, 8

HERE:
    shr bl, 1
    jc IS

    mov dl, 30h
    jmp PRINT

IS:
    mov dl, 31h

PRINT:
    mov ah, 2
    int 21h

    loop HERE

EXIT:
    mov ax, 4c00h
    int 21h

MAIN ENDP
END MAIN
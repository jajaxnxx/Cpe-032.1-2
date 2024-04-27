
.model small
.stack 100h
.data
prompt1 db 13,10,"Hello, what's your name?$"
prompt2 db "Hello, $"
prompt3 db 13,10,"Congratulations! Your first program is working!$"
prompt4 db 24 dup("$"), 0 ; Ensure string is terminated with null character
prompt5 db 13,10,"$"
.code
Start:
    mov ax,@data
    mov ds,ax
    mov es,ax
    mov ah,00h
    int 10h
    mov dx,offset prompt1
    mov ah,09h
    int 21h
    mov ah,0Ah         ; Read string with newline into prompt4
    lea dx,prompt4
    int 21h
    mov dx,offset prompt5
    mov ah,09h
    int 21h
    mov dx,offset prompt2
    mov ah,09h
    int 21h
    mov si,2           ; Offset to start of string in prompt4
    lea dx,prompt4[si]
    mov ah,09h
    int 21h
    mov dx,offset prompt3
    mov ah,09h
    int 21h

    mov ah,4ch
    int 21h
end Start

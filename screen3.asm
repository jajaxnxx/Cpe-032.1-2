TITLE screen3.asm
.model small
.stack 100h
.code
start:
    mov ax, 0b800h
    mov es, ax

   ; Set Light Blue background
    mov ah, 06h
    mov cl, 00h  ; Display attribute
    mov dl, 13h  ; Starting column
    mov dh, 18h  ; Ending row
    mov bh, 17h  ; Attribute (Light Blue)
    int 10h

   ; Set Yellow background
   mov ah, 06h
   mov cl, 13h
   mov ch, 00h
   mov dl, 27h
   mov dh, 18h
   mov bh, 60h  ; Attribute (Yellow)
   int 10h

  ; Set Magenta background
  mov ah, 06h
  mov cl, 27h
  mov ch, 00h
  mov dl, 3bh
  mov dh, 18h
  mov bh, 50h  ; Attribute (Magenta)
  int 10h

  ; Set Cyan background
  mov ah, 06h
  mov al, 00h
  mov cl, 3bh
  mov ch, 00h
  mov dl, 4fh
  mov dh, 18h
  mov bh, 30h  ; Attribute (Cyan)
  int 10h

    ; Exit to DOS
    mov ah, 4Ch
    int 21h
end start

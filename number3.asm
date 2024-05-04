model small
.stack 100h
.data
.code
main PROC
 mov ax, 1234h
 and ax, 0FFFh
 or ax, 000Fh
 mov cx, 4
 mov bx, 1000h
print_loop:
 rol ax, 4
 mov dx, ax
 and dx, 000Fh
 add dl, 30h
 cmp dl, 3Ah
 jbe print_digit
 add dl, 7
print_digit:
 mov ah, 02h
 int 21h
 loop print_loop
 mov ax, 4C00h
 int 21h
main ENDP
END main
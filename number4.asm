model small
.stack 100h
.data
 result dw 0
.code
main PROC
 mov ax, @data
 mov ds, ax
 mov ax, 5
 shl ax, 3
 shl ax, 1
 mov result, ax
 mov ax, result
 call print_num
 mov ax, 4C00h
 int 21h
main ENDP
print_num PROC
 push ax
 mov bx, 10
 xor cx, cx
next_digit:
 xor dx, dx
 div bx
 push dx
 inc cx
 test ax, ax
 jnz next_digit
print_loop:
 pop dx
 add dl, '0'
 mov ah, 02h
 int 21h
 loop print_loop
 pop ax
 ret
print_num ENDP
END main
TITLE Multiply.asm
.model small
.stack 100h
.data
    multiplier db 50
    multiplicand db 10
    result dw ?

.code
main proc
    mov ax, 0          ; Clear AX register
    mov bx, 10         ; BX = 10 (multiplicand)
    mov cx, 50         ; CX = 50 (multiplier)
    mov dx, 0          ; Clear DX register for carry

multiply_loop:
    add ax, bx         ; Add multiplicand to result in AX
    jnc no_carry       ; Jump if no carry from addition
    inc dx             ; Increment DX if there's a carry
no_carry:
    loop multiply_loop ; Repeat loop until CX becomes 0

    mov result, ax     ; Store the result in the 'result' variable

    ; Display the result (optional)
    mov ah, 09h        ; Function to display string
    mov dx, offset result_str ; Load offset of result_str
    int 21h            ; Call interrupt to display string

    ; Exit program
    mov ah, 4ch        ; Function to terminate program
    int 21h            ; Call interrupt to terminate program
main endp

result_str db 'Result: $' ; String to display the result

end main

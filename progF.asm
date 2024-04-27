.model small
.stack 100h
.data
    buffer      db 80
    prompt      db 13, 10, "Enter a String: $"
    outputFmt   db 13, 10, "Result: $"
    outputMsg   db 160 dup(?) ; Message buffer for output (twice the length of the input string + 1 for termination)
.code
MAIN PROC
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov dx, offset prompt
    mov ah, 09h
    int 21h

    ; Read string input
    mov dx, offset buffer
    mov ah, 0ah
    int 21h

    ; Copy the entered string to the output message buffer
    mov si, offset buffer + 2   ; Skip the first two bytes (length and '$')
    mov di, offset outputMsg
    mov cx, [buffer + 1]        ; Move the length of the input string to CX
copyLoop:
    mov al, [si]                ; Load byte from input string
    mov [di], al                ; Store byte into output message buffer
    inc si                      ; Move to the next character in input string
    inc di                      ; Move to the next position in output message buffer
    loop copyLoop               ; Repeat until CX becomes zero

    ; Copy the entered string to the output message buffer again
    mov si, offset outputMsg    ; Reset source index to the start of the copied string
    add di, cx                  ; Move destination index to the end of the copied string
copyLoop2:
    mov al, [si]                ; Load byte from input string
    mov [di], al                ; Store byte into output message buffer
    inc si                      ; Move to the next character in input string
    inc di                      ; Move to the next position in output message buffer
    loop copyLoop2              ; Repeat until CX becomes zero

    ; Terminate the output message buffer
    mov byte ptr [di], '$'      ; Add a null terminator at the end

    ; Display the result
    mov dx, offset outputFmt
    mov ah, 09h
    int 21h

    mov dx, offset outputMsg
    mov ah, 09h
    int 21h

    ; Exit program
    mov ax, 4c00h
    int 21h
MAIN endp
end MAIN

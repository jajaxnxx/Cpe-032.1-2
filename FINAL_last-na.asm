.model large
.stack 1000h
.data

; Welcome page
a1 db 10,13,'                   ******************************************$'
a2 db 10,13,'                   **                 Welcome              **$'
a3 db 10,13,'                   **                    To                **$'
a4 db 10,13,'                   **            PLM"s Uniform Ordering    **$'
a5 db 10,13,'                   **                  System              **$'
a6 db 10,13,'                   ******************************************$'

namePrompt db 10,13,'                   Enter Your Name: $'
nameInput  db 24 dup("$") 

studentNoPrompt db 10,13,'                   Enter Your Student Number: $'
studentNoInput  db 24 dup("$")  

;choose
a7 db 10,13,'                    Gender---$'
a8 db 10,13,'                    Enter Your Choice: $'
a18 db 10,13,'                          Enter 1 to Display Gender: $'
a26 db 10,13,'                            Pick Your Item: $'
a27 db 10,13,'                            Enter Quantity: $'
a28 db 10,13,'                            Invalid Input !! Try again$'
a29 db 10,13,'                            Total Price: $'
a30 db 10,13,'                    1. Gender: $'
a31 db 10,13,'                    2. Exit: $'
a32 db 10,13,'Would you like to keep ordering? (y/n): $'
a33 db 10,13,'Proceeding to you ticket...$'
a34 db 10,13,'Overall Total: $'

a35 db 10,13,'                   ******************************************$'
a36 db 10,13,'                   PLM''s Uniform Ordering System$'
a37 db 10,13,'                   Ticket for:$'
a38 db 10,13,'                   Student Number:$'
a39 db 10,13,'                   Overall Total:$'
a40 db 10,13,'                   ******************************************$'

; Gender list
a9 db 10,13,'                        1. Male$'
a10 db 10,13,'                        2. Female$'


; Male Uniform List
a11 db 10,13,'                  ********      Male Uniform List      ********$'
a12 db 10,13,'                       1. Polo               100/-$'
a13 db 10,13,'                       2. Pants              100/-$'
a14 db 10,13,'                       3. Shoes              90/-$'
a15 db 10,13,'                       4. Patch              20/-$'
a16 db 10,13,'                       5. Socks              50/-$'
a17 db 10,13,'                       6. Sando              50/-$'


; Female Uniform List
a19 db 10,13,'                  ********     Female Uniform List     ********$'
a20 db 10,13,'                       1. Polo              100/-$'
a21 db 10,13,'                       2. Skirt             100/-$'
a22 db 10,13,'                       3. Black Shoes       90/-$'
a23 db 10,13,'                       4. Patch and Ribbon  30/-$'
a24 db 10,13,'                       5. Socks             50/-$'
a25 db 10,13,'                       6. Sando             50/-$'

 
total dw 0 
ones dw 0
tens dw 0
hundreds dw 0 
 
.code  
main proc

mov ax,@data
mov ds,ax

; Welcome page
mov ah,9
lea dx,a1
int 21h
lea dx,a2
int 21h
lea dx,a3
int 21h
lea dx,a4
int 21h
lea dx,a5
int 21h
lea dx,a6
int 21h

; Ask for name
mov ah,9
lea dx,namePrompt
int 21h

; Get name input
mov ah,0Ah  ; Buffered input
mov dx,offset nameInput
int 21h 

; Ask for student number
mov ah,9
lea dx,studentNoPrompt
int 21h

; Get student number input
mov ah,0Ah  ; Buffered input
mov dx,offset studentNoInput
int 21h

DisplayGender:
;new line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

; Take input to start
mov ah,9
lea dx,a18
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je Uniform
jmp Invalid1



Uniform:
; New line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

mov ah,9
lea dx,a7
int 21h
lea dx,a9
int 21h
lea dx,a10
int 21h

; List choose
lea dx,a8
int 21h

mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je Male

cmp bh,2
je Female

jmp Invalid2

; Uniform list
Male:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a11
int 21h

mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a12
int 21h
lea dx, a13
int 21h
lea dx, a14
int 21h
lea dx, a15
int 21h
lea dx, a16
int 21h
lea dx, a17
int 21h

; Condition checking
lea dx, a26
int 21h

mov ah, 1
int 21h
mov bl, al
sub bl, 48

cmp bl, 1
je Hundred

cmp bl, 2
je Hundred

cmp bl, 3
je Ninety

cmp bl, 4
je Twenty

cmp bl, 5
je Fifty

cmp bl, 6
je Fifty

jmp Invalid3



Female:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a19
int 21h

mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a20
int 21h
lea dx, a21
int 21h
lea dx, a22
int 21h
lea dx, a23
int 21h
lea dx, a24
int 21h
lea dx, a25
int 21h

; Condition checking
lea dx, a26
int 21h

mov ah, 1
int 21h
mov bl, al
sub bl, 48

cmp bl, 1
je Hundred

cmp bl, 2
je Hundred

cmp bl, 3
je Ninety

cmp bl, 4
je Thirty

cmp bl, 5
je Fifty

cmp bl, 6
je Fifty

jmp Invalid4



Twenty:
mov bl, 2
lea dx, a27
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48


cmp al, 1
jl invalid5
cmp al, 9
jg invalid5

mul bl 

add total, ax    


aam

mov cx, ax
add ch, 48
add cl, 48

lea dx, a29
mov ah, 9
int 21h

mov ah, 2
mov dl, ch
int 21h

mov dl, cl
int 21h

mov dl, '0'
int 21h

mov dl, 47
int 21h
mov dl, 45
int 21h

jmp ContinueOrdering


Thirty:
mov bl, 3
lea dx, a27
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48

cmp al, 1
jl invalid6
cmp al, 9
jg invalid6


mul bl 

add total, ax    


aam

mov cx, ax
add ch, 48
add cl, 48

lea dx, a29
mov ah, 9
int 21h

mov ah, 2
mov dl, ch
int 21h

mov dl, cl
int 21h

mov dl, '0'
int 21h

mov dl, 47
int 21h
mov dl, 45
int 21h

jmp ContinueOrdering 
 
 

Fifty:
mov bl, 5
lea dx, a27
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48

cmp al, 1
jl invalid7
cmp al, 9
jg invalid7

mul bl 

add total, ax    


aam

mov cx, ax
add ch, 48
add cl, 48

lea dx, a29
mov ah, 9
int 21h

mov ah, 2
mov dl, ch
int 21h

mov dl, cl
int 21h

mov dl, '0'
int 21h

mov dl, 47
int 21h
mov dl, 45
int 21h

jmp ContinueOrdering
                       
                       
                       
                       
Ninety:
mov bl, 9
lea dx, a27
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48

cmp al, 1
jl invalid8
cmp al, 9
jg invalid8

mul bl 

add total, ax    


aam

mov cx, ax
add ch, 48
add cl, 48

lea dx, a29
mov ah, 9
int 21h

mov ah, 2
mov dl, ch
int 21h

mov dl, cl
int 21h

mov dl, '0'
int 21h

mov dl, 47
int 21h
mov dl, 45
int 21h

jmp ContinueOrdering


Hundred:
mov bl, 10
lea dx, a27
mov ah, 9
int 21h

mov ah, 1
int 21h
sub al, 48

cmp al, 1
jl invalid9
cmp al, 9
jg invalid9

mul bl  


add total, ax    


aam
mov cx, ax
add ch, 48
add cl, 48

lea dx, a29
mov ah, 9
int 21h

mov ah, 2
mov dl, ch
int 21h

mov dl, cl
int 21h

mov dl, '0'
int 21h

mov dl, 47
int 21h
mov dl, 45
int 21h

jmp ContinueOrdering



ContinueOrdering:
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a34
int 21h

; Display total value
mov ax, total 

mov bx, 10
xor dx, dx   ; Clear DX before division
div bx       ; AX = 123 / 10 -> AX = 12 (quotient), DX = 3 (remainder)
mov ones, dx  ; Store the ones digit (3) from DX
add ones, 48

mov bx, 10
xor dx, dx   ; Clear DX before division
div bx       ; AX = 12 / 10 -> AX = 1 (quotient), DX = 2 (remainder)
mov tens, dx  ; Store the tens digit (2) from DX
add tens, 48

mov hundreds, ax 
add hundreds, 48


mov ah, 2
mov dx, hundreds
int 21h

mov dx, tens
int 21h

mov dx, ones
int 21h

mov dl, '0'
int 21h

mov dl, 47
int 21h
mov dl, 45
int 21h


ContinueOrdering2:
mov ah, 9
lea dx, a32
int 21h

mov ah, 1
int 21h
cmp al, 'y'
je Uniform

cmp al, 'n'
je DisplayTotal

jmp Invalid10


DisplayTotal:
mov ah, 9
lea dx, a33
int 21h

; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah,9
lea dx,a35
int 21h
lea dx,a36
int 21h
lea dx,a37
int 21h
mov si,002
lea dx,nameInput [SI]
int 21h
lea dx,a38
int 21h
mov si,002
lea dx,studentNoInput [SI]
int 21h
lea dx,a39
int 21h

; Display total value
mov ax, total 

mov bx, 10
xor dx, dx   ; Clear DX before division
div bx       ; AX = 123 / 10 -> AX = 12 (quotient), DX = 3 (remainder)
mov ones, dx  ; Store the ones digit (3) from DX
add ones, 48

mov bx, 10
xor dx, dx   ; Clear DX before division
div bx       ; AX = 12 / 10 -> AX = 1 (quotient), DX = 2 (remainder)
mov tens, dx  ; Store the tens digit (2) from DX
add tens, 48

mov hundreds, ax 
add hundreds, 48


mov ah, 2
mov dx, hundreds
int 21h

mov dx, tens
int 21h

mov dx, ones
int 21h

mov dl, '0'
int 21h


mov ah,9
lea dx,a40
int 21h

jmp Exit

Invalid1:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp DisplayGender

Invalid2:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp Uniform 


Invalid3:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp Male


Invalid4:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp Female

Invalid5:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp Twenty


Invalid6:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp Thirty

Invalid7:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp Fifty

Invalid8:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp Ninety

Invalid9:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp Hundred

Invalid10:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp ContinueOrdering2

Invalid:
; New line
mov ah, 2
mov dl, 0ah
int 21h
mov dl, 0dh
int 21h

mov ah, 9
lea dx, a28
int 21h
jmp Exit


Exit:
mov ah,4ch
int 21h
main endp
end main



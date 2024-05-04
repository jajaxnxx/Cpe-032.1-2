CDSEG SEGMENT
    MAIN PROC FAR
        MOV AX, CDSEG
        MOV DS, AX

        MOV AL, 0Fh
        AND AX, 0FFFh

        MOV AH, 02h
        INT 21h

        MOV AX, 4C00h
        INT 21h
    MAIN ENDP
CDSEG ENDS
END MAIN

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
;ALL THE VARIABLES WILL BE DECLARED HERE

    PROMPT DB "FACTORIAL OF : $"

    NUM DB ?

    STORE_AX DW ?
    STORE_DX DW ?
    
.CODE
    MAIN PROC
        
        ;LOADING DATA VARIALBLES
        MOV AX, @DATA
        MOV DS, AX

        ;PRINT PROMPT
        MOV AH, 9
        LEA DX, PROMPT
        INT 21H

        ;TAKE INPUT
        MOV AH, 1
        INT 21H

        MOV CX, 00
        MOV CL, AL

        FACTORIAL:
            MUL CX
            LOOP FACTORIAL
        
        

        ;PRINTING RESULT
        MOV STORE_DX, DX
        MOV STORE_AX, AX
        CALL PRINT_PRODUCT

        MOV AH, 4CH
        INT 21H
        MAIN ENDP

    PRINT_PRODUCT PROC
        
        MOV BX, STORE_DX
        CALL PRINT_HEX
        PRINT " "
        MOV BX, STORE_AX
        CALL PRINT_HEX
        RET
    
    PRINT_PRODUCT ENDP

    PRINT_HEX PROC

        MOV CX, 4
        MOV AH, 2

        PRINTING_HEX:
            MOV DL, BH
            SHR DL, 4
            SHL BX, 4

            CMP DL, 10
            JGE LETTER

            DIGIT:
            ADD DL, 48
            INT 21H
            JMP END_OF_LOOP

            LETTER:
            ADD DL, 55
            INT 21H

            END_OF_LOOP:
        LOOP PRINTING_HEX
        
        RET

    PRINT_HEX ENDP

    END MAIN
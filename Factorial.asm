INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
;ALL THE VARIABLES WILL BE DECLARED HERE

    PROMPT DB "FACTORIAL OF : $"

    NUM DB ?

    COUNT DB ?

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
        
        MOV AH, 00
        SUB AL, 30H

        MOV CX, 00
        MOV CL, AL
        
        MOV AX, 01
        MOV DX, 00

        FACTORIAL:
            CMP CX, 00
            JE END_FACTORIAL
            MUL CX
            LOOP FACTORIAL
        END_FACTORIAL:
        
        ;SAVING RESULT
        MOV STORE_DX, DX
        MOV STORE_AX, AX
        
        ;PRINT NEW LINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H    
        
        ;PRINTING RESULT
        CALL PRINT_PRODUCT

        PRINTN

        ;PRINTING DEC
        MOV BX, STORE_AX
        MOV DX, 00
        CALL DECIMAL_OUTPUT



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

    DECIMAL_OUTPUT PROC        

        MOV COUNT, 00
        
        MOV AX, BX
        MOV BX, 10

        DIVIDING_BY_TEN:
            MOV DX, 00
            DIV BX
            ADD DL, 48
            PUSH DX
            INC COUNT
            CMP AX, 0FH
            JG DIVIDING_BY_TEN
        
        CMP AX, 0AH
        JGE DOUBLE_NUMBERS    
        
        ADD AX, 30H
        PUSH AX
        INC COUNT
        JMP START_OF_PRINT_DEC
        
        DOUBLE_NUMBERS:
        CMP AX, 0FH
        JE PUSH_FIVE

        CMP AX, 0EH
        JE PUSH_FOUR

        CMP AX, 0DH
        JE PUSH_THREE

        CMP AX, 0CH
        JE PUSH_TWO

        CMP AX, 0BH
        JE PUSH_ONE
        
        CMP AX, 0AH
        JE PUSH_ZERO

        PUSH_FIVE:
        MOV AX, 35H
        PUSH AX
        INC COUNT
        JMP END_PUSH

        PUSH_FOUR:
        MOV AX, 34H
        PUSH AX
        INC COUNT
        JMP END_PUSH

        PUSH_THREE:
        MOV AX, 33H
        PUSH AX
        INC COUNT
        JMP END_PUSH

        PUSH_TWO:
        MOV AX, 32H
        PUSH AX
        INC COUNT
        JMP END_PUSH

        PUSH_ONE:
        MOV AX, 31H
        PUSH AX
        INC COUNT
        JMP END_PUSH

        PUSH_ZERO:
        MOV AX, 30H
        PUSH AX
        INC COUNT
        
        END_PUSH:
        MOV AX, 31H
        PUSH AX
        INC COUNT
                
        
        START_OF_PRINT_DEC:
        MOV CX, 0
        MOV CL, COUNT
        MOV AH, 2

        PRINT_DEC:
            POP DX
            INT 21H
        LOOP PRINT_DEC
        

        RET

    DECIMAL_OUTPUT ENDP

    END MAIN
.MODEL SMALL
.STACK 100H
.DATA
;ALL THE VARIABLES WILL BE DECLARED HERE
    PROMPT DB "ENTER N : $"
    SRS_SUM DW ?

    COUNT DB ?
    
.CODE
    MAIN PROC
        
        ;LOADING DATA VARIALBLES
        MOV AX, @DATA
        MOV DS, AX

        ;PRINT PROMPT
        MOV AH, 9
        LEA DX, PROMPT
        INT 21H

        CALL DECIMAL_INPUT

        MOV CH, 00
        MOV CL, DL

        MOV SRS_SUM, 00

        ;FIND SERIES SUM 1^2 + 2^2 + ... + N^2
        SERIES:
            MOV DX, 00
            MOV AX, CX
            MUL CX
            ADD SRS_SUM, AX
        LOOP SERIES

        MOV BX, SRS_SUM

        ;PRINT NEW LINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H

        CALL DECIMAL_OUTPUT

        MOV AH, 4CH
        INT 21H
        MAIN ENDP

        DECIMAL_INPUT PROC
            MOV BX, 0
            
            INPUT_DEC_DIGIT:
                MOV AH, 1
                INT 21H
                CMP AL, 0DH
                JE END_INPUT_DEC_DIGIT
                SUB AL, 30H
                MOV BL, AL
                MOV AL, 10
                MUL DL
                ADD AL, BL
                MOV DL, AL
                JMP INPUT_DEC_DIGIT

            END_INPUT_DEC_DIGIT:

            RET
        DECIMAL_INPUT ENDP

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
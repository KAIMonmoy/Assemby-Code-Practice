.MODEL SMALL
.STACK 200H
.DATA
;ALL THE VARIABLES WILL BE DECLARED HERE

    MSG1 DB "ENTER A HEX DIGIT: $"
    MSG2 DB "IN DECIMAL IT IS: $"
    HXN DB ?

.CODE
    MAIN PROC 
        ;LOADING DATA               
        MOV AX , @DATA
        MOV DS , AX
        
        ;PRINTING PROMT
        MOV AH , 9
        LEA DX , MSG1
        INT 21H

        ;SET INPUT MODE
        MOV AH, 1

        ;TAKE INPUT
        INT 21H
        MOV HXN, AL

        ;PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H

        ;PRINTING OUTPUT
        MOV AH , 9
        LEA DX , MSG2
        INT 21H
        
        
        
        MOV AH, 2
        
        ;COMPARE AND PRINT
        CMP HXN, 'A'
        JE PRINT_10
        
        CMP HXN, 'B'
        JE PRINT_11
        
        CMP HXN, 'C'
        JE PRINT_12
        
        CMP HXN, 'D'
        JE PRINT_13
        
        CMP HXN, 'E'
        JE PRINT_14
        
        CMP HXN, 'F'
        JE PRINT_15

        MOV AH, 2
        MOV DL, HXN
        INT 21H
        JMP END_PRINT

        PRINT_10:
            MOV DL, 31H
            INT 21H
            MOV DL, 30H
            INT 21H
            JMP END_PRINT
        PRINT_11:
            MOV DL, 31H
            INT 21H
            MOV DL, 31H
            INT 21H
            JMP END_PRINT
        PRINT_12:
            MOV DL, 31H
            INT 21H
            MOV DL, 32H
            INT 21H
            JMP END_PRINT
        PRINT_13:
            MOV DL, 31H
            INT 21H
            MOV DL, 33H
            INT 21H
            JMP END_PRINT
        PRINT_14:
            MOV DL, 31H
            INT 21H
            MOV DL, 34H
            INT 21H
            JMP END_PRINT
        PRINT_15:
            MOV DL, 31H
            INT 21H
            MOV DL, 35H
            INT 21H

        END_PRINT:
                    
                    
        
        MOV AH , 4CH
        INT 21H
        MAIN ENDP
    END MAIN
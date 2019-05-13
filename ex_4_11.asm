.MODEL SMALL
.STACK 200H
.DATA
;ALL THE VARIABLES WILL BE DECLARED HERE

    MSG DB "**********$"
    
.CODE
    MAIN PROC 
        ;LOADING DATA               
        MOV AX , @DATA
        MOV DS , AX
        
        ;COUNTER VARIABLE
        MOV CX, 10

        BOX_PRINT:
            ;PRINTING PROMT
            MOV AH , 9
            LEA DX , MSG
            INT 21H

            ;PRINT NEWLINE
            MOV AH, 2
            MOV DL, 0AH
            INT 21H
            MOV DL, 0DH
            INT 21H

            LOOP BOX_PRINT
                    
        MOV AH , 4CH
        INT 21H
        MAIN ENDP
    END MAIN
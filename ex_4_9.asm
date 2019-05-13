.MODEL SMALL
.STACK 200H
.DATA
;ALL THE VARIABLES WILL BE DECLARED HERE

    MSG DB "ENTER THREE INITIALS: $"
    FIRST DB ?
    MID DB ?
    LAST DB ?
    

.CODE
    MAIN PROC 
        ;LOADING DATA               
        MOV AX , @DATA
        MOV DS , AX
        
        ;PRINTING PROMT
        MOV AH , 9
        LEA DX , MSG
        INT 21H

        ;SET INPUT MODE
        MOV AH, 1

        ;TAKE INPUT
        INT 21H
        MOV FIRST, AL

        ;TAKE INPUT
        INT 21H
        MOV MID, AL

        ;TAKE INPUT
        INT 21H
        MOV LAST, AL

        ;SET OUTPUT MODE
        MOV AH, 2
        
        ;PRINT NEWLINE
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H

        ;PRINT INITIALS AND NEW LINES

        MOV DL, FIRST
        INT 21H
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H

        MOV DL, MID
        INT 21H
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H

        MOV DL, LAST
        INT 21H
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H



                    
                    
        
        MOV AH , 4CH
        INT 21H
        MAIN ENDP
    END MAIN
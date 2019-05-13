.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
        
        ;------ (a) display '?'
        
        ;SET OUTPUT MODE
        MOV AH, 2
        
        ;PRINT ?
        MOV DL, 3FH
        INT 21H
        
        ;PRINT NEW LINE
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        ;------ (b) input a,b such that X + Y < 10
        ;           display their sum
        
        ;SET input MODE
        MOV AH, 1
        
        ;TAKE INPUT
        INT 21H
        MOV BL, AL
        
        ;TAKE INPUT
        INT 21H
        MOV CL, AL
        
        ;SET OUTPUT MODE
        MOV AH, 2
        
        
        ;PRINT NEW LINE
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        ;PRINTING THE NUMBERS
        MOV DL, BL
        INT 21H
        MOV DL, 09H
        INT 21H
        MOV DL, CL
        INT 21H
        
        ;PRINT NEW LINE
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        ;ADDING NUMBERS
        ADD BL, CL
        SUB BL, 30H
        MOV DL, BL
        INT 21H
        
        
        MOV AH, 4CH
        INT 21H
        MAIN ENDP
    END MAIN
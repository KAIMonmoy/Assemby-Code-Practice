.MODEL SMALL
.STACK 200H
.DATA
;ALL THE VARIABLES WILL BE DECLARED HERE

    ;BH BL -  8 BITS REGISTER - 1 BYTE
    ;BX    - 16 BITS REGISTER - 1 WORD
    
    ;DB - DEFINE BYTE
    ;DW - DEFINE WORD
    
    NUM DB 48
    NUM2 DB ?
    CHAR DB '#'
    CHAR2 DB ?
    STR DB "HELLO, WORLD!$"
    

.CODE
;CODE SEGMENT
MAIN PROC ;INT MAIN
    ;CODE STATEMENT     
    ;INSTRUCTION DESTINATION , SOURCE     
    
    ;LOADING DATA               
    MOV AX , @DATA
    MOV DS , AX
    
    ;PRINTING
    MOV AH , 2
    MOV DL , NUM
    INT 21H
    
    
    ;PRINTING NEWLINE
    ;MOV AH , 2 - NO NEED TO CALL AGAIN
    MOV DL , 0AH
    INT 21H
    MOV DL , 0DH
    INT 21H    
    
    
    ;PRINTING
    ;MOV AH , 2 - NO NEED TO CALL AGAIN
    MOV DL , CHAR
    INT 21H
    
    ;PRINTING NEWLINE
    MOV DL , 0AH
    INT 21H
    MOV DL , 0DH
    INT 21H
    
    ;PRINTING STRING
    MOV AH , 9
    LEA DX , MSG
    INT 21H
                   
                   
    
    MOV AH , 4CH
    INT 21H
    MAIN ENDP
END MAIN ; RETURN 0
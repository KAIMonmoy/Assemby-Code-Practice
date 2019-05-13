.MODEL SMALL
.STACK 200H
.DATA
;ALL THE VARIABLES WILL BE DECLARED HERE

.CODE
    MAIN PROC 
        
        ;(a), (b), (c) like previous ex
        
        ;(D) Beeping
        MOV AH, 2
        MOV DL, 07H
        INT 21H
                    
                    
        
        MOV AH , 4CH
        INT 21H
        MAIN ENDP
    END MAIN
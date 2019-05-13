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
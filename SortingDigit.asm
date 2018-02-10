TITLE Sorting digits in ascending and descending order
.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH
    LF EQU 0AH
    MSG1 DB 'Enter an array of digits : ',CR,LF,'$'
    MSG2 DB CR,LF,'After sorting in ascending order : ',CR,LF,'$'
    MSG3 DB CR,LF,'After sorting in descending order : ',CR,LF,'$'
    MSG4 DB CR,LF,'No digits are entered.','$'
    DIGIT DB 100 DUP(?)
	LEN1 DW (0)

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,MSG1
    MOV AH,9
    INT 21H

    MOV BX,000H
    MOV SI,00H
	MOV DI,00H

INPUT:
	MOV AH,1
    INT 21H
    CMP AL,CR
    JE END_INPUT
    MOV DIGIT[SI],AL
    INC SI
    JMP INPUT

END_INPUT:
    MOV LEN1,SI
    MOV AH,2
    MOV DL,CR
    INT 21H
    MOV DL,LF
    INT 21H

    LEA DX,MSG2
    MOV AH,9
    INT 21H

    CMP SI,00H
    JE ASC

SORTING:
    MOV BL,DIGIT[SI]
    DEC SI
    CMP BL,DIGIT[SI]
    JGE SORTING
    XCHG BL,DIGIT[SI]
    INC SI
    MOV DIGIT[SI],BL
    DEC SI
    CMP SI,00H
    JE ASC
    JMP SORTING

ASC:
    MOV AH,2
    MOV DL,DIGIT[DI]
    INT 21H

    CMP DI,LEN1
	INC DI
    JL ASC

    LEA DX,MSG3
    MOV AH,9
    INT 21H

    INC DI

DESC:
    MOV AH,2
    MOV DL,DIGIT[DI]
    INT 21H

    CMP DI,00H
	DEC DI
    JG DESC

    JMP EXIT

NO_DIGITS:
    LEA DX,MSG4
    MOV AH,9
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
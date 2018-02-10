TITLE Series Summation
.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH
    LF EQU 0AH
    MSG1 DB 'Enter a number : ',CR,LF,'$'
    MSG2 DB CR,LF,'After Summation : ','$'
    NUM DB 100 DUP(?)
    SUM DB 00H

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H

    MOV AH,1
    INT 21H

    SUB AL,30H
    MOV BL,AL

    INC AL
    MUL BL
    MOV BL,2
    DIV BL
    MOV BL,AL

    LEA DX,MSG2
    MOV AH,9
    INT 21H

    ADD BL,30H
    MOV AH,2
    MOV DL,BL
    INT 21H

	MOV AH,4CH
	INT 21H

MAIN ENDP
END MAIN

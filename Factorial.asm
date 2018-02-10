TITLE An assembly language to find out factorial of given number
.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH
    LF EQU 0AH
    MSG1 DB 'Enter a Digit : ',CR,LF,'$'
    MSG2 DB CR,LF,'Factorial : ','$'
    MSG3 DB CR,LF,'Not a digit.','$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H

    MOV AH,1
    INT 21H
    CMP AL,'0'
    JL ILLEGAL
    CMP AL,'9'
    JG ILLEGAL

    SUB AL,30H
    MOV BL,AL
    MOV AL,01H

FACTORIAL:
    CMP BL,01H
    JLE OUTPUT
    MUL BL
    DEC BL
    JMP FACTORIAL

OUTPUT:
    MOV BL,AL
    LEA DX,MSG2
    MOV AH,9
    INT 21H

    ADD BL,30H
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
ILLEGAL:
    LEA DX,MSG3
    MOV AH,9
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
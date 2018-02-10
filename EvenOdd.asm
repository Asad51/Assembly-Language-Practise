TITLE An assembly language to find out whether the given number is odd or even
.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH
    LF EQU 0AH
    MSG1 DB 'Enter a digit : ',CR,LF,'$'
    MSG2 DB CR,LF,'The number is odd','$'
    MSG3 DB CR,LF,'The number is even','$'
    MSG4 DB CR,LF,'Not a Digit','$'

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
    MOV BL,02h
    DIV BL

    CMP AH,0001H
    JNE EVE

    LEA DX,MSG2
    MOV AH,9
    INT 21H

    JMP EXIT

EVE:
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    JMP EXIT

ILLEGAL:
    LEA DX,MSG4
    MOV AH,9
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN


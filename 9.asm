INCLUDE 'emu8086.inc'
.model small
.stack 100h
.data
VAL1 DB 0                             
.code
main PROC
    MOV AX, @data
    MOV DS, AX
    printn 'Enter the number of elements: '
    MOV AH,01H
    INT 21H
    SUB AL,30H
    XOR CX, CX
    MOV CL,AL
    MOV BL,AL
    MOV AL,00
    MOV VAL1,AL
    printn ''
    print 'Enter the numbers: '
    INPUT:
        MOV AH,01H
        INT 21H
        SUB AL,30H
        ADD AL,VAL1
        MOV VAL1,AL
    LOOP INPUT
    printn ''
    print 'Average of the numbers: '
    MOV AX,00
    MOV AL,VAL1
    DIV BL
    ADD AX,48
    MOV DX,AX
    MOV AH,02H
    INT 21H 
    MOV AH, 4ch
    INT 21h
    main ENDP
END main
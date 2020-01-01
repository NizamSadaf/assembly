INCLUDE 'emu8086.inc'
.model small
.stack 100h
.data                              
    M DB ?
    N DB ?
    P DB ?
    RES DB ? 
    rem db ?
.code
main PROC
    MOV AX, @data
    MOV DS, AX
    print 'Enter the value of M: '
    MOV AH, 1
    INT 21h
    SUB AL, 48
    MOV M, AL
    printn ''
    print 'Enter the value of N: '
    MOV AH, 1
    INT 21h
    SUB AL, 48
    MOV N, AL
    printn ''
    print 'Enter the value of P: '
    MOV AH, 1
    INT 21h
    SUB AL, 48
    MOV P, AL
    printn ''
    MOV RES, 0
    MOV BL, M
    ADD RES, BL
    MOV BL, N
    ADD RES, BL
    MOV BL, P
    SUB RES, BL
    INC RES
    MOV AL, RES
    print 'Result is: '
    mov ah,00
    MOV AL, RES
    mov bl,10
    div bl
    mov rem,ah
    mov dl,al
    add dl,48
    mov ah,2
    int 21h
    mov dl,rem
    add dl,48
    mov ah,2
    int 21h 
    MOV AH, 4ch
    INT 21h
    main ENDP
    
END main
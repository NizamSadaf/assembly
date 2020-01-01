INCLUDE 'emu8086.inc'
.model small
.stack 100h
.data                              
    N DB ?
    RES DB ?
    rem  DB ?
.code
main PROC
    MOV AX, @data
    MOV DS, AX
    print 'Enter the value of N: '
    MOV AH, 1
    INT 21h
    SUB AL, 48
    MOV N, AL
    printn ''
    MOV RES, 0
    XOR CX, CX
    MOV CL, N
    TASK:
        ADD RES, CL
    LOOP TASK
    mov ah,00
    MOV AL, RES
    print 'Sum of the series: '
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
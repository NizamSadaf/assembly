INCLUDE 'emu8086.inc'
.model small
.stack 100h
.data                              
    MESSAGE DB 100 DUP(?)    
    len db ?
.code
main PROC
    MOV AX, @data
    MOV DS, AX
    print 'Enter a Message: '
    MOV SI, OFFSET MESSAGE
    XOR CX, CX
    mov len,00
    TAKEINPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 13
        JE ENDOFINPUT
        INC CX
        MOV [SI], AL
        INC SI
        INC len
        JMP TAKEINPUT
    ENDOFINPUT:
        printn ''
        print 'Length of the string: '
        mov dl,len
        add dl,48
        mov ah,2
        int 21h
       MOV AH, 4ch
        INT 21h
    main ENDP  
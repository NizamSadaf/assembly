INCLUDE 'emu8086.inc'
.model small
.stack 100h
.data                              
    MESSAGE DB 100 DUP('$')
.code
main PROC
    MOV AX, @data
    MOV DS, AX
    print 'Enter a Message: '
    MOV SI, OFFSET MESSAGE
    TAKEINPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 13
        JE ENDOFINPUT
        MOV [SI], AL
        INC SI
        JMP TAKEINPUT
    ENDOFINPUT:
        printn ''
        print 'Enter the Value of N: '
        MOV AH, 1
        INT 21H  
        XOR CX, CX      
        MOV CL, AL
        sub CL, 30h
        printn ''  
        FOR:   
            MOV AH, 9
            LEA DX, MESSAGE
            INT 21H
            printn ''
        LOOP FOR         
        MOV AH, 4ch
        INT 21h
    main ENDP
END main
INCLUDE "emu8086.inc"
.model small
.stack 100h
.data
    array DB 5 dup('?') 
    small DB ?
.code  
main PROC
    MOV AX, @data
    MOV DS, AX
    print "Enter 5 Numbers: "
    MOV SI, OFFSET array
    MOV CX, 5
    @LOOP:
        MOV AH, 1
        INT 21h
        MOV [SI], AL
        print " "
        INC SI
        DEC CX
    JNZ @LOOP
    printn " "
    MOV SI, OFFSET array
    MOV CX, 4
    MOV BL, [SI]
    MOV small, BL
    INC SI
    @LOOP2:
        MOV BL, [SI]
        CMP small, BL
        JAE @SWAP
        @CONTINUE:
        INC SI
        DEC CX
    JNZ @LOOP2
    JMP @ENDTASK
    @SWAP:
        XCHG small, BL 
    JMP @CONTINUE
    @ENDTASK: 
    print "Smallest element: "
    MOV AH, 2
    MOV DL, small
    INT 21h
    MOV AH, 4ch
    INT 21h    
    main ENDP
END main
include "emu8086.inc"
.MODEL SMALL
.STACK 100H
.DATA
.CODE 
MAIN PROC 
   mov ah,2
   mov dl,65
   mov cx,26
   loop1:
   int 21h
   print " "
   inc dl
   dec cx
  jnz loop1
     MAIN ENDP
END MAIN
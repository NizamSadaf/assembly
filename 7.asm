.model small
.stack 100h
.data 
num db 0ah,0dh, "Enter Number: $"
even db 0ah,0dh, "Even Number $"      
odd db 0ah,0dh, "Odd Number $"
.code
main proc
    mov ax,@data
    mov ds,ax
    lea dx,num
    mov ah,9
    int 21h
    mov ah,1
    int 21h
    mov bl,2
    div bl
    cmp ah,00
    je evennumber 
    
oddnumber:    
    lea dx,odd
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
evennumber: 
    lea dx,even
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    
    
  
  
  main endp
end main
; multi-segment executable file template.

data segment
    g1 db "Grade A$"
    g2 db "Grade B$"
    g3 db "Grade C$"
    g4 db "Grade D$"
    newline db 13,10,24h  
    exit db "End of the program$"
    mark db 56d  
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax,@data
    mov ds,ax
    
    cmp [mark],85d
    jnae @elseif1
    
    cmp [mark],100d
    jnbe @elseif1
    
    @print1:
        lea dx,g1
        mov ah,09h
        int 21h
        jmp @end
    @elseif1:
        cmp [mark],80d
        jnae @elseif2
        
        @print2:
            lea dx,g2
            mov ah,09h
            int 21h
            jmp @end
    @elseif2:
        cmp [mark],70d
        jnae @else
        
        @print3:
            lea dx,g3
            mov ah,09h
            int 21h
            jmp @end 
      
    @else:
        lea dx,g4
        mov ah,09h
        int 21h
        jmp @end    
        
    @end:
        lea dx,newline
        mov ah,09h
        int 21h 
        
        lea dx,exit
        int 21h
        
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment
    ; add your data here!
    inp db "Enter a number: $"
    msg1 db "Its an even number $"
    msg2 db "Its an odd number $"
    newline db 13,10,24h
    num db ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax,@data
    mov ds, ax
    
    lea dx,inp
    mov ah,09h
    int 21h
    
    lea dx,newline
    int 21h
    
    mov ah,01h
    int 21h
    sub al,48d
    mov [num],al 
    
    lea dx,newline 
    mov ah,01h
    int 21h
    
    
    mov al,01h
    and al,[num]
    
    jz @even
    jnz @odd
    
    @even:
        lea dx,msg1
        mov ah,09h
        int 21h
        jmp @end
    @odd:
        lea dx,msg2
        mov ah,09h
        int 21h
    @end:  
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

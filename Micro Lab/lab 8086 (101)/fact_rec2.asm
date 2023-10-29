; multi-segment executable file template.

data segment
    ; add your data here!
    n dw 3
    o dw ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov ax, n
    push ax
    call fact
    hlt
    
    fact proc near
        
        push bp
        mov bp,sp
        
        mov bx,[bp+4] ;->n 
        
        cmp bx,0
        je if
        
        jmp else
        
        if:
            mov ax,1
            jmp return 
            
        else:
            sub bx,1
            push  bx
            call fact 
            
            mul [bp+4]
            
        return:
        
            pop bp
            ret 2
            fact endp  
            
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

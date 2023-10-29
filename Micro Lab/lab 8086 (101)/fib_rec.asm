; multi-segment executable file template.

data segment
    ; add your data here!
    n dw 6
    f dw ?
    
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

    mov si,offset n
    mov di,offset f
    
    mov ax,[si]
    push ax
    
    call fib
    
    mov [di],ax   
    
    hlt  
    
    fib proc near
        
        push bp
        mov bp,sp
        
        mov bx,[bp+4] ;n
        
        cmp bx,0
        je l1
        cmp bx,2
        jle l2
        
        mov cx,[bp+4]
        dec cx
        push cx 
        call fib
        push ax
        
        mov cx,[bp+4]
        sub cx,2
        push cx 
        call fib
        
        pop bx
        add ax,bx
        
        return:
            pop bp
            ret 2
            fib endp
        
        l1:
            mov ax,0
            jmp return
            
        l2:
            mov ax,1
            jmp return
        
          
ends

end start ; set entry point and stop the assembler.

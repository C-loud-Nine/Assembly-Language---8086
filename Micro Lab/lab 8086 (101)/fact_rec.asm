; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
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
    
    mov ax,5
    sub sp,2
    push ax
    call fact
    add sp,2
    pop ax
    hlt
    fact proc near  
        push bp
        
        mov bp,sp
        
        mov bx,[bp+4]
        
        mov ax,1
        cmp ax,bx
        jae term
        
        dec bx
        sub sp,2
        push bx
        call fact
        
        add sp,2
        pop ax
        mov bx,[bp+4]
        mul bx
        
        term:
            mov [bp+6],ax
            mov sp,bp
            pop bp
            ret
        
        
ends

end start ; set entry point and stop the assembler.

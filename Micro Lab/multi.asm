; multi-segment executable file template.

data segment
    ; add your data here!
    o_p db 10 dup(0)
ends

stack segment
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov ah,01h
    int 21h
                
                
    mov ah,0
    mov bh,0
    sub al ,30h
    
    mov o_p[0],al
    mov bl,2  
    mov si,01
    mov cx,9
    for_:
        mov al,o_p[0]
        mul bl
        mov o_p[si],al
        inc bl
        inc si
        loop for_
        
     
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

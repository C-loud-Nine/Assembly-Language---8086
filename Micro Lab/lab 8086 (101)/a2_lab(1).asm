
;Roll-2007101

data segment
    ; add your data here!    
    
    str db "MICROPROCESSOR$"
    
    
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
    
    mov dx,0
    mov si,0
    for_:
        
        cmp str[si],'a'
        je skip
        
        cmp str[si],'e'
        je skip
        
        cmp str[si],'i'
        je skip
        
        cmp str[si],'o'
        je skip
        
        cmp str[si],'u'
        je skip
        
        cmp str[si],'A'
        je skip
        
        cmp str[si],'E'
        je skip
        
        cmp str[si],'I'
        je skip
        
        cmp str[si],'O'
        je skip
        
        cmp str[si],'U'
        je skip 
        
        inc dx
        skip:
            inc si
            cmp str[si],'$'
            jne for_
    
    ;Output in dx register
    ;Note: Output
    add dx,30h
    mov ah,02h
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

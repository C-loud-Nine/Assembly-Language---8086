; multi-segment executable file template.

data segment
    ; add your data here!
    array db 21,5,31,2
    output db 0
    n dw 4 
    index dw 0
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    
    mov si,0
    
    mov cx,n
    
    mov output,0
    
    for_:
        
        mov al,output
        
        cmp al, array[si] 
        jge level
        mov al,array[si]
        mov output,al
        mov index,si
        
        level:
        inc si
        loop for_ 
        
    mov si,index
    mov array[si],0
    
        mov si,0
    
    mov cx,n
    
    mov output,0
    
    for_2:
        
        mov al,output
        
        cmp al, array[si] 
        jge level2
        mov al,array[si]
        mov output,al
        mov index,si
        
        level2:
        inc si
        loop for_2 
        
    
        
        
        
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

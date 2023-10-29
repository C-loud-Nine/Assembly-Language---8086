; multi-segment executable file template.

data segment
    ; add your data here!  
    print db "2007101$"
    fib db 10 dup(0)
    array db 5 dup(0)
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, @data
    mov ds, ax
    
    mov al,0
    mov bl,1
    mov fib[0],1
    mov si,1
    mov cx,10
    
    fib_: 
        add al,bl 
        mov fib[si],al
        mov dl,bl
        mov bl,al
        mov al,dl
        inc si
        loop fib_
        
     mov ah,fib[9]     
     
     cmp ah,30d
     
     jl less  
     
     mov cx,5 
     mov si,9
     mov di,0  
     
     copy_:
        
        mov al,fib[si]
        mov array[di],al
        
        inc di
        dec si
        
        loop copy_
        
     jmp end
     
     less:
        mov dx,0
        mov dx,offset print
        mov ah,09h
        int 21h
    end:
    mov cx,5
    mov si,0
    show_:
        
        mov al,array[si]
        inc si
        loop show_ 
     
ends

end start ; set entry point and stop the assembler.

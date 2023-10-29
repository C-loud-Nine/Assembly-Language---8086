; multi-segment executable file template.

data segment
    ; add your data here!
    array db "1010101$"
    ispal db ?
    pal db 10 dup('$') 
    msg1 db "Palindrome: ",13,10,24h
    msg2 db "Not palindrome: ",13,10,24h
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax,@data
    mov ds,ax
    
    mov si, 0
    mov di, 6 ;no of char in string -1
    
    for_:
        mov al,array[si]     
        cmp al,array[di]
       
        jne not_pal
        
        mov pal[si],al
        inc si
        dec di
        
        cmp si,di
        
        jl for_
         
        mov ispal,1 
        mov ah,09h
        lea dx,msg1
        int 21h
  
        lea dx,pal
        int 21h 
        jmp end
        
        not_pal:   
            mov ah,09h
            lea dx,msg2
            int 21h
            mov ispal,0 
            
        end:
        
    
ends

end start ; set entry point and stop the assembler.

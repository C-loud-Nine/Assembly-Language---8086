; multi-segment executable file template.

data segment
    ; add your data here!
    str1 db "Enter a string in lowercase: $"
    str2 db "The string in Uppercase: $" 
    newline db 13,10,24h
    arr db 10 dup('$')
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
    
    lea dx,str1
    mov ah,09h
    int 21h
    
    mov ah, 10
    lea dx,arr
    mov arr,10
    int 21h
      
    lea dx,newline
    mov ah,09h
    int 21h  
    
    lea dx,str2
    int 21h
    
    lea dx,newline
    int 21h 
     
    mov ch,0
    mov cl,arr[1]
    
    mov si,2
    mov ah,02h 
    
    for:
        mov dh,0
        mov bl,arr[si]
        cmp bl,'a'
        jnae level 
        cmp bl,'z'
        jnbe level
        
        sub bl,32d
        
        level:
        mov dl,bl
        int 21h 
        
        mov dl,' '
        int 21h 
         
        inc si
        loop for
        
    lea dx,newline
    mov ah,09h
    int 21h
  
    lea dx,arr+2
    mov ah,09h
    int 21h
    
   
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

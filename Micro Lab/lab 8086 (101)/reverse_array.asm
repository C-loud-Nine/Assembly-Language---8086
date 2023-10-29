; multi-segment executable file template.

data segment
    ; add your data here!   
    arr db 5 dup(0)
    str1 db "Enter array elements:$"
    str2 db "Displaying array elements in reverse order:$" 
    newline db 13,10,24h
                       
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    
    mov dx,offset str1
    mov ah,09h
    int 21h
    
    lea bx,arr
    mov ah,01h 
    mov si,0
    mov cx,5
    input:
         int 21h
         mov [bx+si],al
         inc si
         loop input
                              
    lea dx,newline
    mov ah,09h
    int 21h
    
    
    lea bx,arr
    mov si,0
    mov di,4
    reverse:
        mov dl,[bx+si]
        mov dh,[bx+di]
        mov [bx+si],dh
        mov [bx+di],dl
        inc si
        dec di
        
        cmp si,di
        jnae reverse
     
    lea dx,str2
    mov ah,09h
    int 21h 
        
    lea bx,arr
    mov ah,02h
    mov si,0
    mov cx,5
    
    output:
          mov dl,[bx+si]       
          int 21h
          inc si
          loop output
        
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

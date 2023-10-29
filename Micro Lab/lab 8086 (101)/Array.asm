; multi-segment executable file template.

data segment
    ; add your data here!   
    arr db 5 dup(0)
    str1 db "Enter array elements:$"
    str2 db "Displaying array elements:$" 
    newline db 13,10,24h
    
    total_sum db ?
    
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
    mov cx,5
    mov ah,01h
    mov dl,0
    input:
         int 21h
         mov [bx],al
         add dl,[bx]
         sub dl,48d
         inc bx
         loop input
    
    mov [total_sum],dl
    
    lea dx,newline
    mov ah,09h
    int 21h
    
    lea dx,str2
    int 21h
    
    lea bx,arr
    mov cx,5
    mov ah,02h
    output:
        mov dl,[bx]
        int 21h
        
        inc bx
        loop output
        
        
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

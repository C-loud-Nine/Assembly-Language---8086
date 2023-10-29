; multi-segment executable file template.

data segment
    ; add your data here!   
    arr db 12,9,10,4,2
    str1 db "The smallest number is:$"
    newline db 13,10,24h
    min db 0FFh   
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
    mov cx,5
    find: 
        mov dl,[min]
        cmp dl,arr[si]
        ja update
        jmp level
        update:
            mov dl,arr[si]
            mov [min],dl
        
        level: 
        inc si
        loop find
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

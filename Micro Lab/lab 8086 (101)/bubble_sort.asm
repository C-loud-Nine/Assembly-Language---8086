; multi-segment executable file template.

data segment
    ; add your data here!
    array db "sdscasd"
    n db 7 
    temp db ?
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

    ; add your code here
    mov al,n
    mov temp,al    
    dec temp
    
    mov ch,0
    mov cl,n
    dec cl
    
    outer_:
    
            mov si,0
            inner_: 
                mov al,array[si]
                cmp al,array[si+1]
                jg swap_
                jmp level
                swap_:
                    mov al,array[si]
                    mov ah,array[si+1]
                    mov array[si],ah
                    mov array[si+1],al
                level:
                    inc si
                    cmp si,word ptr temp
                    jne inner_   
                    
             dec temp
             loop outer_           
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

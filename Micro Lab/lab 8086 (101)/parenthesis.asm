; multi-segment executable file template.
 
 
data segment
    ; add your data here!
    str db "()())()()($"  
    
    msg1 db "Match$"
    msg2 db "Not match$"
    
ends
    
stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
     
     
     call parenthesis 
     
     hlt
     
     parenthesis proc near 
         mov ax,0
         mov ax,'$'
         push ax
         mov si,0
         for_:
            mov ax,0    
            mov al,str[si]
            cmp ax,'('
            
            je push_ch
            
            mov bx,0
            
            pop bx 
                          
            cmp bx,'('            
            je next
            
            jmp not_match
            
            push_ch: 
                mov ax,'('
                push ax 
            
            next:
                inc si
                
                cmp str[si],'$'
                
                jne for_  
            
            
            mov bh,0
            pop bx
            
            cmp bx,'$'
            jne not_match
            
            lea dx, msg1
            mov ah,09h
            int 21h
            
            jmp end
                
            not_match:
                mov dx,offset msg2
                mov ah,09h
                int 21h
                jmp end 
                
            end:
                ret 
                parenthesis endp
            
             
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment
    ; add your data here!
    str db "((a+b)*c)$" 
    post db 10 dup('$')
    flag db ?
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
    
    mov ax,0           
    mov bx,0
    mov cx,0
    mov dx,0           
               
    call post_fix
    
    post_fix proc
        
        mov si,0
        
        for_: 
            
            
            mov al,str[si]
            
            cmp al,'+'
            je operator1
            cmp al,'-'
            je operator2
            cmp al,'*'
            je operator3
            cmp al,'/'
            je operator4
            
            
            cmp al,'('
            je push_b
            
            
            operator1:
            
                op_cycle1:
                     cmp [sp],'('
                     jne  
            
            push_b:
                push '('
                jmp check
            concat:
                
                mov bl,str[si]
                mov post[si],bl
            
            check:
            inc si        
            cmp str[si],'$'
            jne for_
        
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

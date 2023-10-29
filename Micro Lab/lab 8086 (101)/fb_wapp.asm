; multi-segment executable file template.

data segment
    ; add your data here!
    m1 db "Main Menu$"
    m2 db 13,10,"Enter 1 for WhatsApp: $"
    m3 db 13,10,"Enter 2 for Facebook: $"
    m4 db 13,10,"Enter 1 to send WhatsApp Notification: $"
    m5 db 13,10,"Enter 2 to recieve WhatsApp Notification: $"
    m6 db 13,10,"Enter 1 to send Facebook Notification: $"
    m7 db 13,10,"Enter 2 to recieve Facebook Notification: $"
    m8 db 13,10,"Notification sent.$"
    m9 db 13,10,"Notification recieved.$"
    m10 db 13,10,"Bye..$"
    m11 db 13,10,"Do you want to continue [Y]\[N]: $"
    m12 db 13,10,"Invalid input...$"
    newline db 13,10,24h
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax,@data
    mov ds,ax
    
    
    main_:
    
        lea dx,m1 ;Main Menu
        mov ah,09h
        int 21h
        
        lea dx,m2
        int 21h  
        
        lea dx,m3
        int 21h
        
        lea dx,newline 
        int 21h
        
        mov ah,01h
        int 21h
        mov bl,al
        
        cmp bl,'1'
        je whatsapp
        cmp bl,'2'
        je facebook
        
        jmp invalid
         
        whatsapp:
                lea dx,m4
                mov ah,09h
                int 21h
                
                lea dx,m5
                int 21h
                
                lea dx,newline 
                int 21h
           inner:
                mov ah,01h
                int 21h
                mov bl,al
                
                cmp bl,'1'
                je sent
                cmp bl,'2'
                je recieved
                
                jmp invalid
                
                sent:
                    
                    lea dx,m8
                    mov ah,09h
                    int 21h 
                    
                    jmp check
                 
                recieved:    
                
                    lea dx,m9
                    mov ah,09h
                    int 21h 
                    
                    jmp check
                     
        
        facebook: 
                lea dx,m6
                mov ah,09h
                int 21h
                
                lea dx,m7
                int 21h
                
                lea dx,newline 
                int 21h
                
                jmp inner
   
   
    check:
    lea dx,m11
    mov ah,09h
    int 21h 
    
    lea dx,newline
    int 21h 
    
    mov ah,01h
    int 21h
    mov bl,al 
    
    lea dx,newline 
    mov ah,09h
    int 21h 
    
    cmp bl, 'Y'
    je main_
    cmp bl, 'y'
    je main_
    cmp bl, 'N'
    je end
    cmp bl, 'n'
    je end
    
    jmp invalid
    
    
    invalid:
           
           lea dx,m12
           mov ah,09h
           int 21h
           
           jmp end
     
    end:
       lea dx,m10
       mov ah,09h
       int 21h
               
                
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

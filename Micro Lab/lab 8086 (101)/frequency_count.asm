; multi-segment executable file template.

data segment
    ; add your data here!
    str db "choyanmitrabarua$"
    vowel db 5 dup(0)
    
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
    mov si,0
    mov ah,02h
    
    check_:
        
        cmp str[si],'a'
        je a
        cmp str[si],'e'
        je e
        cmp str[si],'i'
        je i
        cmp str[si],'o'
        je o
        cmp str[si],'u'
        je u
        jmp down
        
        a: 
            inc vowel[0]
            jmp down           
        e: 
            inc vowel[1]  
            jmp down
        i: 
            inc vowel[2]
 
            jmp down
        o:
            inc vowel[3]
            jmp down
        u:
            inc vowel[4] 
            jmp down
            
        down:
            cmp str[si],'$'
            je end
            inc si
            jmp check_
            
        end:
        
    mov si,0
    mov ah,02h
    mov ch,0h
    
    print_:
      
        cmp vowel[si],0   
        
        je exit
        mov cl,vowel[si]
        inner_:
            cmp si,0
            je print_a
            cmp si,1
            je print_e
            cmp si,2
            je print_i
            cmp si,3
            je print_o
            cmp si,4
            je print_u
            
            print_a:
                mov dl,'a'
                int 21h
                jmp level
            print_e:
                mov dl,'e'
                int 21h
                jmp level
            print_i:
                mov dl,'i'
                int 21h
                jmp level
            print_o:
                mov dl,'o'
                int 21h
                jmp level
            print_u:
                mov dl,'u'
                int 21h
                jmp level
             
            level:
                loop inner_
             
           exit: 
           
           inc si
           cmp si,4
           jle print_ 
                 
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment
    ; add your data here!
    array db 97, 69,3,1,0 ;consider the last 0 is a ending flag of an array
    p_sum db ? 
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
  
    
    mov si,0 
    
    
    find_:
    
    
    mov bl,2
    
    prime_: 
    
        mov ah,0h
        cmp bl,array[si]
        jnl yes_prime  
        
        mov al,array[si]
        div bl
        cmp ah,0h
        je not_prime  
        inc bl
        jmp prime_

    yes_prime:
        cmp array[si],1
        je  not_prime
          
        mov flag,1
        jmp out_
    not_prime:
        mov flag,0
        
    out_: 
    
        cmp flag,1
        jne level
        
        mov dl,array[si]
        add [p_sum],dl
        level:
        inc si
        cmp array[si],0
        jne find_
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

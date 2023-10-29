;Roll-2007101   


data segment
    ; add your data here!
    array db 1,2,1,2,3,2
    n dw 6
    val db 0
    count dw 1 
    maj dw ?
    not_found db "-1$"
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
    
    mov ax,n
    mov bx,2
    div bx
    mov maj,ax 
    
    mov si,0 
    for_:
         mov di,0
         
         for2_:
            cmp si,di
            je next  ;Don't count if si,di becomes equal otherwise self-counting will occur
            
            level:
            mov al,array[si]
            cmp al,array[di]
            jne next        ;if not matched jump to next element
            
            inc count       ;executes this code after matched 
            mov val,al      ;Let assume val is majority element
            mov bx,maj      
            cmp count,bx    ;comparing current count with majority element condition
            jge majority    ;jump if greater or equal
            
            next:
            inc di
            cmp di,n
            jl for2_ 
            
          mov val,0    ; Reset val
          mov count, 1 ; Reset the count for another number
           
          inc si
          cmp si,n 
          jl for_ 
          
    lea dx,not_found  ;If no majority element is found print this 'not_found' string
    mov ah,09h        
    int 21h           ;dos interrupt
    jmp end 
          
    majority:
         mov dl,val
         add dl,30h  ;integer to ascii convert
         mov ah,02h
         int 21h
         
    end: 
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

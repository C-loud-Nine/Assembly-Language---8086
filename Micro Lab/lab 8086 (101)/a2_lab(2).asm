
;Roll-2007101 

;The required output in output array
;To see the output properly please change the element number to a specific number
;and show as property to unsigned
data segment
    ; add your data here!
    array db 1,2,3,3,3,71,2,4
    output db 20 dup(0)
    n dw 8
    n2 dw 0
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
    
    for_:
         mov di,0
         
         cmp n2,0
         je next
         for2_:
            mov al,array[si]
            cmp al,output[di]
            je exist
            inc di
            cmp di,n2
            jl for2_
            
          next:
          mov al,array[si]
          mov di,n2
          mov output[di],al
          inc n2
          exist:
          
          inc si
          cmp si,n
          jl for_   
    

    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

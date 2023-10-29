; multi-segment executable file template.

.data
    str1 db "Enter divisor $ "
    str2 db 13,10,"Enter dividend $ "
    str3 db 13,10,"Quotient is $"
    str4 db 13,10,"Remainder is $"
    divisor db ?
    dividend db ?
    result dw ?
    

.code
main proc
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax 
    
    lea dx,str1
    call print 
    
    call getchar 
    call atoi 
    mov [divisor],al 
    
    lea dx,str2
    call print
    
    call getchar
    call atoi
    mov [dividend],al
    
    call divide 
    
    lea dx,str3
    call print 
    
    mov dh,0
    mov dl,byte ptr result[0]
    call itoa
    call putchar
    
    lea dx,str4
    call print
    
    mov dh,0
    mov dl,byte ptr result[1]
    call itoa
    call putchar 
     
    call exit  
     
endp



itoa proc
    add dl,30h
    
    ret 
    itoa endp

putchar proc
    mov ah,02h
    int 21h
    
    ret
    putchar endp

divide proc 
    mov ah,0
    mov al,[dividend]
    div [divisor]
    mov [result],ax    
    ret
    divide endp
 
atoi proc
     sub al,48d
     ret
     atoi endp 
 
print proc
    mov ah,09h
    int 21h
    ret 
    print endp
                                     
getchar proc
    mov ah,01h
    int 21h
    ret
    getchar endp
                 
exit proc
    mov ax, 4c00h ; exit to operating system.
    int 21h  
    ret
    exit endp

end main
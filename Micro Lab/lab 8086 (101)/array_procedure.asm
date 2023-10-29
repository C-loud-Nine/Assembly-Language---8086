; multi-segment executable file template.

.data
    str1 db "Enter the array element: $"
    str2 db 13,10,"The outpu: $"
    array db 10 dup(0)
    n dw 5h

.code
main proc
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax 
    
    lea dx,str1
    call print 
    
    mov ax,offset array
    push ax
    
    mov ax,[n]
    push ax
    
    call inp_array 
    
    lea dx,str2
    call print
    call out_array
     
    call exit  
     
endp

out_array proc
    push bp
    mov bp,sp
    mov bx,[bp+06]
    mov cx,[bp+04]
    
    output:
        mov dl,[bx]
        call putchar
        mov dl,' '
        call putchar
        inc bx
        loop output
        
      pop bp
      ret
      out_array endp

inp_array proc
    push bp
    mov bp,sp
    mov bx,[bp+06]
    mov cx,[bp+04]
    
    input:
        call getchar
        mov [bx],al
        inc bx
        loop input 
    
    pop bp   
    ret
    inp_array endp
 
itoa proc
    add dl,30h
    
    ret 
    itoa endp

putchar proc
    mov ah,02h
    int 21h
    
    ret
    putchar endp
 
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
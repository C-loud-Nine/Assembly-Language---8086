org 100h

.data

O_O db 10 dup(0) 

.code
mov al,5
mov si,1

mov cx,10


multiple:
        
         mov bl,al
         mul si  
         dec si
         mov O_O[si],al
         mov al,bl
         inc si 
         inc si
loop multiple

ret
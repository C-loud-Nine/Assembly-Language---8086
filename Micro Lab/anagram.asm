org 100h

mov ah,09h
mov dx, message

int 21h

message db "Hello$"

ret
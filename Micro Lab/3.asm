
org 100h
 
.data
str1 db "hello$"
str2 db "world$"
len1 dw ?
len2 dw ?
pos_msg db "True$",0
neg_msg db "False$",0

.code
mov si,0

sort: 

mov di,0

if: 
    mov al,str1[si]
    mov bl,str1[di]
    cmp al,bl
    jc swap
    jnc no_swap

swap:
    
    mov str1[si],bl
    mov str1[di],al
    inc di
    cmp str1[di],'$'
    jnz if
    jz incr
no_swap:
        inc di
    cmp str1[di],'$'
    jnz if
    jz incr

incr:
    inc si
    cmp str1[si],'$'
    jnz sort

mov len1,si
    
;sorting string 1

mov si,0

ssort: 

mov di,0

iif: 
    mov al,str2[si]
    mov bl,str2[di]
    cmp al,bl
    jc sswap
    jnc nno_swap

sswap:
    
    mov str2[si],bl
    mov str2[di],al
    inc di
    cmp str2[di],'$'
    jnz iif
    jz iincr
nno_swap:
        inc di
        cmp str2[di],'$'
        jnz iif
        jz iincr

iincr:
    inc si
    cmp str2[si],'$'
    jnz ssort

mov len2,si

;sorting string 2


mov si,0
mov di,0

skip_space:
           cmp str1[si],32
           jz skip
           jnz sskip_space
skip:
    inc si;
    jmp skip_space

sskip_space:
           cmp str2[di],32
           jz sskip
           jnz continue
sskip:
    inc di;
    jmp sskip_space    

;skipping spaces


continue:

mov ax,len1
mov bx,len2
sub ax,si
sub bx,di
cmp ax,bx
jz compare
jnz negative

compare:
       mov al,str1[si]
       mov bl,str2[di]
       cmp al,bl
       jz iiincr
       jnz negative

iiincr:
        inc si
        inc di
        cmp str1[si],'$'
        jnz compare

cmp si,len1
jz positive
jnz negative

positive:
        mov ah,9
        lea dx,pos_msg
        int 21h
        hlt
negative:
        mov ah,9
        lea dx,neg_msg
        int 21h
        hlt
ret
;comparing the strings 
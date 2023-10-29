


org 100h

.data
array db 0,0,0,1,2,3,0,'$'

.code

mov si,0
mov bl,array[si] 

max_element:
           cmp bl,array[si]
           jc swap
           jnc no_swap

swap:
     mov bl,array[si]
     inc si
     cmp array[si],'$'
     jnz max_element 

no_swap:
     inc si 
     cmp array[si],'$'
     jnz max_element
 
;max element in bl

mov cx,si 
mov si,0
mov dl,array[si]

second_max:
           cmp bl,array[si]
           jnz check
           jz no_swap_2
                     

check:
      cmp dl,array[si]
      jc swap_2
      jnc no_swap_2

swap_2:
       mov dl,array[si]
       inc si
       cmp si,cx
       jnz second_max 
     
no_swap_2:
          inc si
          cmp si,cx
          jnz second_max 

;second max element in dl
ret  
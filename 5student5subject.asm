org 100h  

jmp start

s1 db 1h, 2h, 3h, 4h, 5h  
s2 db 9h, 8h, 7h, 6h, 5h
s3 db 5h, 5h, 5h, 5h, 5h
s4 db 1h, 2h, 3h, 4h, 1h
s5 db 8h, 0h, 9h, 5h, 1h    

t1 db 00    
t2 db 00 
t3 db 00 
t4 db 00 
t5 db 00 

p1 db 00    
p2 db 00 
p3 db 00 
p4 db 00 
p5 db 00

r1 db 00    
r2 db 00 
r3 db 00 
r4 db 00 
r5 db 00

    
start:

    lea bx, s1
    call total
    mov t1, al
      
    lea bx, s2
    call total
    mov t2, al
    
    lea bx, s3
    call total
    mov t3, al          
              
    lea bx, s4
    call total
    mov t4, al
    
    lea bx, s5
    call total
    mov t5, al
    

    lea bx, s1
    call percent
    mov p1, al
      
    lea bx, s2
    call percent
    mov p2, al
    
    lea bx, s3
    call percent
    mov p3, al          
              
    lea bx, s4
    call percent
    mov p4, al
    
    lea bx, s5
    call percent
    mov p5, al
    
    
    mov ax, 0
    mov al, t1
    call rank
    mov r1, ah
    
    mov ax, 0
    mov al, t2
    call rank
    mov r2, ah
    
    mov ax, 0
    mov al, t3
    call rank
    mov r3, ah
    
    mov ax, 0
    mov al, t4
    call rank
    mov r4, ah
    
    mov ax, 0
    mov al, t5
    call rank
    mov r5, ah
    
ret


percent proc
    mov cx, 5
    mov ax, 0
    sumP:
    
      mov dl, [bx]
      add al, dl
      inc bx
    loop sumP
    mov cl, 5
    div cl
    ret
endp  

total proc
    mov cx, 5
    mov ax, 0
    sum:
        
        mov dl, [bx]
        add al, dl
        inc bx
    loop sum
    ret 
endp

rank proc
    
    lea bx, t1
    mov cx, 5
    ran:
        mov dl, [bx]
        cmp al, dl
        jnc here
        inc bx
        loop ran  
        ret
        
        here:
        inc bx
        inc ah
        loop ran
        ret
endp
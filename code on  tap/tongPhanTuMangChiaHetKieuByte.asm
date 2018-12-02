; tinh tong mang chi het cho so a
.model tiny
.stack 100h
.data
    tb  db 'tong = $'
    mang db 120,5,30,6,7,9,1
    tong db 0
.code
    proc main
        mov ax,@data
        mov ds,ax
        
        lea dx,tb
        mov ah,9
        int 21h
        
        
        mov cx, 7
        lea si, mang 
        ;--- so a 
        mov dl,3 
        ;--
        mov bl,0
        mov ah,0
        tinh: 
            
            mov bh,[si]
            mov al,bh
            div dl
            inc si
            cmp ah,0
            je tinhtong
            mov ah,0
            loop tinh
       tinhtong:
            cmp cx, 0
            je hienthi
            mov dh,tong
            add dh,bh
            mov tong,dh
            loop tinh
    
  hienthi:
  mov ah,0
    mov al,tong
    mov dl,10
    mov cx,0
    hienkq:
    div dl
    push ax
    inc cx
    cmp al,0
    je hien
    mov ah,0
    jmp hienkq
   
 hien:  
    pop ax
    mov dl,ah
    add dl,30h
    mov ah,2
    int 21h
    loop hien
 ra: 
    mov ah,76
    int 21h
 main endp 
    end main
    
        
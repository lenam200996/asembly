; tong phan tu chia het cho a kieu word
.model tiny
.stack 100h
.data
    tb db 'tong = $'
    mang dw 12,8,7,5,2,9,9,900
    tong dw 0
    
.code 
    proc main
        mov ax,@data
        mov ds,ax
        
        lea dx,tb
        mov ah,9      
        int 21h
        
        
        mov cx, 8
        lea si,mang
        mov ax,0
       ; mov dl,2
        tinh:
            ;-- so a
            mov bx,3
            ;----- 
            mov ax,0
            mov dx,0
            mov ax,[si]
           ; mov bx,ax
            
            div bx
            cmp dx,0
            je tinhtong
            add si,2
            loop tinh
        tinhtong:
            cmp cx,0
            je hien
            mov bx,[si]
            mov dx,0
            mov dx,tong
            add bx,dx
            mov tong ,bx
            add si,2
            loop tinh
        hien:
            mov bx,tong
            mov ax,bx
            mov dl,10
            hienkq:
            
            div dl
            push ax
            inc cx
            cmp al,0
            je hienthi
            mov ah,0
            jmp hienkq
        hienthi:
            pop ax
            mov dl,ah
            add dl,30h
            mov ah,2
            int 21h
            loop hienthi
     ra:
        mov ah,76
        int 21h
   main endp
    end main
            
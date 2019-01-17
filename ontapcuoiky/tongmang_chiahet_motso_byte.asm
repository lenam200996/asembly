.model tiny
.stack 100h
.data 
    mang db 4,88,12,3,1
    tong db 0
    thongbao db 'tong mang: $'
.code 
    proc main
        mov ax,@data
        mov ds,ax
        
        lea dx,thongbao
        mov ah,9
        int 21h
        
        lea si,mang
        mov cx,5
        
        mov dl,3 ; tong phan tu chia het cho ...
        
        duyetmang:
            mov al,[si]
            mov bh,al
            inc si
            mov bl,tong
            mov ah,0
            div dl
            cmp ah,0
            je tinh
            loop duyetmang
        tinh:
            cmp cx,0
            je hien
            add bh,bl
            mov tong ,bh
            loop duyetmang
        hien:
            mov al,tong
            mov ah,0
            mov bh,10
            
            chia:
                div bh
                push ax
                inc cx
                cmp al,0
                je hienkq
                mov ah,0
                jmp chia
        hienkq:
            pop ax
            mov dl,ah
            add dl,30h
            mov ah,2
            int 21h
            loop hienkq
     main endp
    end main
            
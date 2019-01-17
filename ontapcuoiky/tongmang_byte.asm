.model tiny
.stack 100h
.data
    mang db 1,2,3,4,205
    thongbao db 'tong mang: $'
    tong db 0
.code 
    proc main
        mov ax,@data
        mov ds,ax
        
        lea dx,thongbao
        mov ah,9
        int 21h
        
        
        lea si,mang
        mov cx,5
        mov bh,10
        
        duyetmang: 
            mov al,[si]
            mov bl,tong
            add al,bl
            mov tong ,al
            inc si
            loop duyetmang
        hien:
            mov al,tong
            mov ah,0
            
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
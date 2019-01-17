.model tiny
.stack 100h
.data
    mang dw 12,5,8,9,7,6666  
    thongbao db 'cac phan tu cua mang: $'
    tg dw 0
.code      
    proc main
        mov ax,@data
        mov ds,ax
          
          
        lea dx,thongbao
        mov ah,9
        int 21h
          
        lea si,mang
        mov cx,6
        mov bx,10
        
        duyetmang:
            
            mov ax,[si]
            add si,2
            mov tg,cx
            mov cx,0
            chia:
                mov dx,0
                div bx
                inc cx
                push dx
                cmp ax,0
                je hien
                jmp chia
            hien:
                pop dx
                mov ah,2
                add dl,30h
                int 21h
                loop hien
                mov dl,' ' ; khoang cach
                int 21h
                mov cx,tg
                loop duyetmang
main endp
    end main
        
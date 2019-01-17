.model tiny
.stack 100h
.data 
    mang dw 1,2,3,666,55d
    thongbao db 'tong mang: $'
    tong dw 0
.code
    proc main
        mov ax,@data
        mov ds,ax
        
        lea dx,thongbao
        mov ah,9
        int 21h
        
        lea si,mang
        mov cx,5
        mov bx,10
        
        duyetmang:
            mov ax,[si]
            mov dx,tong
            add ax,dx
            add si,2
            mov tong ,ax
            loop duyetmang
        hien:
            mov ax,tong
            mov dx,0
            
            chia:
                div bx
                push dx
                inc cx
                cmp ax,0
                je hienkq
                mov dx,0
                jmp chia
           hienkq:
                pop dx
                add dl,30h
                mov ah,2
                int 21h
                loop hienkq
      main endp 
    end main
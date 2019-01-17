.model tiny
.stack 100h
.data 
    mang dw 222,55,6,999,60
    thongbao db 'min mang: $'
    min dw 0
    
.code 
    proc main
        mov ax,@data
        mov ds,ax
        
        lea dx,thongbao
        mov ah,9
        int 21h
        
        lea si,mang
        mov ax,[si]
        mov min,ax
        add si,2
        
        mov bx,10
        mov cx,5
        
        duyetmang:
            mov ax,[si]
            add si,2
            mov dx,min
            cmp ax,dx
            jbe ganmin
            loop duyetmang
       ganmin:
            cmp cx,0
            je hien
            mov min,ax
            loop duyetmang
       hien:
            mov ax,min
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
               
            
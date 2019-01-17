.model tiny
.stack 100h
.data 
    mang dw 2,55,6,999,6
    thongbao db 'max mang: $'
    max dw 0
    
.code 
    proc main
        mov ax,@data
        mov ds,ax
        
        lea dx,thongbao
        mov ah,9
        int 21h
        
        lea si,mang
        mov bx,10
        mov cx,5
        
        duyetmang:
            mov ax,[si]
            add si,2
            mov dx,max
            cmp ax,dx
            jae ganmax
            loop duyetmang
       ganmax:
            cmp cx,0
            je hien
            mov max,ax
            loop duyetmang
       hien:
            mov ax,max
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
               
            
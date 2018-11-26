.model tiny
.stack 200h
.data
    tb1 db 'nhap so (word): $'
    tb2 db 13,10,'kieu hexa: $'
    so dw 0
.code
    proc main
        mov ax,@data
        mov ds,ax
        
        lea dx,tb1
        mov ah,9
        int 21h
        
        nhap:
            mov dx,0
            mov ah,1
            int 21h
            cmp al,13
            je convert
            sub al,30h
            mov ah,0
            mov bx,ax
            mov cx,10
            mov ax,so
            mul cx
            add ax,bx
            mov so,ax
            jmp nhap
        convert:
            lea dx,tb2
            mov ah,9
            int 21h
            mov bx,16
            mov ax,so
            mov cx,0
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
            cmp dx,9
            jbe hienso
            jmp hienkytu
       hienso:
            cmp cx,0
            je ra
            add dl,30h
            mov ah,2
            int 21h
            loop hienkq
      hienkytu:
            cmp cx,0
            je ra
            add dl,37h
            mov ah,2
            int 21h
            loop hienkq
     ra:    
        mov ah,76
        int 21h
 main endp
    end main
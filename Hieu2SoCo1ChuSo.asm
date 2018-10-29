.model tiny
.stack 100h
.data 
    st1 db 'nhap so thu nhat:$'
    st2 db 13,10,'nhap so thu hai:$'
    st3 db 13,10,'hieu hai so:=$'
    
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        ;hien tb1
        lea dx,st1
        mov ah,9
        int 21h
        
        ;nhap so 1
        mov ah,1
        int 21h
        
        mov bl,al ;cat ki tu vua nhap vao
        sub bl,30h ;doi ki tu sang so
        
        ;hien thi tb2
        lea dx,st2
        mov ah,9
        int 21h
        
        ;nhap so 2
        mov ah,1
        int 21h 
        sub al,30h ;doi ki tu sang so 
        mov cl,al
        
        ;hien thi tb3
        lea dx,st3
        mov ah,9
        int 21h
        
        ;kiem tra so1 va so2
        
        cmp bl,cl  ; so sanh so thu 1 vs so thu 2, neu lon hon hieu duong va nguoc lai
        jb hiensoam  ; ja > , jb < , je =, jae >= , jbe <=
        
        sub bl,cl ;lay so thu nhat trong bl - so thu 2 trong cl
                   ; ket qua cat vao bl
            mov dl,bl ;dua hieu ve dl de hien
            add dl,30h ;doi ki tu thanh so
            mov ah,2
            int 21h
            jmp ra 
        hiensoam:
            ;sub cl,bl
            ;hien thi dau -
            mov dl,'-'
            mov ah,2
            int 21h
            ;hien thi phan duong
            sub cl,bl  ;
            mov dl,cl
            add dl,30h
            mov ah,2
            int 21h
            jmp ra
               
         ra:
            mov ah,76
            int 21h
    main endp
    end main
.model tiny
.stack 100h
.data
    st1 db 'nhap so thu nhat: $'
    st2 db 13,10,'nhap so thu hai: $'
    st3 db 13,10,'Thuong hai so:= $'
    st4 db 13,10,'Du:= $'
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
                                                                         
        mov bl,al ;cat ki tu vua nhap vao bl
        sub bl,30h
        
        ;hien tb2                                             so 1: bh=0;bl=7
        lea dx,st2                                            ;so2: cl=3
        mov ah,9
        int 21h 
        
        ;nhap so 2
        mov ah,1
        int 21h
        
        ;chia
        mov cl,al ;cat so thu hai vao cl
        sub cl,30h 
        mov ax,bx
        mov ah,0
        div cl ;lay so thu nhat trong ax : so thu 2 trong cl
                ;ket qua du cat vao ah, thuong cat vao al
        
        mov bh,ah
        mov cl,al      ;huy
        
        ;hien tb3
        lea dx,st3
        mov ah,9
        int 21h
        
        ;hien thuong
        mov dl,cl      ;mov dl,al
        add dl,30h
        mov ah,2
        int 21h
        
        ;hien tb4
        lea dx,st4
        mov ah,9
        int 21h
        
        ;hien du
        mov dl,bh
        add dl,30h
        mov ah,2
        int 21h
        
        mov ah,76
        int 21h
     main endp
    end main
    
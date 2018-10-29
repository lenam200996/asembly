.model tiny
.stack 100h
.data 
    st1 db 'nhap so thu nhat:$'
    st2 db 13,10,'nhap so thu hai:$'
    st3 db 13,10,'Thuong hai so:=$'
    st4 db 13,10,'Du hai so:=$'
    
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
        sub bl,30h ;doi ki tu sang so
        
        ;hien thi tb2
        lea dx,st2
        mov ah,9
        int 21h
        
        ;nhap so 2
        mov ah,1
        int 21h 
        
        mov cl,al ;cat so thu 2 vao cl
        
        ;sub cl,30h ;doi ki tu sang so 
        mov ax,cx
        mov ah,0
        sub ax,30h
        div bl ;lay so thu nhat trong ax : so thu hai trong bl
                   ; ket qua cdu cat vao ah,thuong cat vao al
        
        mov bh,ah
        mov cl,al
        ;hien thi tb3
        ;lea dx,st3
        ;mov ah,9
        ;int 21h
        
        
        mov dl,cl ;dua tich ve dl de hien
        add dl,30h ;doi ki tu thanh so
        mov ah,2
        int 21h 
        
        ;hien thi tb4
        ;lea dx,st4
        ;mov ah,9
        ;int 21h
        
        mov dl,bh ;dua tich ve dl de hien
        add dl,30h ;doi ki tu thanh so
        mov ah,2
        int 21h 
        
            mov ah,76
            int 21h
    main endp
    end main
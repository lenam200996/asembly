.model tiny
.stack 100h
.data 
    st1 db 'nhap so thu nhat:$'
    st2 db 13,10,'nhap so thu hai:$'
    st3 db 13,10,'Tong hai so:=$'
    
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
        add bl,al ;lay so thu nhat trong bl + so thu 2 trong al
                   ; ket qua cat vao bl
        
        ;hien thi tb3
        lea dx,st3
        mov ah,9
        int 21h
        
        ;kiem tra tong la so co 1 hay 2 chu so
        cmp bl,10
        jae tachso
        ;truong hop nay la so co 1 chu so
        mov dl,bl ;dua tong ve dl de hien
        add dl,30h ;doi ki tu thanh so
        mov ah,2
        int 21h
        jmp ra
        ;truong hop nay tong co 2 chu so
        tachso:
            mov dl,31h ;dung de hien thi ki tu 1
            mov ah,2
            int 21h
            ;hien thi don vi     
            sub bl,10 ;tru 10 de lay hang don vi
            mov dl,bl
            add dl,30h
            mov ah,2
            int 21h
         ra:
            mov ah,76
            int 21h
    main endp
    end main
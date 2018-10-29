.model tiny
.data
    st1 db 'Nhap xau: $'
    st2 db 13,10,'Xau vua nhap la: $' 
    st3 db 13,10,'So ki tu trong xau = $'
    xau db 100 dup(0)
.code
    main proc 
        mov ax,@data
        mov ds,ax
        
        ;hien tb1
        lea dx,st1
        mov ah,9
        int 21h
        
        ;nhap xau
        lea si,xau
        mov cx,0
        mov bx,0
        nhap:
            mov ah,1
            int 21h
            cmp al,13
            je hien
            mov [si],al
            inc si
            inc cx
            inc bx
            jmp nhap
        
        ;hien xau 
       
        ;hien so ki tu 
        hien:
        lea dx,st3
        mov ah,9
        int 21h
        
        ;hien
        mov dl,bl
        add dl,30h
        mov ah,2
        int 21h
        
        ra:
            mov ah,76
            int 21h
        main endp
    end main
        
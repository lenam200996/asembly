.model tiny
.data
    st1 db 'Nhap xau: $'
    st2 db 13,10,'Ki tu: $' 
    st3 db 13,10,'So lan xuat hien: $'
    tg db 0
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
        mov bL,0
        nhap:
            mov ah,1
            int 21h
            cmp al,13
            je thongbao
            mov [si],al
            inc si
            inc cx
            inc bl
            jmp nhap
        
        ;hien xau 
        thongbao:
            lea dx,st2
            mov ah,9
            int 21h
            
            
            lea si,xau
            ;doc xau
            docxau:
                mov bl,[si]
                mov tg,bl
                mov dl,[si]
                mov ah,2
                int 21h
                inc si
                ;loop docxau 
        ;hien so ki tu
        lea dx,st3
        mov ah,9
        int 21h
        mov bl,0 
        
        lea si,xau
        dem:
        inc si
        mov al,[si]
        cmp tg,al
        je cong
        inc si
        loop  dem
        cong:   
            inc bl
        loop dem
        
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
        
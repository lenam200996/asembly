.model tiny
.data
    st1 db 'Nhap xau: $'
    st2 db 13,10,'Xau viet hoa: $' 
    st3 db 13,10,'Xau viet thuong: $'
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
        nhap:
            mov ah,1
            int 21h
            cmp al,13
            je hienxauhoa
            mov [si],al
            inc si
            inc cx
            jmp nhap
        
        
        ;hien xau hoa 
        hienxauhoa:
            lea dx,st2
            mov ah,9
            int 21h
            
            mov bx,cx
            lea si,xau
            ;doc xau
            docxauhoa:
                mov al,[si]
                cmp al,97
                jb hien1
                sub al,20h
                hien1:
                    mov dl,al
                    mov ah,2
                    int 21h
                    inc si
                    loop docxauhoa
        
        ;hien xau thuong
         
        hienxauthuong:
            lea dx,st3
            mov ah,9
            int 21h
            
            mov cx,bx
            lea si,xau
            ;doc xau
            docxauthuong:
                mov al,[si]
                cmp al,97
                jae hien2
                add al,20h
                hien2:
                    mov dl,al
                    mov ah,2
                    int 21h
                    inc si
                    loop docxauthuong
        ra:
            mov ah,76
            int 21h
        main endp
    end main
            `
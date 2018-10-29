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
            je hienxauthuong
            mov [si],al
            inc si
            inc cx
            jmp nhap
        
         
        hienxauthuong:
            lea dx,st3
            mov ah,9
            int 21h
            
            mov bx,cx
            lea si,xau
            ;doc xau
            docxauthuong:
                mov al,[si]
                
                hien2:  
                
                    mov dl,al
                    mov ah,2
                    int 21h
                    inc si
                    loop docxauthuong  
                    
        ;hien xau hoa 
        hienxauhoa:
            lea dx,st2
            mov ah,9
            int 21h
            
            mov cx,bx
            lea si,xau 
            
            ;doc xau
            docxauhoa:
                mov al,[si]
                ;----------------

                cmp al,123
                jae hien1
                cmp al,96
                jbe cov1
                 ;-------
                
                sub al,20h
                hien1:
                    cmp cx,0
                    je ra
                    mov dl,al
                    mov ah,2
                    int 21h
                    inc si
                    loop docxauhoa
                         
                         
               cov1:
                cmp al,91
                jae hien1
                cmp al,64
                jbe hien1
                   
        
        
        ra:
            mov ah,76
            int 21h
        main endp
    end main
            `
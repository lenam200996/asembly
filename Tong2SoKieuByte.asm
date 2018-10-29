.model tiny
.stack 100h
.data
    st1 db 'nhap so thu nhat: $'
    st2 db 13,10,'nhap so thu hai: $'
    st3 db 13,10,'Tong hai so = $'
    so1 db 0
    so2 db 0
.code
    main proc 
        mov ax,@data
        mov ds,ax
        
        ;hien tb1
        lea dx,st1
        mov ah,9
        int 21h
        nhapso1:
            mov ah,1
            int 21h
            cmp al,13
            je nhapso2
            sub al,30h
            mov bl,al
            mov al,so1
            mov cl,10
            mul cl
            add al,bl
            mov so1,al
            jmp nhapso1
            
        nhapso2:
            lea dx,st2
            mov ah,9
            int 21h
            
            nhap:
                mov ah,1
                int 21h
                cmp al,13
                je tinhtong
                sub al,30h
                mov bl,al
                mov al,so2
                mov cl,10
                mul cl
                add al,bl
                mov so2,al
                jmp nhap
         
         tinhtong:
            lea dx,st3
            mov ah,9
            int 21h
            
            mov al,so1
            mov bl,so2
            add al,bl
            mov bl,10
            mov ah,0
            mov cx,0
            
            chia:
                div bl
                push ax
                inc cx
                cmp al,0
                je hienso
                mov ah,0
                jmp chia
                
                hienso:
                    pop ax
                    mov dl,ah
                    add dl,30h
                    mov ah,2
                    int 21h
                    loop hienso
                    
          ra: 
            mov ah,76
            int 21h
     main endp
    end main
              
.model tiny
.stack 100h
.data 
    tb1 db 'nhap mang : $'
    tb2 db 13,10,'tong so phan tu chia het cho 2 la: $'
    array db 1,2,3,4,5,6,7,8,9,10
    kq db 0
.code 
    main proc
        mov ax,@data
        mov ds,ax
        ;tinh tong mang
        lea dx,tb2
        mov ah,9
        int 21h
        lea si,array 
        
        mov dh,2
        mov cx, 10
        mov ah,0  
        mov bl, 0
        ;-------
        tinh: 
            mov al,[si]  
            mov ah, 0
            div dh
            cmp ah,0
            je tinhtong
            inc si
            mov ah,0
            cmp cx,0
            je hienkq 
            loop tinh
        tinhtong: 
            cmp cx,0
            je hienkq
            mov al,[si]
            mov ah,0
            ;mov bl, kq         
            add kq,al
            ;mov kq, bl            
            inc si
            loop tinh
        hienkq:
            mov al,kq
            mov ah,0
            mov dh,10
            div dh
            mov bl,ah
            mov dl,al
            add dl,30h
            mov ah,2
            int 21h
            mov dl,bl
            add dl,30h
            int 21h
        ra: 
            main endp
            end main
            
            
            
        
 
        
            
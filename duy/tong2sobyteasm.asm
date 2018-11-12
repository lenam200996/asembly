.model small
.stack 100h
.data
 tb1 db 'nhap vao so thu nhat kieu byte: $'      ;
 tb2 db 13,10,'nhap vao so thu hai kieu byte: $'      ;
 tb3 db 13,10 ,'tong cua hai so kieu byte la : $';  
 so1 db 0
 so2 db 0

.code
    main proc
        
        
        mov ax,@data
        mov ds,ax
        ;hientb1
        lea dx,tb1
        mov ah, 9
        int 21h 
        
        ;nhap so thu nhat:
        nhapso1:        mov ah, 1
                        int 21h
                        cmp al,13
                        je hientb2
                        sub al, 30h
                        mov bl,al
                        mov al,so1
                        mov cl ,10
                        mul cl
                        add al,bl
                        mov so1,al
                        jmp nhapso1
        
        hientb2:
                         lea dx,tb2
                         mov ah,9
                         int 21h
                     
        nhapso2:        mov ah, 1
                        int 21h
                        cmp al,13
                        je hientb3
                        sub al, 30h
                        mov bl,al
                        mov al,so2
                        mov cl ,10
                        mul cl
                        add al,bl
                        mov so2,al
                        jmp nhapso2 
     
        hientb3:        lea dx,tb3
                        mov ah,9
                        int 21h
            
        tinhtong:       mov al,so1
                        mov bl,so2
                        add al,bl  ;al=so1+so2
                
        tachso:         mov bl,10; chia 10
                        mov cx,0; tinhsolanlap
                        mov ah,0; xoa bit cao
                        
             chia:      div bl ;lay tong trong al chia 10
                        push ax;day vao stack
                        inc cx;tang so lan lap len 1
                        cmp al,0
                        je hienso
                        mov ah,0; gan de chia la bit cao
                        jmp chia
                        
         hienso:        pop ax ;lay du lieu tu stack ra cho ax
                        mov dl,ah
                        add dl,30h
                        mov ah,2
                        int 21h
                        loop hienso       
                        
                        
                        
                        
                             
        
        
        mov ah,76
        int 21h
    main endp
 end main
.model small
.stack 100h
.data 
 tb1 db 'Nhap vao so 1 kieu byte $' 
 tb2 db 13,10,'Nhap vao so 2 kieu byte $'
 tb3 db 13,10,'Tong cua hai so la $'
 so1 db 0
 so2 db 0

.code
    main proc
        mov ax,@data
        mov ds,ax
       ;hien thong bao 1
       lea dx,tb1
       mov ah,9
       int 21h
       
       ;nhap so
       
    nhapso1:   mov ah,1
               int 21h
               cmp al, 13
               je nhapso2
               sub al,30h
               ;mov ah,0
               mov bl,al
               mov al, so1
               mov cl ,10
               mul cl
               add al,bl
               mov so1,al
               jmp nhapso1
               
               
               
               
               
               
     nhapso2:  
               lea dx,tb2
               mov ah,9
               int 21h
               
           nhapso:     mov ah,1
                       int 21h
                       cmp al,13
                       je tinhtong
                       sub al,30h
                       ;mov ah,0
                       mov bl, al
                       mov al,so2
                       mov cl,10
                       mul cl
                       add al,bl    
                       mov so2,al
                       jmp nhapso
      
      tinhtong: ;hien thong bao 3
                lea dx,tb3
                mov ah,9
                int 21h
                
                mov al,so1
                mov bl,so2
                add al,bl
                
                
                ;tach so de chia
                 mov ah,0
                 mov bl,10
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
                 
                 
                 
                 
                 
                 
                 
                 
        
        mov ah ,76
        int 21h
    main endp
  end main
        
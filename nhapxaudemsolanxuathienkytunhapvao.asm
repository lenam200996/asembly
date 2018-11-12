.model tiny
.stack 200h
.data 
    tb1 db 13,10,'nhap xau: $'
    tb2 db 13,10,'nhap ky tu can dem: $'
    tb3 db 13,10,'so lan xuat hien: $'
    xau db 100 dup(?)
.code
    main proc
       mov ax,@data
       mov ds,ax
    ;=-----nhap xau ----
       lea dx,tb1
       mov ah,9
       int 21h
       lea si,xau
       mov cx,0 
       mov bl,0
       mov bh,0
       nhap:
        mov ah,1
        int 21h
        cmp al,13
        je nhapkytu
        mov [si],al
        inc cx
        inc si
        jmp nhap
     ;-----nhap ky tu dem----
     
       nhapkytu:
       lea dx,tb2
       mov ah,9
       int 21h
       mov ah,1
       int 21h
        
     ;----dem--- 
        lea si,xau
        dem:
           cmp [si],al
           je tang
           inc si 
           cmp cx,0
           je hien
           loop dem
        tang:
           cmp cx,0
           je hien
           cmp bl,9
           je convert
           inc bl
           inc si
           loop dem
               
      ;----
      convert:
        cmp cx,0
        je hien
        mov bl,0
        inc bh
        inc si
        loop dem
      ;----hien
      hien:
       lea dx,tb3
       mov ah,9
       int 21h
       mov dl,bh
       add dl,30h
       mov ah,2
       int 21h
       mov dl,bl
       add dl,30h
       int 21h
      ra: 
      mov ah,76
      int 21h
main endp
end main
           
           
       
        
         
       
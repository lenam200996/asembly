.model tiny
.stack 100h
.data
        tb1 db 'Nhap vao so thu nhat: $'
        tb2  db 13,10,'Nhap vao so thu hai: $'
        tb3 db 13,10,'Hieu 2 so vua nhap la: $'  
        a db ?
        b db ?
        hieu db ?
.code
    main proc
        mov ax,@data
        mov ds,ax
        ;chuong trinh
        
        ; hienthitb1
        mov ah,9
        lea dx,tb1
        int 21h
        
        ;nhap so 1
        mov ah,1
        int 21h
        sub al,30h
        mov a,al
        
        ;hien thi thong bao thu 2
         mov ah, 9
         lea dx,tb2
         int 21h
         
        ;nhap so thu 2
         mov ah,1
         int 21h
         sub al, 30h
         mov b,al
                 
        ; tinh hieu
        mov al, a
        sub al,b
        mov hieu,al
                 
        ;thong bao 3
        mov ah,9
        lea dx,tb3
        int 21h
        
        ;hien hieu 2 so
        
        mov ah,2
        mov dl,hieu
        int 21h
        
        
        
        
        mov ah,76
        int 21h 
    main endp
   
 end main
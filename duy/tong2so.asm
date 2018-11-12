.model small
.stack 100h
.data 
    tb1 db 'Nhap a: $'
    tb2 db 13,10,'Nhap b: $'
    tb3 db 13,10,'Ket qua: $'
    a db ?
    b db ?
    tong db 0
   
 
.code
    main proc
        mov ax,@data
        mov ds,ax
        
         
        ;hientb1
        mov ah,9 
        lea dx,tb1
        int 21h 
        
        ;nhap so 1:
        mov ah,1
        int 21h  
        sub al,30h   
        mov a,al 
        
          
        
        ;hienthitb2  
        mov ah,9
        lea dx,tb2
        int 21h
        
        ;nhapso2
        mov ah,1 
        int 21h 
        sub al,30h   
        mov b,al 
       
        
        ;tinhtong
        mov al,a
        add al ,b
        mov tong,al 
       
        
        ;thong bao tong
        mov ah, 9
        lea dx,tb3
        int 21h
         
         mov ah,2
         mov dl,tong
         add dl,30h
         int 21h
        
        
        
        mov ah,76
        int 21h
        main  endp
    end main
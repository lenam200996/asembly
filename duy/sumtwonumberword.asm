.model small
.stack 100h
.data    
    tb1 db 'nhap vao so thu 1 kieu word  $'
    tb2 db 13,10,'Nhap vao so thu 2 kieu word $'
    tb3 db 13,10,'tong cua 2 so la $'
    so1 dw 0
    so2 dw 0
    sum dw 0

.code
    main proc
        mov ax, @data
        mov ds,ax
                 
        ;hien thong bao 1
        lea dx,tb1
        mov ah, 9
        int 21h  
        
        ;nhap so
        
    nhapso1:    mov ah,1
                int 21h
                cmp al,13
                je nhapso2
                sub al, 30h
                mov ah, 0
                mov bx,ax
                mov ax, so1
                mov cx,10
                mul cx
                add ax,bx
                mov so1,ax
                jmp nhapso1       
                         
                 
     nhapso2:   ;hien thong bao nhap so 2
                lea dx,tb2
                mov ah,9
                int 21h     
         nhap2: ;nhapso2
                mov ah,1
                int 21h
                cmp al,13
                je tinhtong
                sub al,30h
                mov ah,0        
                mov bx, ax
                mov ax,so2
                mov cx,10
                mul cx
                add ax,bx
                mov so2,ax
                jmp nhap2
              
              
     tinhtong:  
             ;hien thong bao 3
                   lea dx,tb3
                   mov ah,9
                   int 21h         
                
             tong:
                  mov ax,so1
                  mov bx,so2
                  add ax,bx
                               
             ;hien thi tong 
           
           
                ;tachsodechia 
                 
                 mov dx,0
                 mov cx,0
                 mov bx,10
                 
                 chia:    div bx
                          push dx
                          inc cx
                          cmp ax,0
                          je hienso
                          mov dx,0
                          jmp chia
              
              hienso:
                       pop dx   
                       add dl,30h
                       mov ah,2
                       int 21h
                       loop hienso
                       
              
              
              
                          
                          
                          
                          
                          
                        
                        
                        
                        
                           
                    
                    
                    
                    
                    
                    
                       
                
                
                
                
                
                        
                 
                 
                 
                 
                 
                 
        
        mov ah,76
        int 21h
        
    main endp
  end main
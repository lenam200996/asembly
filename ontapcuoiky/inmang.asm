.model tiny
.stack 100h
.data
    mang db 1,2,3,4,5,6 
    thongbao db 'cac phan tu cua mang: $'
    tg dw 0       
.code
    proc main   
    mov ax,@data
    mov ds,ax  
    
    lea dx,thongbao
    mov ah,9
    int 21h
    
    mov cx,6
    lea si,mang    
    mov bl,10
  
    
    duyetmang:
    
        mov al,[si]
        inc si
        mov ah,0
        mov tg,cx
        mov cx,0 
        
        chia:
                
            div bl
            push ax 
            inc cx
            cmp al,0
            je hien
            mov ah,0
            jmp chia 
            
                hien: 
                
                     pop ax
                     mov dl,ah
                     add dl,30h
                     mov ah,2
                     int 21h
                     loop hien
                     mov cx,tg 
                     mov dl,' ' ; phan cach phan tu
                     int 21h
                     loop duyetmang
                      
    main endp
    end main
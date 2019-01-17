.model tiny
.stack 100h
.data
    mang db 10,2,3,4,5,230
    
    thongbao db 'min mang: $'
    
    min db 0    
.code
    proc main
        mov ax,@data
        mov ds,ax
                
        lea dx,thongbao
        mov ah,9
        int 21h
        
        lea si, mang  
        mov al,[si]
        
        mov min,al
        inc si
        mov cx,6
        mov bh,10
        
        duyetmang:
            mov al,[si]
            inc si
            mov bl,min
            cmp al,bl
            jbe ganmin
            loop duyetmang
        ganmin:
            cmp cx,0
            je hien
            mov min, al
            loop duyetmang
        hien:   
            
            mov al,min 
            chia:
            mov ah,0
            div bh
            push ax
            inc cx
            cmp al,0
            je hienkq
            mov ah,0
            jmp chia
         
        hienkq:
            pop ax
            mov dl,ah
            add dl,30h
            mov ah,2
            int 21h
            loop hienkq 
            
            
        ra:
            mov ah,76
            int 21h
 main endp
    end main

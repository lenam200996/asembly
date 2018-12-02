;tinh tong mang byte ,word


.model tiny
.stack 200h
.data
    tb1 db 'mang la: $'
    tb2 db 13,10, 'tong mang: $'
    mang db 12,1,3,4,7,8,9,14,8,10
    tong db 0
.code 
    proc main
    mov ax,@data
    mov ds,ax
    
    
    lea dx,tb2
    mov ah,9
    int 21h
    
    mov cx, 10
    mov bh,0
    
    lea si,mang
    
    
    tinh:
        mov bl,[si]
        ;sub bl,30h
        mov al,tong
        ;sub al,30h
        add al,bl
        inc si
        mov tong,al
        loop tinh  
        
         
        mov al,tong
        mov ah,0
        mov cx,0
    hienthi:
       
        mov bl,10
        div bl
        push ax
        inc cx
        cmp al,0
        je hien
         mov ah,0
        jmp hienthi
        
    hien:
        pop ax
        mov dl,ah
        add dl,30h
        mov ah,2
        int 21h
        loop hien
        
    ra:
    mov ah,76
    int 21h
main endp
end main
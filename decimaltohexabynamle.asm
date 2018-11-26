.model tiny
.stack 200h
.data 
    tb1 db 'nhap so thap phan: $'
    tb2 db 13,10, 'he hexa: $'
    so db 0
.code
    proc main
    mov ax,@data
    mov ds,ax
    
    ;hien thong bao 1
    lea dx,tb1
    mov ah,9
    int 21h
    mov dl,0
    mov al,0
    ;nhap so
    nhap: 
        mov ah,1
        int 21h
        cmp al,13
        je convert
        sub al,30h
        mov bl,10
        mov dl,al
        mov al,so
        mov ah,0
        mul bl
        add al,dl
        mov so,al
        jmp nhap  
    convert:
        lea dx,tb2 
        mov ah,9
        int 21h
        mov dl,so
        mov bl,16
        mov dh,0
        mov ax,dx
        mov ah,0
        mov cx,0
        chiahexa:
            
            div bl
            push ax
            inc cx
            cmp al,0
            je hienkq   
            mov ah,0
            jmp chiahexa
        
    hienkq:
        pop ax
        cmp ah,9
        jbe hienso
        jmp hienkytu
    hienso:
        cmp cx,0
        je ra
        mov dl,ah
        add dl,30h
        mov ah,2
        int 21h 
        loop hienkq
       
    hienkytu:
        cmp cx,0
        je ra
        mov dl,ah
        add dl,37h
        mov ah,2
        int 21h
        loop hienkq
       
              
    ra:
        mov ah,76
        int 21h
main endp
end main
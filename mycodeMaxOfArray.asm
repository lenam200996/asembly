.model tiny
.stack 200h
.data
    tb1 db 'mang : $'
    tb2 db 13,10, 'max cua mang: $'
    cach db ' $'
    mang db 12,243,5,8,9,6,15,210,7,6
    max db 0
.code
    proc main
    mov ax, @data
    mov ds,ax
    
    lea dx,tb1
    mov ah,9
    int 21h
        
    mov cx , 10
    lea si,mang
    hien:
        
        mov dl,[si]
        cmp dl,10
        jae hien2so
        add dl,30h
        mov ah,2
        int 21h
        lea dx,cach
        mov ah,9
        int 21h
        inc si
        cmp cx,0
        je tinhmax
        loop hien
    hien2so:
        cmp cx,0
        je tinhmax
        mov dh,0
        mov ax,dx
        mov bl,10
        div bl
        mov dl,al
        cmp dl,10
        jae hienso3
        add dl,30h
        mov bl,ah
        mov ah,2
        int 21h   
        mov dl,bl
        add dl,30h
        int 21h
        lea dx,cach
        mov ah,9
        int 21h
        inc si
        loop hien
        
        
   hienso3:
        cmp cx,0
        je tinhmax
        mov bh,ah
        mov ah,0
        mov bl,10
        mov dh,0
        mov ax,dx
        div bl
        mov bl,ah
        mov dl,al
        add dl,30h
        mov ah,2
        int 21h
        mov dl,bl
        add dl,30h
        int 21h
        mov dl,bh
        add dl,30h
        int 21h
        lea dx,cach
        mov ah,9
        int 21h
        inc si
        loop hien
        
   tinhmax:
        mov cx,10
        lea si,mang
        mov bl,[si]
        mov max,bl
        inc si
        tinhmax2:
            
            mov bl,[si]
            cmp bl,max
            jae ganmax
            inc si
            cmp cx,0
            je hienkq
            loop tinhmax2
        ganmax:
            cmp cx,0
            je hienkq
            mov bl,[si]
            mov max,bl
            inc si
            loop tinhmax2
    hienkq:  
        lea dx,tb2
        mov ah,9
        int 21h
        mov dl,max
        cmp dl,10
        jae hienkq2so 
        add dl,30h
        mov ah,2
        int 21h
        jmp ra
    hienkq2so:
        
        mov dh,0
        mov ax,dx
        mov bl,10
        div bl
        mov bl,ah
        mov dl,al
        cmp dl,10
        jae hienso4
        add dl,30h
        mov ah,2
        int 21h
        mov dl,bl
        add dl,30h
        int 21h
        jmp ra
     hienso4:
       mov bh,ah
       mov bl,10
       mov dh,0
       mov ah,0
       mov ax,dx
       div bl
       mov bl,ah
       mov dl,al
       add dl,30h
       mov ah,2
       int 21h
       mov dl,bl
       add dl,30h
       int 21h
       mov dl,bh
       add dl,30h
       int 21h 
     
     ra:
     mov ah,76
     int 21h
     
main endp
end main
             
            
    
    
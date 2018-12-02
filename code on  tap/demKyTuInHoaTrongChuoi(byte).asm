; dem ky tu hoa trong 1 chuoi
.model tiny
.stack 100h
.data 
    tb1 db 'nhap chuoi can dem: $'
    tb2 db 13,10, 'so ky tu hoa la: $'
    xau db 100 dup(?)
    tong db 0
.code 
    proc main
        mov ax,@data
        mov ds,ax
        
        
        lea dx, tb1
        mov ah,9
        int 21h
        
        
        lea si,xau
        mov cx,0
        
        nhap:
            mov ah,1
            int 21h
            cmp al,13
            je dem
            inc cx
            mov [si],al
            inc si
            jmp nhap
       dem:
            lea si,xau
            demloop:
                mov bl,[si]
                inc si
                cmp bl,90
                jbe check1
                
                loop demloop
            check1:
                cmp cx,0
                je hien
                cmp bl,65
                jae tang
                loop demloop
        tang:
            cmp cx,0
            je hien
            mov dl,tong
            inc dl
            mov tong ,dl
            loop demloop
     hien:
        lea dx,tb2
        mov ah,9
        int 21h
        mov al,tong
        mov ah,0
        hien1:
        mov ah,0
        mov dl,10
        div dl
        push ax
        inc cx
        cmp al,0
        je hienkq
        
        jmp hien1
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
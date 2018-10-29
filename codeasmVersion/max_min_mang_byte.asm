.model small
.stack 100h
.data
tb1 db 'mang la:$ '
tb2 db 13,10,'max cua mang la : $'  
tb3 db 13,10,'min cua mang la : $'
m db 100,45,7,89,90,34,7,88,99,200
mmax db ?
mmin db ? 
tg dw ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,tb1
    mov ah,9
    int 21h
    
    lea si,m
    mov cx,10
    
duyetin:mov ah,0 
        mov al, [si]
        mov tg,cx 
        mov cx,0 
        mov bl,10

chiain: div bl
        push ax
        inc cx
        cmp al,0
        je hienin
        mov ah, 0
        jmp chiain       

hienin: pop ax
        mov dl,ah
        add dl,30h
        mov ah,2
        int 21h
        loop hienin
        
        mov dl,' '
        mov ah, 2
        int 21h
            
tiepin: inc si
        mov cx,tg
        loop duyetin  
        
        
       ;;;;;;;;;;;;;;;;;;;;;;;;; 
        
      lea dx,tb2
      mov ah,9
      int 21h
      
      
      lea si,m
      mov cx,10
      mov al,[si]
      mov mmax,al
duyetmax: mov ah,0
          mov al,[si]
          cmp al,mmax
          ja ganmax
          jmp tiepmax

ganmax: mov al,[si]  
        mov mmax,al

tiepmax:  inc  si
          loop duyetmax
                        
hienthimax: mov ah,0
            mov al, mmax
            mov bl,10
            mov cx,0
               
chiamax:    div bl
            push ax
            inc cx
            cmp al,0
            je hienmax
            mov ah,0
            jmp chiamax
            
hienmax:    pop ax
            mov dl,ah
            add dl,30h
            mov ah,2
            int 21h
            loop hienmax

;;;;;;;;;;;;;;;;;;;;;;;;;;;

       lea dx,tb3
      mov ah,9
      int 21h
      
      
      lea si,m
      mov cx,10
      mov al,[si]
      mov mmin,al
duyetmin: mov ah,0
          mov al,[si]
          cmp al,mmin
          jb ganmin
          jmp tiepmin

ganmin: mov al,[si]  
        mov mmin,al

tiepmin:  inc  si
          loop duyetmin
                        
hienthimin: mov ah,0
            mov al, mmin
            mov bl,10
            mov cx,0
               
chiamin:    div bl
            push ax
            inc cx
            cmp al,0
            je hienmin
            mov ah,0
            jmp chiamin
            
hienmin:    pop ax
            mov dl,ah
            add dl,30h
            mov ah,2
            int 21h
            loop hienmin



       
    
    mov ah,76
    int 21h
main endp
end main
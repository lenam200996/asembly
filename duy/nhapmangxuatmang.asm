.model small
.stack 100h
.data
tb1 db 13,10,'nhap phan tu mang kieu word: $'
tb2 db 13,10,'mang vua nhap la : $ '
pt dw 0
tg dw ?
m dw 10 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    lea si, m
    mov cx, 10
    mov ax,0
    
lap: ;hientb1
     lea dx,tb1
     mov ah,9
     int 21h
     mov ax,0
     ;nhapso
     nhapso:     mov ah,1
                 int 21h
                 cmp al,13
                 je ganso
                 sub al,30h
                 mov ah, 0
                 mov bx,ax
                 mov ax, pt
                 mov dx,10
                 mul dx
                 add ax,bx
                 mov pt,ax
                 jmp nhapso
               
      
                  
                  
   ganso:        mov dx, [si]
                 mov ax,pt 
                 mov [si],ax
                 inc si
                 loop lap 
    
    
        ;hientb2    
        lea dx, tb2
        mov ah, 9
        int 21h
    
        ;duyet mang
        lea si,m
        mov cx, 10
        mov ax,0
        
   duyet:  mov ax,[si]
           mov dx, 0
           mov bx, 10
           mov tg,cx
           mov cx, 0
           
     chia: div bx
           push dx
           inc cx
           cmp ax,0
           je hienso
           mov dx, 0
           jmp chia      
     
     hienso: pop dx
             add dl, 30h
             mov ah, 2
             int 21h
             loop hienso      
                 
           
           mov dl, ' '
           mov ah, 2
           int 21h  
           
           inc si
           mov cx, tg
           loop duyet
           
   
    
    mov ah, 76
    int 21h
main endp
end main
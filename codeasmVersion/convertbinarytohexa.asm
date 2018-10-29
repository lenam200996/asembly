 .model tiny
 .stack 100h
 .data
 tb1 db 'nhap so kieu word $'
 tb2 db 13,10,'chuyen sanhg hexa: $'
 so dw 0
 .code
 main proc
    mov ax,@data
    mov ds,ax
    ;hientb1
    lea dx, tb1
    mov ah, 9
    int 21h
    ;nhapso
    
    nhapso: mov ah, 1
            int 21h
            cmp al, 13
            je hientb2
            sub al, 30h
            mov ah,0
            mov bx, ax
            mov ax,so
            mov cx, 10
            mul cx
            add ax, bx
            mov so, bx
            jmp nhapso
    
    hientb2: lea dx, tb2
             mov ah, 9
             int 21h        
    
    chuyen: mov dx, 0;xoa bit cao
            mov ax, so  ;
            mov cx,0;dem so lan lap
            mov bx, 16
    
         lap1:   div bx
                 push dx
                 inc cx
                 cmp ax, 0
                 je hienso
                 mov dx, 0
                 jmp lap1
     
     
     hienso:     pop dx
                 ;
                 sub dl, 30h
                 mov ah, 2
                 int 21h
                 loop hienso     
    
    
    mov ah,76
    int 21h
     end main
main endp 
.model small
.stack 100h
.data
tb1 db 13,10,'Nhap phan tu : $'
tb2 db 13,10,'Mang vua nhap la: $'
m db 10 dup(?) 
m1 db 13,14,15,16,17,18,19,21,22,34
so db 0
tg dw ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 10
    lea si,m
    mov ax,0
    
lapnhap:  ;hientb
      lea dx, tb1
      mov ah, 9
      int 21h    
      ;nhapso:
       nhap: mov ah,1
            int 21h
            cmp al,13
            je  ganmang
            sub al, 30h
            mov bl,al
            mov al, so
            mov dl,10
            mul dl
            add al,bl
            mov so,al      
            jmp nhap
  
  ganmang:     mov al,so
               mov ah,0
               mov [si],ax
     
   tiepnhap:    mov bx,0
                mov dx,0
               mov ax,0 
               inc si
               loop lapnhap
  
  
  
   ;hientb2
   lea dx,tb2
   mov ah,9
   int 21h
  
   ;duyetmang
   lea si,m
   mov cx,10 
   mov ax,0
      
duyet:   mov al,[si]
         mov ah,0
         mov bl,10
         mov tg,cx
         mov cx,0

chia:   div bl
        push ax
        inc cx
        cmp al,0
        je hienso
        mov ah,0
        jmp chia

hienso:  pop ax
         mov dl,ah
         add dl,30h
         mov ah,2
         int 21h
         loop hienso
         
         
         mov dl,' '
         mov ah,2
         int 21h
         
tiep:    mov dx,0 
         mov ax,0
         mov cx,tg
         inc si
         loop duyet      
    
    mov ah, 76
    int 21h
    
main endp
end main
    
    
.model small
.stack 100h
.data
tb1 db 'nhap vao so word la so bi chia: $' 
tb2 db 13,10,'nhap vao so word thu hai la so chia: $'
tb3 db 13,10,'thuong hai so la: $'
tb4 db 13,10,'du la :$'
so1 dw 0
so2 dw 0
t dw 0
d dw 0
.code
main proc
    mov ax ,@data
    mov ds, ax
    ;hientb1
    lea dx,tb1
    mov ah,9
    int 21h
    
nhap1: mov ah, 1
       int 21h
       cmp al, 13
       je hientb2
       sub al,30h
       mov ah,0
       mov bx,ax
       mov ax,so1
       mov cx,10
       mul cx
       add ax,bx
       mov so1,ax
       jmp nhap1    
    
hientb2: lea dx,tb2
         mov ah, 9
         int 21h
nhap2:   mov ah, 1
       int 21h
       cmp al, 13
       je hientb3
       sub al,30h
       mov ah,0
       mov bx,ax
       mov ax,so2
       mov cx,10
       mul cx
       add ax,bx
       mov so2,ax
       jmp nhap2                
    
hientb3: lea dx,tb3
         mov ah,9
         int 21h    
    
;tinh thuong
  mov ax, so1
  mov bx,so2
  mov dx,0
  div bx
  mov t,ax
  mov d,dx
  
tachthuong:  mov ax,t
         mov bx,10
         mov cx,0
         mov dx, 0
 chiathuong:   div bx
        push dx
        inc cx
        cmp ax, 0
        je hienthuong
        mov dx,0
        jmp chiathuong                    
hienthuong: pop dx
            add dl,30h
            mov ah,2
            int 21h
            loop hienthuong
            
lea dx,tb4 
mov ah,9
int 21h            
tachdu:  mov ax,d
         mov bx,10
         mov cx,0
         mov dx, 0
 chiadu:   div bx
        push dx
        inc cx
        cmp ax, 0
        je hiendu
        mov dx,0
        jmp chiadu                    
hiendu: pop dx
            add dl,30h
            mov ah,2
            int 21h
            loop hiendu            
            
            
            
            
            
            
              
    
    mov ah, 76
    int 21h
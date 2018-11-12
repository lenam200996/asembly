.model small
.stack 100h
.data
tb1 db 'nhap vao 1 xau ki tu :$'
tb2 db 13,10,'xau ki tu vua nhap la:$'
tb3 db 13,10, 'XAU IN HOA LA :$'
tb4 db 13,10,'do dai cua xau tren la: $'
s db 80 dup(?)
tg dw 0
.code
main proc
    
    mov ax, @data
    mov ds,ax
    
    ;hientb1
    lea dx, tb1
    mov ah, 9
    int 21h
    
    lea si, s
    mov cx, 0
    
    ;nhap xau
 nhapxau:   mov ah, 1
            int 21h
            cmp al, 13 
            je hientb2
            inc cx
            sub al, 30h
            mov [si],al
            inc si
            jmp nhapxau
    
  
    
; hientb2
hientb2:    lea dx, tb2
            mov ah, 9
            int 21h 
    
     ;xuatxau
     lea si, s
     mov ah, 0
     mov tg, cx
     mov cx,0
     add cx,tg
         
duyet:   mov al,[si]
         mov dl, al
         add dl, 30h
         mov ah, 2
         int 21h 
         inc si
         loop duyet
 ;hientb3
 lea dx, tb3
 mov ah, 9
 int 21h
     
;xuat xau in hoa
     lea si, s
     mov ah, 0
     mov cx,tg
       
duyethoa:   mov al,[si]
         sub al, 20h
         mov dl, al
         add dl, 30h
         mov ah, 2
         int 21h 
         inc si
         loop duyethoa
;dodaixau
;hientb4
lea dx, tb4
mov ah, 9
int 21h
;tinhdodaixau 
;xuat do dai xau vua nhap
       mov ax, tg
       mov dx, 0
       mov cx, 0
       mov bx ,10
   chia: div bx
         push dx
         inc cx
         cmp ax, 0
         je hienso
         mov dx, 0
         jmp chia    
       
   hienso: pop dx
           add dl, 30h
           mov ah, 2
           int 21h
           loop hienso
        
    mov ah, 76
    int 21h
main endp
end main
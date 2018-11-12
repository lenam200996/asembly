.model small
.stack 100h
.data
tb1 db 'nhap vao so kieu word: $'
tb2 db 13,10,'nhap vao so thu hai kieu word:$'
tb3 db 13,10,'hieu cua ahi so la: $'
so1 dw 0
so2 dw 0
hieu dw 0

.code
main proc
    mov ax, @data
    mov ds,ax
    
    lea dx,tb1
    mov ah,9
    int 21h
    
nhapso1: mov ah,1
         int 21h
         cmp al,13
         je hientb2
         sub al, 30h
         mov ah,0
         mov bx,ax
         mov ax,so1
         mov cx ,10
         mul cx
         add ax,bx
         mov so1 ,ax
         jmp nhapso1
         
hientb2: lea dx,tb2
         mov ah, 9
         int 21h
         
                     
nhapso2:  mov ah,1
         int 21h
         cmp al,13
         je hientb3
         sub al, 30h
         mov ah,0
         mov bx,ax
         mov ax,so2
         mov cx ,10
         mul cx
         add ax,bx
         mov so2 ,ax
         jmp nhapso2

hientb3: lea dx,tb3
         mov ah, 9
         int 21h
         
         
tinhhieu:  mov ax, so1
           mov bx, so2
           cmp ax,bx
           jae tru1
           jmp tru2
           
tru1:      sub ax,bx
           mov hieu,ax
           jmp hienhieu1
                                     
tru2:     sub bx,ax
          mov hieu,bx
          jmp hienhieu2

hienhieu1: mov ax, hieu
           mov dx,0
           mov cx,0
           mov bx,10
chia1:     div bx
           push dx
           inc cx
           cmp ax,0
           je hien1
           mov dx,0
           jmp chia1
hien1:     pop dx
           add dl,30h
           mov ah,2
           int 21h
           loop hien1
           jmp ra
                                               
hienhieu2: mov dl, '-'
           mov ah,2
           int 21h 
           mov ax, hieu
           mov dx,0
           mov cx,0
           mov bx,10
chia2:     div bx
           push dx
           inc cx
           cmp ax,0
           je hien1
           mov dx,0
           jmp chia1
hien2:     
           pop dx
           add dl,30h
           mov ah,2
           int 21h
           loop hien1
           jmp ra



    
ra:    mov ah, 76
       int 21h
main endp
end main
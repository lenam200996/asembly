.model small
.stack 100h
.data
tb1 db 'Nhap vao so kieu word: $'
tb2 db 13,10,'Hexa phan tuong ung: $'
so dw 0
.code
main proc
    mov ax, @data
    mov ds,ax
    
    lea dx, tb1
    mov ah, 9
    int 21h
    
nhap: mov ah, 1
        int 21h
        cmp al, 13
        je hientb2
        sub al, 30h
        mov ah, 0
        mov bx,ax
        mov ax, so
        mov cx,10
        mul cx
        add ax,bx
        mov so,ax
        jmp nhap    
    
    
hientb2: lea dx, tb2
         mov ah, 9
         int 21h    

tachso: mov ax, so
        mov dx,0
       mov bx ,16
       mov cx,0
chia:  div bx
       push dx
       inc cx
       cmp ax,0
       je hienso
       mov dx,0
       jmp chia
hienso: pop dx
        cmp dl,9
        ja hienkitu
        jmp hientheoso
        
  hienkitu: add dl,37h
            mov ah,2
            int 21h      
            jmp tiep
        
   hientheoso: add dl, 30h
               mov ah,2
               int 21h     
               jmp tiep
        
        
   tiep:     loop hienso
   
   mov dl,'('
   int 21h      
   mov dl,'H'
   int 21h
   
   mov dl,')'
   int 21h    
       
                           
    mov ah, 76
    int 21h
main endp
end main
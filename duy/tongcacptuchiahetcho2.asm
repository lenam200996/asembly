.model small
.stack 100h
.data
m db 13,56,45,76,8,66,87,97,30,154
msum dw 0
tb db 'tong ptu chia het cho 2 cua mang la $'
.code
 main proc
    
    mov ax, @data
    mov ds, ax
    
    ;hientb
    lea dx, tb
    mov ah, 9
    int 21h
    
    
    lea si, m
    mov cx, 10
    mov ax, 0;
    mov bl , 2
    
 lap:  mov al, [si];cho al gia tri si tro den
       mov ah, 0
       div bl
       cmp ah, 0
       je  tinhtong
       jmp tiep
          
    
 tinhtong:  mov al,[si]
            mov ah, 0
            mov dx,msum
            add ax, dx
            mov msum ,ax 
          
 tiep:  inc si
        loop lap
        
        
  ;tach so
  mov ax,msum
  mov dx, 0
  mov bx, 10
  mov cx, 0
           
 chia: div bx
       push dx
       inc cx
       cmp ax,0
       je hienso
       mov dx, 0
       jmp chia
       
 hienso:
         pop dx
         add dl, 30h
         mov ah, 2
         int 21h       
         loop hienso
  
  
  
    
    mov ah, 76
    int 21h
 main endp
end main
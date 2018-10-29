.model small
.stack 100h
.data
m db 13,56,45,76,8,66,87,97,34,154
mmax db ?
tb db 'max cua mang la $'
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
    
 lap:  mov al, [si];cho al gia tri si tro den
       cmp mmax, al
       jb  gan
       jmp tiep
          
    
 gan:  mov al,[si]
       mov mmax, al
          
 tiep:  inc si
        loop lap
        
        
  ;tach so
  mov al,mmax
  mov ah, 0
  mov bl, 10
  mov cx, 0
           
 chia: div bl
       push ax
       inc cx
       cmp al,0
       je hienso
       mov ah, 0
       jmp chia
       
 hienso:
         pop ax
         mov dl, ah
         add dl, 30h
         mov ah, 2
         int 21h       
         loop hienso
  
  
  
    
    mov ah, 76
    int 21h
 main endp
end main
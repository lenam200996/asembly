.model small
.stack 100h
.data    
m db 21,13,9,55,4
tb1 db 'tong cac phan tu chia het cho 3 trong mang m la:$'
tong3 db 0 
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;hientb1
    lea dx, tb1
    mov ah, 9
    int 21h
    
    mov cx,5
    lea si,m
    mov ax, 0
lap: mov al,[si]
     mov bl,3
     div bl
     cmp ah,0
     je tinhtong
     jmp tiep    
tinhtong:  mov ax, 0
           mov al, [si]
           mov bl, tong3
           add al,bl
           mov tong3,al
tiep:  inc si 
       mov ax, 0
       loop lap            

      ;hientong
      mov ax,0
      mov al, tong3
      mov bl, 10
      mov cx, 0
      
chiatong: div bl
          push ax
          inc cx 
          cmp al, 0
          je hientong
          mov ah, 0
          jmp chiatong
          
hientong: pop ax
          mov dl, ah
          add dl ,30h
          mov ah, 2
          int 21h
          loop hientong             
    
ra: mov ah, 76
    int 21h
main endp
end main
    
    
    
    
.model small
.stack 100h
.data
tb1 db 'min cua mang la :$'
tb2 db 13,10,'max cua mang la :$'
m db 130,23,22,45,67,76,19,57,3,11
mmin db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    ;hien tb1
    lea dx, tb1
    mov ah, 9
    int 21h
    ;tim min
    lea si,m; cho si tro den ptu dau tien trong mang m
    mov cx, 10; 9 lan duyet mang  cac phan tu con lai
    mov al,[si]
    mov mmin,al
            
duyet:     
            mov bl,[si];      
            cmp mmin ,bl;so sanh min voi si hien tai
            ja gan
            jmp tiep
    gan:    mov bl,[si]
            mov mmin ,bl
    tiep:   inc si              
            loop duyet
     
      
    ;hien thi min
    tachso :    mov al, mmin
                mov ah, 0; xoa bit cao de cb chia
                mov bl, 10   ;chia 10
                mov cx,0; dem so lan lap
       lapchia: div bl
                push ax; dy gia tri ax vao stack
                inc cx;
                cmp al, 0
                je hienso
                mov ah, 0
                jmp lapchia  
    
       hienso:  pop ax
                mov dl, ah
                add dl, 30h
                mov ah, 2
                int 21h
                loop hienso               
                     
    
    mov ah, 76
    int 21h
   main endp
end main
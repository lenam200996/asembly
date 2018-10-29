.model small   
.stack 100h
.data
.code 
tb1 db 'nhap vao so kieu byte $'
tb2 db 13,10,'kieu byte la: $'
so db 0
main proc
    mov ax,@data
    mov ds,ax
    ;hientb1
    lea dx,tb1
    mov ah,9
    int 21h
    ;nhapso
    nhapso: mov ah,1
            int 21h
            cmp al, 13
            je hientb2
            sub al, 30h
            mov bl, al
            mov al, so
            mov cl,10
            mul cl
            add al, bl
            mov so, al
            jmp nhapso
     hientb2:  lea dx,tb2
                mov ah,9
                int 21h
              
              
     chuyen:  mov ah,0
              mov al,so
              mov bl, 2
              mov cx,0
              
              lap:  div bl 
                    push ax
                    inc cx
                    cmp al,0
                    je hienso
                    mov ah, 0
                    jmp lap
    
     hienso:  
               mov dl,'0'
               mov ah, 2
               int 21h
          lapd:     pop ax
                   mov dl,ah
                   add dl,30h
                   mov ah, 2
                  int 21h
                  loop lapd
               
    
    
    
    mov ah,76
    int 21h
    
    end main
main endp

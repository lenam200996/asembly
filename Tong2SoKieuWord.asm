.model tiny
.stack 100h
.data
    st1 db 'nhap so thu nhat: $'
    st2 db 13,10,'nhap so thu hai: $'
    st3 db 13,10,'Tong hai so = $'
    so1 dw 0
    so2 dw 0
.code                                                             ;so1=0 ;nhap 1 so1= so*10 +1; nhap 2 : so1=so1*10+2; nhap3: so=so*10+3
    main proc 
        mov ax,@data
        mov ds,ax
        
        ;hien tb1
        lea dx,st1
        mov ah,9
        int 21h    
        
        nhapso1:
            mov ah,1
            int 21h
            cmp al,13
            je nhapso2
            sub al,30h
            mov ah,0 ;chuyen tu 8 bit thanh 16bit
            mov bx,ax
            
            mov ax,so1
            mov cx,10
            mul cx    ;ax*cx
            add ax,bx
            mov so1,ax
            jmp nhapso1
            
        nhapso2:
            lea dx,st2
            mov ah,9
            int 21h
            
            nhap:
                mov ah,1
                int 21h
                cmp al,13
                je tinhtong
                sub al,30h
                mov ah,0 ; xoa ah = 0 ; thay vi ah = 1
                mov bx,ax
                mov ax,so2
                mov cx,10
                mul cx
                add ax,bx  ; lay ax cong so vua nhap la bx
                mov so2,ax ; gan lai so2 = ax de lat nhan voi sau
                jmp nhap
         
         tinhtong:
            lea dx,st3
            mov ah,9
            int 21h
            
            mov ax,so1
            mov bx,so2
            add ax,bx   ;sau lenh nay tong se nam trong ax
            mov bx,10   ;gan bx=10 de ti chia lay du de cat vao stack
            mov dx,0    ;xoa dx de chia 32bit cho 16bit=16bit
            mov cx,0    ;cx de tinh so lan lap
            
            chia:                                                      3 12
                div bx      ;lay tong trong ax chia 10  ;du cat vao dx(bit cao), thuong cat vao ax ( bit thap)
                push dx     ;cat du vao stack
                inc cx      ;tang cx de tinh so vong lap
                cmp ax,0     ;so sanh thuong bang 0 thi thoat vong lap
                je hienso
                mov dx,0
                jmp chia
                
                hienso:
                    pop dx     ;lay gtri trong stack ra
                    
                    add dl,30h
                    mov ah,2
                    int 21h
                    loop hienso ; moi lan loop thuc hien thi cx se tru 1,cx = 0 se dung
                    
          ra: 
            mov ah,76
            int 21h
     main endp
    end main
              
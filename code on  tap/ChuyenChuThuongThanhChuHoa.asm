.model tiny
.stack 100h
.data
    tb1 db 'nhap xau: $'
    tb2 db 13,10,'xua vua nhap (chuyen in hoa): $'
    xau db 100 dup(?)
.code
    proc main
        mov ax,@data
        mov ds,ax
        
        lea dx,tb1
        mov ah,9
        int 21h
        
        lea si,xau
        mov cx,0
        
        nhap:
            mov ah,1
            int 21h
            cmp al,13
            je convert
            mov [si],al
            inc si
            inc cx
            jmp nhap
        convert:
            lea dx,tb2
            mov ah,9
            int 21h
            
            mov dx,cx
            lea si ,xau
            convertloop:
                mov bl,[si]
               
                cmp bl,122
                jbe stepone
                inc si
                loop convertloop
            stepone:
                cmp cx,0
                je hien
                cmp bl,97
                jae conv
                inc si
                loop convertloop
           conv:
                cmp cx,0
                je hien
                sub bl,20h
                mov [si],bl
                inc si
                loop convertloop 
      hien:
            mov cx,dx
            lea si,xau
            
            hienkt:
                mov dl,[si]
                mov ah,2
                int 21h 
                inc si
                loop hienkt
    ra:
        mov ah,76
        int 21h
  main endp
    end main
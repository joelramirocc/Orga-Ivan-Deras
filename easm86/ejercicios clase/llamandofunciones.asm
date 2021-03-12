#set byte [0x10000000] = ["The sum is ",0]

call main

mov eax,10
int 0x80

arraysum:
    mov eax,0 ;sum
    mov ecx,0 ;i
    
    for:
        cmp ecx, dword [esp+8]
        jge endfor
            mov edx,dword[esp+4] ; direccion del arreglo
            add eax, dword[edx+ecx*4]
            inc ecx
            jmp for

    endfor:
        ret

main:
    sub esp,28
    mov dword[esp+0],97
    mov dword[esp+4],74
    mov dword[esp+8],62
    mov dword[esp+12],46
    mov dword[esp+16],26
    mov dword[esp+20],1
    mov dword[esp+24],67

    push 7
    push esp
    call arraysum
    add esp,8 ;liberar los parametros de arraysum => push 7 y push esp
    mov dword[esp+28],eax

    mov eax,4
    mov ebx,0x10000000
    int 0x80

    mov eax,1
    mov ebx, dword[esp+28]
    int 0x80

    mov eax,11
    mov ebx,10
    int 0x80

    ;#show eax signed decimal
    add esp,28
    ret
#set byte [0x10000000] = ["Min element: ",0]
#set byte [0x10000016] = [" at pos ",0]
call main
    mov eax,10
    int 0x80


;array=> dword[esp+4]
;size=> dword[esp+8] 
;*minval=> dword[esp+16]
;*minpos=> dword[esp+12]


funcionmin:

    mov edx,dword[esp+4]
    mov edx,dword[edx]
    
    mov ebx,dword[esp+16]
    mov dword[ebx], edx
    mov edx,dword[esp+4]

    mov ebx,dword[esp+12]
    mov dword[ebx],0
    mov eax,1  ;c


        ;----------------------------------ciclo for-------------------------------
    forfuncionmin:
        cmp eax,dword[esp+8]
        jge endforfuncionmin

            mov ebx, dword[edx+eax*4]
            
            mov ecx,dword[esp+16]
            mov ecx,dword[ecx]
            

            cmp ebx,ecx
            jge endif

                mov ecx,dword[esp+16]
                mov dword[ecx],ebx
                mov ecx,dword[esp+12]
                mov dword[ecx],eax
                jmp endif

            endif:
                inc eax
                jmp  forfuncionmin

    endforfuncionmin:
        ret








main:
    sub esp,40
    mov dword[esp+0],91
    mov dword[esp+4],96
    mov dword[esp+8],48
    mov dword[esp+12],1
    mov dword[esp+16],8
    mov dword[esp+20],52
    mov dword[esp+24],9
    mov dword[esp+28],24
    mov dword[esp+32],45
    mov dword[esp+36],9

    
    sub esp,8
    ;eps=>[][][aray]
    mov eax,esp
    add eax,4
    push eax
    ;eps=>[*min][][min][aray]
    mov eax,esp
    add eax,4
    push eax
    ;eps=>[*pos][*min][pos][min][aray]
    push 10
    ;eps=>[10][*pos][*min][pos][min][aray]
    mov eax, esp
    add eax,20
    push eax
    call funcionmin
    add esp,16


            mov eax,4
            mov ebx,0x10000000
            int 0x80

            mov eax,1
            mov ebx, dword[esp+4]
            int 0x80


            mov eax,4
            mov ebx,0x10000016
            int 0x80

            mov eax,1
            mov ebx, dword[esp]
            int 0x80

            mov eax,11
            mov ebx,10
            int 0x80

    add esp,48
    ret 
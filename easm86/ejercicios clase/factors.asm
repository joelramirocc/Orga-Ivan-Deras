call main

;dword[esp+4] = number
;dword[esp+8] = count
;dword[esp+12]= f[]

factors:
    mov eax,0 ;index
    mov ecx,1 ;i

    forfactors:
        cmp ecx, dword[esp+4]
        jg endforfactors

            push eax
                mov edx,0
                mov ebx,ecx
                mov eax,dword[esp+8]
                div ebx
                mov eax,dword[esp]
            add esp,4
            cmp edx,0
            jne endif
                #show ecx
                #show eax
                mov ebx,esp
                add ebx,12
                mov dword[ebx + eax*4],ecx
                inc eax
                cmp eax, dword[esp+8]
                    je endforfactors
                    jmp endif

            endif:
                inc ecx
                jmp forfactors

    endforfactors:
        ret

main:
; 8 valores + 3 parametros = 11*4=44
    sub esp,32
    
    push esp
    push 8
    push 215
    
    call factors
    add esp,8
    mov ecx,0
    mov edx,eax

    formain:
        cmp ecx,edx
        jge endformain
            mov eax,1
            mov ebx, dword[esp+ecx*4]
            int 0x80
            inc ecx
            
        mov eax,11
        mov ebx,32
        int 0x80
        jmp formain

    endformain:
        mov eax,11
        mov ebx,10
        int 0x80
        add esp,32
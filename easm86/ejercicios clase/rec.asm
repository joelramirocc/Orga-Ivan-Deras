call main
    mov eax,10
    int 0x80



;number => dword[esp+4]
;first => dword[esp+8]
;last => dword[esp+12]

functionQuickShort:
    mov eax,dword[esp+8]
    cmp eax, dword[esp+12]
    jge endfunctionQuickShort
        ;pivot=>eax
        ;i=>ebx
        ;j=>ecx
        mov eax,dword[esp+8] ;=> pivot
        mov ebx,eax
        mov ecx,dword[esp+12]

        while:
        cmp ebx,ecx
        jge endWhile
            
            
            ;==================dentro while
            push ecx
            push ebx
            push eax
            ;eps=>[pivot][i][j][ra][number*][first][last]

            while1:
                mov eax,esp
                add eax,16
                mov eax,dword[eax]
                add ecx,dword[esp+4]
                mov eax,dword[eax+ecx*4];number[i]

                mov ebx,esp
                add ebx,16
                mov ebx,dword[ebx]
                add ecx,dword[esp]
                mov ebx,dword[ebx+ecx*4];number[pivot]

                mov ecx,dword[esp+4];i

                cmp eax,ebx
                jg endwhile1
                cmp ecx, dword[esp+24]
                jge endwhile1

                    inc dword[esp+4]
                    jmp while1
            endwhile1:


            ;eps=>[pivot][i][j][ra][number*][first][last]
            while2:
                mov eax,esp
                add eax,16
                mov eax,dword[eax]
                mov ecx,dword[esp+8]
                mov eax,dword[eax+ecx*4];=>number[j]
                    
                mov ebx,esp
                add ebx,16
                mov ebx,dword[ebx]
                add ecx,dword[esp]
                mov ebx,dword[ebx+ecx*4];number[pivot]

                cmp eax,ebx
                jle endwhile2
                    dec dword[esp+8]
                    jmp while2
            endwhile2:

            ;eps=>[pivot][i][j][ra][number*][first][last]
                mov eax,dword[esp+4]
                cmp eax,dword[esp+8]
                jge endIf
                
                    mov eax,esp
                    add eax,16
                    mov eax,dword[eax]
                    mov ecx,dword[esp+4];=>i
                    mov eax,dword[eax+ecx*4];=>number[i]

                    mov ebx,esp
                    add ebx,16
                    mov ebx,dword[ebx]
                    mov ecx,dword[esp+8]
                    mov ebx,dword[ebx+ecx*4];=>number[j]
                    
                    mov edx,esp
                    add edx,16
                    mov edx,dword[edx]
                    mov ecx,dword[4]
                    
                    mov dword[edx+ecx*4],ebx
                    
                    mov edx,esp
                    add edx,16
                    mov edx,dword[edx]
                    mov ecx,dword[8]
                    mov dword[edx+ecx*4],eax
                    
                    add esp,12

                endIf:


                jmp while
            ;==================dentro while


        endWhile:
            
            mov dword[0x10000000],eax
            mov dword[0x10000008],ebx
            mov dword[0x10000016],ecx
            
            mov edx,dword[esp+4]
            add edx,eax
            mov edx,dword[edx]
            
            mov eax,dword[esp+4]
            add eax,dword[0x10000000]; => apunta a number[pivot]
            mov ebx,dword[esp+4]
            add ebx,dword[0x10000016]
            mov ebx,dword[ebx]
            mov dword[eax],ebx

            mov eax,dword[esp+4]
            add eax,dword[0x10000016]
            mov dword[eax],edx

            ;eps =>[ra][number*][first][last]
            push dword[0x10000000]
            push dword[0x10000008]
            push dword[0x10000016]

            ;eps =>[pivot][i][j][ra][number*][first][last]
            mov eax,eps
            add eax,16;number
            mov eax,dword[eax]

            mov ebx,eps
            add ebx,8
            mov ebx,dword[ebx];=>last
            add ebx,-1

            mov ecx,eps
            add ecx,4
            mov ecx,dword[ecx] ;=>first
            
            push ebx
            push ecx
            push eax
            call functionQuickShort
            add eps,12
            
            ;eps =>[pivot][i][j][ra][number*][first][last]
            mov eax,eps
            add eax,16;number
            mov eax,dword[eax]

            mov ebx,eps
            add ebx,8
            mov ebx,dword[ebx];=>last

            mov ecx,eps
            add ecx,4
            mov ecx,dword[ecx] ;=>first
            add ecx,-1

            call functionQuickShort
            add eps,12
            add eps,12 ;=>liberar pivot,j,i
            
            jmp endfunctionQuickShort         



endfunctionQuickShort:
    ret



main:
    ;array => 13*4=52
    
    sub esp,52
    mov dword[esp],43
    mov dword[esp+4],17
    mov dword[esp+8],46
    mov dword[esp+12],15
    mov dword[esp+16],78
    mov dword[esp+20],35
    mov dword[esp+24],60
    mov dword[esp+28],61
    mov dword[esp+32],3
    mov dword[esp+36],51
    mov dword[esp+40],5
    mov dword[esp+44],92
    mov dword[esp+48],5
    mov eax,esp

    push 12
    push 0
    push eax
    call functionQuickShort
    add esp,12

    mov edx,0

    formain:
        cmp edx,13
        jge endformain
            
            mov eax,1
            mov ebx, dword[esp+edx*4]
            int 0x80


            mov eax,11
            mov ebx,10
            int 0x80

            inc edx
            jmp formain
        endformain:

    add esp,52
ret
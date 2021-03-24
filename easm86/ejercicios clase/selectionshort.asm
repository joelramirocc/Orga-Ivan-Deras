call main
    mov eax,10
    int 0x80

;esp=>[ra][array*][n]
;array => dword [esp+4]
;n => dword [esp+8]
;min=> edx

get_min_function:
    mov edx,0
    mov ecx,1 ;i

    for_min:
        cmp ecx,dword[esp+8]
        jge end_get_min_function
            mov eax, dword[esp+4]
            mov eax,dword[eax+edx*4]
            
            mov ebx, dword[esp+4]
            cmp eax,dword[ebx+ecx*4]
            jle end_if
            mov edx,ecx

            end_if:
                inc ecx
                jmp for_min

end_get_min_function:
    mov eax,edx
    ret


;esp=>[ra][array*][n]
;array => dword [esp+4]
;n => dword [esp+8]
selection_sort_function:
    cmp dword[esp+8],1
    jle end_selection_sort_function
        push dword [esp+8]
        push dword [esp+8]
        call get_min_function
        add esp,8
        
        cmp eax,0
        je end_if_2
            mov ebx,dword[esp+4]
            mov ebx,dword[ebx]

            mov ecx,dword[esp+4]
            mov ecx,dword[ecx+eax*4]
            mov edx,dword[esp+4]
            mov dword[edx],ecx

            mov edx,dword[esp+4]
            mov dword[edx+eax*4],ebx

        end_if_2:
            mov eax,dword[esp+8]
            mov ebx,dword[esp+4]
            add eax,-1
            add ebx,4
            push eax
            push ebx
            call selection_sort_function
            add esp,8
    
end_selection_sort_function:
    ret

main:
ret
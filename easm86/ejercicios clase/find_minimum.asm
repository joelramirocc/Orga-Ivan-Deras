call main

mov eax,10
int 0x80

;SETEANDO LOS ARREGLOS
#set dword[0x10000000]= [7,5,3,4,6,9]
#set dword[0x10000024]= [4,4,4,4,4,4]
#set dword[0x10000048]= [9,7,5,3,2,1]
#set dword[0x10000072]= [1,2,3,5,7,9]
#set dword[0x10000096]= [9,7]
#set dword[0x10000104]= [9,7]


;array = dword[esp+4]
;size = dword[esp+8]
;eax = i
function_find_minimum:
    cmp dword[esp+8],0
    je if_first
    jmp end_if_first 
    if_first:
        mov eax,-1
        jmp end_function_find_minimum
    end_if_first:
        cmp dword[esp+8],1
        je second_if
        jmp continue_after_if    
    second_if:
        mov eax,0
        jmp end_function_find_minimum
    continue_after_if:
        mov eax,0 ;i

        while:
            mov ebx,dword[esp+8]
            add ebx,-1
            cmp eax,ebx
            jl second_while
            jmp end_function_find_minimum
        second_while:
            mov ebx,dword[esp+4]
            add ebx,4
            mov ebx,dword[ebx+eax*4]
            
            mov ecx,dword[esp+4]
            mov ecx,dword[ecx+eax*4]
            
            cmp ebx,ecx
            jl final_while
            jmp end_function_find_minimum

            final_while:
                inc eax
                jmp while            


end_function_find_minimum:
    ret

;arr=dword[esp+4]
;size=dword[esp+8]

function_test:
    push dword[esp+8]
    push dword[esp+8]
    call function_find_minimum
    add esp,8
    mov ecx,eax
    
    mov ebx, ecx
    mov eax,1
    int 0x80

    mov eax,11
    mov ebx,10
    int 0x80

    jmp end_function_test    
end_function_test:
    ret

main:
    mov eax,0x10000000
    mov dword[eax],7
    add eax,4
    mov dword[eax],5
    add eax,4
    mov dword[eax],3
    add eax,4
    mov dword[eax],4
    add eax,4
    mov dword[eax],6
    add eax,4
    mov dword[eax],9
    push 6
    push 0x10000000
    call function_test
    add esp, 8
    ret

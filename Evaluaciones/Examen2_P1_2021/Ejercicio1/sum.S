#set byte [0x10000000] = ["The sum of squares is: ", 0]
call main

; Exit program
mov eax, 10
int 0x80

;size = dword[esp+8]
;arr = dword[esp+4]
;eax=sum
;i = ebx

function_sum:
    mov eax,0
    mov ebx,0

    for_princ:
        cmp ebx,dword[esp+8]
        jge end_for_princ
            mov ecx, dword[esp+4] 
            mov ecx, dword[ecx+ebx*4]
            push eax
            mov eax,ecx
            mul ecx
            mov ecx,eax
            pop eax
            add eax,ecx
            inc ebx
            jmp for_princ
    end_for_princ:
end_function_sum:
    ret


main:
    sub esp,52
    mov dword[esp+0],10
    mov dword[esp+4],43
    mov dword[esp+8],41
    mov dword[esp+12],5
    mov dword[esp+16],45
    mov dword[esp+20],50
    mov dword[esp+24],22
    mov dword[esp+28],86
    mov dword[esp+32],10
    mov dword[esp+36],20
    mov dword[esp+40],55
    mov dword[esp+44],52
    mov dword[esp+48],65
    push 13
    mov edx,esp
    add edx,4
    push edx
    call function_sum
    add esp,8
    mov edx,eax

            mov eax,4
            mov ebx,0x10000000
            int 0x80
            mov eax,1
            mov ebx,edx
            int 0x80
            mov eax,11
            mov ebx,10
            int 0x80
    add esp,52
    ret
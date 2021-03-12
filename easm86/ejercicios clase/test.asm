#set byte [0x10000000] = ["Factors are: ", 0]
 
call main
 
mov eax, 10
int 0x80
 

 ;number => dword[eps+4]
 ;count => dword[eps+8]
 ;f[] => dword[eps+12]

factors:
    mov eax, 0 ; index
    mov ebx, 1 ; i

for_factors:
    cmp ebx, dword[esp+4]
    jg end_for_factors
   
    ; eax -> dividendo
    ; ebx -> divisor
    ; edx -> residuo

    mov ecx, eax
    
    mov dword[0x10000004], ebx
   
    mov eax, dword[esp+4]
    ; ebx no necesita moverse porque tiene el valor de i
    
    if:
    mov edx, 0 ; limpio edx
    div ebx
    cmp edx, 0
    jne end_end_if
   
    condicion:
    mov eax, ecx
    mov ebx, dword[0x10000004]
    mov ecx, esp
    add ecx,12
    mov dword [ecx + 4*eax], ebx
    
    #show eax
    inc eax
    
   
   
    condicion2:
   
    cmp eax, dword[esp+8] ;count
    je end_for_factors

    end_end_if:
    inc ebx
    jmp for_factors
   
    end_for_factors:
        ret

main:
    sub esp,32

    push esp
    push 8
    push 215
    
    call factors
    add esp,12

    ;eax => fcount
    mov ecx,eax
    mov edx,0

    for_main:
        cmp edx,ecx
        jge end_formain
            mov eax,1
            mov ebx, dword[esp+edx*4]
            int 0x80
            inc edx
            
        mov eax,11
        mov ebx,32
        int 0x80
        jmp formain

    end_formain:
        mov eax,11
        mov ebx,10
        int 0x80
        add esp,32
        ret
mov ecx,0

loop:
    cmp ecx,15
    jge end_loop
        add ecx,1
        jmp horizontal
    continue_loop:
        jmp loop


horizontal:
    mov edx,0
    loop_horizontal:
        cmp edx,ecx
        jge end_loop_horizontal
            mov eax,11
            mov ebx,42
            int 0x80
            add edx,1
            jmp loop_horizontal

    end_loop_horizontal:
        mov eax,11
        mov ebx,10
        int 0x80
        jmp continue_loop
end_loop:


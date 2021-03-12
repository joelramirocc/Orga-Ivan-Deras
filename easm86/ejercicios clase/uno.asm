mov eax,0

loopl:
    cmp eax,10
    jge endloop
    #show eax signed decimal
    add eax,1
    jmp loopl
endloop:
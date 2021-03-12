
call main

factors:
    #show esp
    ret


main:
    sub esp,32
    ;push esp
    ;push 8
    ;push 215
    call factors
    ;add esp,12
    add esp,32
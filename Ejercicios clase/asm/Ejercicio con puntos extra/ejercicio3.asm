2 puntos extra clase 27/01/2021
Terminar el ejercicio durante la hora clase







;CONTADOR t0 ---------------------------
addi $t0, $zero, 0

;VALOR 2 t1 ---------------------------
addi $t1, $zero, 2

;CONTADOR2 t5 ---------------------------
addi $t5, $zero, 0

addi $v0, $zero, 5
syscall

;VALOR INGRESADO t3 ---------------------------
add $t3,$zero,$v0
div $t3,$t1

;VALOR INGRESADO/2 t2 ---------------------------
add $t2, $zero,$lo

;CONTADOR2 t6 ---------------------------
add $t6, $zero, $t2

;CONTADOR2 t7 ---------------------------
addi $t7, $zero, 0

;CONTADOR2 t8 ---------------------------
addi $t8, $zero, 1
;CONTADOR2 t8 ---------------------------
addi $t9, $zero, 0

tt:
beq $t9,$t2,t2
        addi $v0, $zero, 11
        addi $a0, $zero, 32
        syscall
addi $t9, $t9,1
j tt

t2:
        addi $v0, $zero, 11
        addi $a0, $zero, 32
        syscall
        addi $v0, $zero, 11
        addi $a0, $zero, 42
        syscall
        addi $v0, $zero, 11
        addi $a0, $zero, 10
        syscall
        addi $t9, $zero, 0

j startF_loop



startF_loop:
    beq $t0,$t2,endF_loop
    addi $t0, $t0,1
    addi $t5,$zero,0
    j printFLoop

        printFLoop:
        addi $t7,$zero,0
        beq $t5,$t6,printAsteriscosT
        addi $t5,$t5, 1
        addi $v0, $zero, 11
        addi $a0, $zero, 32
        syscall
        j printFLoop

            printAsteriscosT:
                addi $v0, $zero, 11
                addi $a0, $zero, 42
                syscall
                j printAsteriscos
                
            printAsteriscos:
                beq $t7,$t8, endprintFLoop
                addi $t7,$t7,1
                addi $v0, $zero, 11
                addi $a0, $zero, 32
                syscall
                j printAsteriscos
            


        endprintFLoop:
                addi $v0, $zero, 11
                addi $a0, $zero, 42
                syscall
        addi $t8,$t8,2
        addi $t6,$t6,-1

        addi $v0, $zero, 11
        addi $a0, $zero, 10
        syscall
        j startF_loop

    endF_loop:
    
    addi $t0,$zero,0
    addi $t6,$zero,1
    add $t8,$zero,$t7
    addi $t8,$t8,-2
    addi $t2,$t2,-1

    j startS_Loop


    startS_Loop:
    beq $t0,$t2,endS_loop
    addi $t0, $t0,1
    addi $t5,$zero,0
    j printSLoop


        printSLoop:
        addi $t7,$zero,0
        beq $t5,$t6,printSAsteriscosT
        addi $t5,$t5, 1
        addi $v0, $zero, 11
        addi $a0, $zero, 32
        syscall
        j printSLoop


            printSAsteriscosT:
                addi $v0, $zero, 11
                addi $a0, $zero, 32
                syscall
                addi $v0, $zero, 11
                addi $a0, $zero, 42
                syscall
                j printSAsteriscos

            printSAsteriscos:
                beq $t7,$t8, endprintSLoop
                addi $t7,$t7,1
                addi $v0, $zero, 11
                addi $a0, $zero, 32
                syscall
                j printSAsteriscos
                
        endprintSLoop:
                addi $v0, $zero, 11
                addi $a0, $zero, 42
                syscall
        addi $t8,$t8,-2
        addi $t6,$t6,1

        addi $v0, $zero, 11
        addi $a0, $zero, 10
        syscall
        j startS_Loop



    endS_loop:
    j end
end:



beq $t9,$t2,tt2
        addi $v0, $zero, 11
        addi $a0, $zero, 32
        syscall
addi $t9, $t9,1
j end

tt2:
        addi $v0, $zero, 11
        addi $a0, $zero, 32
        syscall
        addi $v0, $zero, 11
        addi $a0, $zero, 32
        syscall
        addi $v0, $zero, 11
        addi $a0, $zero, 42
        syscall
        addi $v0, $zero, 11
        addi $a0, $zero, 10
        syscall
        addi $t9, $zero, 0

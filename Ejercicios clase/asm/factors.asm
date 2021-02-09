.global main
;index = $v0 => RETURN
;number = $a0
;count = $a1
;f = $a2
;i => $t0

.function_factor:
    ;li $v0,0
    move $v0,$zero
    li $t0,1

    .star_for_factor:
        ;si i es igual a number 1 sino 0
        slt $t1,$a0,$t0
        
        ;condicion del for, sino es igual termina
        bne $t1,$zero,.end_for_factor

            ;startFoor
            div $a0,$t0
            mfhi $t2

            mod_i:
                bne $t2,$zero,end_mod_i
                ;if
                    ;en t1 obtengo el valor de la posicion Index*4, primera vez es 0
                    ;supongamos es 5
                    ;t1 = 5
                    sll $t1,$v0,2
                  
                    add $t1,$a2,$t1
                    sw $t0, 0($t1)
                    addi $v0,$v0,1
                    beq $v0,$a1,.end_for_factor

            end_mod_i:
                addi $t0,$t0,1
                j .star_for_factor
    .end_for_factor:
        jr $ra
main:

    addi $sp,$sp,-44
    sw $ra,32($sp)
    sw $s0, 36($sp)
    sw $s1, 40($sp)
    li $a0,215
    li $a1,8
    move $a2,$sp
    jal .function_factor
    move $s0,$v0

    li $s1,0
    

    .star_for_main:
        slt $t1,$s1,$s0
        beq $t1,$zero,.end_for_main
            sll $t1,$s1,2
            add $t1,$a2,$t1
            lw $t1, 0($t1)
            move $a0,$t1
            jal printInt
            li $a0, ' '
            jal printChar
            addi $s1,$s1,1
            j .star_for_main

    .end_for_main:
        li $a0,10
        jal printChar
        lw $ra,32($sp)
        lw $s0, 36($sp)
        lw $s1, 40($sp)
        addi $sp,$sp,44
        jr $ra
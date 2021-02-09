.global main
;index = $v0 => RETURN
;number = $a0
;count = $a1
;f = $a2
;i => $t0

.function_factor:
    li $v0,0
    li $t0,1

    start_for_factor:
            slt $t1,$a0,$t0
            bne $t1,$zero,end_for_factor
                
                div $a0,$t0
                mfhi $t2
                
                mod_i:
                    bne $t2,$zero,end_mod_i
                        ;////////////
                        ;LOGICA PARA ASIGNAR EL VALOR DE I A F[INDEX]
                        ;////////////
                            li $t3,4
                            mult $v0,$t3
                            mflo $t3
                            add $t3,$a2,$t3
                            sw $t0,0($t3)
                            ;////////////
                            addi $v0,$v0,1                        
                        ;////////////
                        ;LOGICA PARA IF
                        ;////////////
                            beq $v0,$a1,end_for_factor
                        ;////////////        
                end_mod_i:
                    addi $t0,$t0,1
                    j start_for_factor
    end_for_factor:
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
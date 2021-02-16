.global main

;a0=number
;a1=count
;a2=f
; index = v0
;t0 = i

function_factors:
    li $v0,0
    li $t0,1
    li $t3,1

    for_main:
        slt $t2,$t0,$a0
        beq $t2,$t3, continue_for
        bne $t0,$a0,end_for

    continue_for:
        mod:
         div $a0,$t0
         mfhi $t4
         bne $t4,$zero,end_mod

            sll $t5,$v0,2
            add $t5,$t5,$a2
            sw $t0,0($t5)
            addi $v0,$v0,1

            beq $v0,$a1,end_for

         end_mod:
            addi $t0,$t0,1
            j for_main

    end_for:
    jr $ra


main:
    addi $sp,$sp,-36
    sw $ra, 32($sp)

    move $a2,$sp
    li $a0,215
    li $a1,8
    jal function_factors

    li $t0,0
    move $t9,$v0
    for_principal:
        slt $t1,$t0,$t9
        beq $t1,$zero,end_for_principal
        sll $t1,$t0,2
        add $t1,$t1,$a2
        lw $a0,0($t1)
        jal printInt
        li $a0,32
        jal printChar
        addi $t0,$t0,1
        j for_principal

    end_for_principal:


    li $a0, 10
    jal printChar
    lw $ra, 32($sp)
    addi $sp,$sp,36
    jr $ra

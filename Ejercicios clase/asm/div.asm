.global main

;a0 => arreglo =>
;a1 => size
;v0 => suma
;t0 =>i

sum:
    li $v0,0
    li $t0,1

    for_sum:
        slt $t1,$t0,$a1 
        li $t5,1

        beq $t1,$t5,continue_for
        bne $t0,$a1,end_for
        continue_for:
            addi $t2,$t0,-1
            sll $t2, $t2,2 
            add $t2,$t2,$a0
            lw $t2,0($t2)
            add $v0,$v0,$t2
            addi $t0,$t0,1
            j for_sum

    end_for:
        jr $ra


main:
    addi $sp,$sp,-24
    
    sw $ra,20($sp)
    li $t0,5
    sw $t0,16($sp)
    li $t0,2
    sw $t0,12($sp)
    li $t0,3
    sw $t0,8($sp)
    li $t0,5
    sw $t0,4($sp)
    li $t0,6
    sw $t0,0($sp)

    move $a0,$sp
    li $a1,5

    jal sum

    move $a0,$v0
    jal printInt

    li $a0,10
    jal printChar

    lw $ra,20($sp)
    addi $sp,$sp,-24
    jr $ra


;<=1 continue_for
;==0 continue_for
;>=0 end_for
.global selectionSort

;a0= numbers
;a1=size

;a0=*beg
;a1=*int

min_element:
    addi $v0,$a0,1

    while_p:
        lw $t0,0($a0)
        lw $t1,0($a1)
        beq $a0,$a1, end_while
        slt $t2,$t0,$t1
        beq $t2,$zero,end_if
            move $v0,$a0
        end_if:
            addi $a0,$a0,1
            j while_p

    end_while
     jr $ra



selectionSort:
    $addi $sp,$sp,-16
    sw $ra,0($sp) 

    ;beg
    sw $a0,4($sp)
    add $t0, $a0,$a1;
    ;end
    sw $at0,8($sp)
    ;s0 original
    sw $s0,12($sp)


    while:
        lw $s0,4($sp)
        lw $t1,8($sp)
        addi $t4,$sp,4
        addi $t5,$sp,8

        beq $t4,$t5,end_while
        
        add $a0,$sp,4
        add $a1,$sp,8
        jal fun_min_element

        ;valor de *it
        lw $t3,0($v0)

        beq $s0,$t3,end_if
            sw $t3,4($sp)
            sw $s0,0($v0)
        end_if:
        addi $t5,$t5,1
        sw $t5,4($sp)
        j while

    end_while:

    lw $s0,12($sp)
    lw $ra,0($sp)
    $addi $sp,$sp,16
    jr $ra

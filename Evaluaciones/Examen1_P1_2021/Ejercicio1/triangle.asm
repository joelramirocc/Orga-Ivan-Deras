.global draw_triangle

draw_triangle:
addi $sp,$sp,-4
sw $ra,0($sp)

    li $s0,2
    move $t8,$a0
    addi $t8,$t8,-2
    li $t0,0
    move $t1,$t8
    li $t7,1
    li $t2,1
    addi $t6,$t8,1
    li $t9,0
  
    f_for:
        slt $t4,$t9,$t6
        beq $t4,$zero, end_f
            li $a0,32
            jal print_char
            addi $t9,$t9,1
            j f_for     
    end_f:
            li $a0,42
            jal print_char

            li $a0,10
            jal print_char


    for_triangle:
        slt $t4,$t0,$t8
        beq $t4,$zero, end_for_triangle
            j print_horizontal
        continue_for:
            addi $t0,$t0,1
            j for_triangle

    end_for_triangle:
    j end

print_horizontal:
    li $t3,0
    
    for_horizontal:
        slt $t4,$t3,$t1
        beq $t4,$zero,end_for_horizontal
            addi $t3,$t3,1
            li $a0,32
            jal print_char
            j for_horizontal
    end_for_horizontal:
        li $a0,42
        jal print_char
    j second_print

second_print:
    li $t5,0
    for_h:
        slt $t4,$t5,$t7
        beq $t4,$zero, end_for_h
            addi $t5,$t5,1
            li $a0,32
            jal print_char
            j for_h
    end_for_h:
        li $a0,42
        jal print_char
        li $a0,10
        jal print_char
        addi $t1, $t1,-1
        addi $t7, $t7,2
        addi $s0,$s0,1
        j continue_for
end:

    li $t9,0
    addi $s0,$s0,2

    f_forf:
        slt $t4,$t9,$s0
        beq $t4,$zero, end_ff
            li $a0,42
            jal print_char
            addi $t9,$t9,1
            j f_forf     
    end_ff:

            li $a0,10
            jal print_char

lw $ra,0($sp)
addi $sp,$sp,4
jr $ra
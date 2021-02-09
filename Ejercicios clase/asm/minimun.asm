.global main
;array=$a0
;size=$a1
;minPos=$a2
;minVal=$a3

function_minimum:

    lw $t0,0($a0)
    sw $t0,0($a3)
    sw $zero,0($a2)
    
    li $t0,1

    for_function_minimum:
        slt $t1, $t0,$a1
        beq $t1,$zero,end_for_function_minimum
            
            ;/////////////////////////////for>>>>
                ;//sacando valor en la posicion c= t2
                sll $t2,$t0,2
                add $t2,$t2,$a0
                lw $t2,0($t2)
                ;//sacando valor en la posicion minVal
                lw $t3,0($a3)

                slt $t3,$t2,$t3
                beq $t3,$zero,end_if
                ;/////////////////////////////if>>>>
                sw $t2,0($a3)
                sw $t0,0($a2)

                ;/////////////////////////////if<<<<
        end_if:
            addi $t0,$t0,1
            j for_function_minimum
        ;/////////////////////////////for<<<<

    end_for_function_minimum:
    jr $ra



main:
    addi $sp,$sp,-52
    sw $ra,40($sp)
    li $t0,9
    sw $t0,36($sp)
    li $t0,45
    sw $t0,32($sp)
    li $t0,24
    sw $t0,28($sp)
    li $t0,9
    sw $t0,24($sp)
    li $t0,52
    sw $t0,20($sp)
    li $t0,8
    sw $t0,16($sp)
    li $t0,1
    sw $t0,12($sp)
    li $t0,48
    sw $t0,8($sp)
    li $t0,96
    sw $t0,4($sp)
    li $t0,91
    sw $t0,0($sp)

;minPos=$a2
;minVal=$a3

    li $t0,11
    sll $t0,$t0,2
    add $a3,$sp,$t0

    li $t0,12
    sll $t0,$t0,2
    add $a2,$sp,$t0


    move $a0,$sp
    li $a1,10
    jal function_minimum

    lw $a2,0($a2)
    lw $a3,0($a3)
    
    move $a0,$a3
    jal printInt
    li $a0,' '
    jal printChar
    move $a0,$a2
    jal printInt

    lw $ra,40($sp)
    addi $sp,$sp,52
    jr $ra

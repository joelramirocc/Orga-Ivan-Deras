.global main

; arreglo = a0
; n = a1
;min = v0
;i=t1

function_get_min:
    li $v0,0
    li $t1,1

    for_get_min:
        
        slt $t2,$t1,$a1       
        
        beq $t2,$zero,end_function_min
            
            li $t2,4
            mult $v0,$t2
            mflo $t3
            add $t3,$t3,$a0
            lw $t3,0($t3)
            
            mult $t1,$t2
            mflo $t4
            add $t4,$t4,$a0
            lw $t4,0($t4)

            slt $t2,$t3,$t4
            
            beq $t3,$t4,end_for_get_min
            bne $t2,$zero,end_for_get_min
                add $v0,$zero,$t1
            
    end_for_get_min:
        addi $t1,$t1,1
        j for_get_min

    end_function_min:
        jr $ra
main:
    
    addi $sp,$sp,-20    
    sw $ra,16($sp)
    li $s0,0
    sw $s0,12($sp)
    li $s0,25
    sw $s0,8($sp)
    li $s0,35
    sw $s0,4($sp)
    li $s0,20
    sw $s0,0($sp)

    move $a0,$sp
    li $a1,4
    jal function_get_min
    move $a0,$v0
    jal printInt

    lw $ra,16($sp)
    addi $sp,$sp,20
    jr $ra
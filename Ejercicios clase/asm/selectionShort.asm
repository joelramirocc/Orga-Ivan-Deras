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


;arreglo = $a0
;n=a1



function_selection_short:
    addi $sp,$sp, -12
    sw $a0,8($sp)
    sw $ra,4($sp)
    sw $a1,0($sp)

    ;/////////////////////REFERENCIA APUNTADORES
    li $t0,1
    beq $t0,$a1, end_function_selection_short
    slt $t0,$a1,$t0

    bne $t0,$zero,end_function_selection_short
    ;//////////////////////////////if n>1 >>>
    
        jal function_get_min
        move $t0,$v0
        beq $t0,$zero,end_if
        
        ;//////////////////IF >>>
            lw $t1,0($a0)            
            ;t1 => arreglo[0]

            li $t3,4
            mult $t3,$t0
            mflo $t3
            add $t3,$t3,$a0

            ;valor en la posicion pos
            lw $t4,0($t3)

            sw $t4,0($a0)
            sw $t1,0($t3)            
    
        ;//////////////////IF <<<
    end_if:
    ;/////////////Lo que va afuera del if

    addi $a0,$a0,4
    addi $a1,$a1,-1    
    jal function_selection_short

end_function_selection_short:
    lw $ra,4($sp)
    lw $a0,8($sp)
    lw $ra,4($sp)
    addi $sp,$sp,12
    jr $ra










main:
    
    addi $sp,$sp,-24
    sw $ra,16($sp)
    li $s0,15
    sw $s0,12($sp)
    li $s0,20
    sw $s0,8($sp)
    li $s0,20
    sw $s0,4($sp)
    li $s0,25
    sw $s0,0($sp)

    move $a0,$sp
    li $a1,4
    sw $a1,20($sp)
    jal function_selection_short
    move $t5,$a0
    li $t0,0
    lw $a1,20($sp)

    for_main:
        slt $t1,$t0,$a1
        beq $t1,$zero,end_for_main
            li $t3,4
            mult $t3,$t0
            mflo $t3
            add $t3,$t3,$t5
            lw $a0,0($t3)
            jal printInt
            addi $t0,$t0,1
            li $a0,32
            jal printChar
            j for_main
    end_for_main:
    li $a0, 10
    jal printChar

    lw $ra,16($sp)
    addi $sp,$sp,24
    jr $ra
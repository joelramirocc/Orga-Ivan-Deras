.global main


;a[] -> a0
;size->a1
;sum -> $v0
;i->$t1

function_array_sum:

    li $v0,0
    li $t1,0
    
    for_array:
        slt $t0,$t1,$a1
        beq $t0,$zero,for_array_end

        ;extraeremos a[i]
        ;a[]->a0
        ; guardamos en t0 la posicion en bits para leer del array.
        ; i * 4. 0*4,1*4,2*4,3*4 y asi recorremos todo el array
        sll $t0, $t1,2

        ;ubicamos el puntero en posicion del array + elementos a recorrer
        ; 500 +4,500+8,500+12
        add $t0,$a0,$t0
        
        ;asignamos en t0 el valor de esa posicion
        lw $t0,0($t0)       

        ;asignar a sum el valor de a[i]
        add $v0,$v0,$t0


        ;incremental for
        addi $t1,$t1,1
        j for_array

    for_array_end:
        jr $ra

main:
    addi $sp,$sp,-16
    sw $ra, 12($sp)

    li $t0,10
    sw $t0,0($sp)
    
    li $t0,20
    sw $t0,4($sp)
    
    li $t0,30
    sw $t0,8($sp)

    ;asignar el apuntador de la posicion inicial para llamar a la funcion
    move $a0,$sp
    li $a1,3
    jal function_array_sum

    move $a0,$v0
    jal printInt

    li $a0,10
    jal printChar

    lw $ra,12($sp)
    addi $sp,$sp,16
    jr $ra
addi $t0, $zero, 0
addi $t1, $zero,10

start_loop:
beq $t0, $t1, end_loop
;#show $t0 signed decimal

; imprimir int
addi $v0, $zero, 1
add $a0, $zero, $t0
syscall

;imprimir caracter o salto de linea
;salto de linea ASCII = 10
addi $t0, $t0, 11
addi $a0, $zero, 10
syscall


j start_loop

end_loop:
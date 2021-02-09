addi $t0, $zero, 0
addi $t5, $zero, 0
addi $v0, $zero, 5
add $t2, $zero,$v0
syscall

start_loop:
beq $t0,$t2, end_loop
addi $t0, $t0,1
addi $t5,$zero,0
j secondLoop


secondLoop:
beq $t5,$t0,endSecondLoop
addi $t5,$t5, 1
addi $v0, $zero, 11
addi $a0, $zero, 42
syscall

j secondLoop

endSecondLoop:
addi $v0, $zero, 11
addi $a0, $zero, 10
syscall
j start_loop



end_loop:
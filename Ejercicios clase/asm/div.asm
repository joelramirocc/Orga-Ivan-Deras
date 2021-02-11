.global main


main:

li $t0,15
li $t1,5

div $t0,$t1

mflo $t3
move $a0,$t3
jal printInt

li $a0,10
jal printChar

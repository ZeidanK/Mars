li $s0, 0x10010000
li $s1,1
li $s2, 10
li $t0 , 0


while:bgt $s1,$s2 ,Exit

add $t2,$s0,$t0
sw $s1,0($t2)
addi $s1,$s1,1
addi $t0,$t0,4

j while

Exit:
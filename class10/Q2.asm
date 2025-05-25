.data
msg: .asciiz "\nEnter number (1-100) :\n"

.text
.globl main

main:
    
    la $a0 msg
    li $v0 4
    syscall
    
    li $v0 5
    syscall
    
    blt $v0 1 main
    bgt $v0 100 main

    move $a0 $v0
    jal square
    move $a0 $v0
    jal square
    
    move $a0 $v0
    li $v0 1
    syscall
    
    li $v0 10
    syscall
	
	
square:
    addi $sp $sp -4
    sw $s0 ($sp)
    add $t0 $0 $a0 #value to add
    add $t1 $0 $a0 #loop i
    add $s0 $0 $0
loop:
    blez $t1 return
    add $s0 $s0 $t0
    addi $t1 $t1 -1
    j loop
    
return:
    move $v0 $s0
    lw $s0 ($sp)
    addi $sp $sp 4
    jr $ra

    
    
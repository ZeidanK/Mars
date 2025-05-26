
.data
msg: .asciiz "\nEnter number (1-10) :\n"

.text
.globl main

main:
    
    la $a0 msg
    li $v0 4
    syscall
    
    li $v0 5
    syscall
    
    blt $v0 1 main
    bgt $v0 10 main

    move $a0 $v0
    jal factorial
    move $a0 $v0
    #jal square
    
    #move $a0 $v0
    li $v0 1
    syscall
    
    li $v0 10
    syscall
	
	
factorial: # we want to writ a recursive function 
	# we need to save the return addres each call
	addi $sp $sp -8  # we save two words rs and the value
	sw $ra 0($sp)	 
	sw $s0 4($sp)
	
	
	addi $s0 $0 1
	beqz $a0 return # the a0 is the param we want to get from the next call
	
else:
	move $s0 $a0 # in s0 we save the current value we get from the function in a0
	addi $a0 $a0 -1
	jal factorial
	
	multu $v0 $s0 # multiply without overflow?
	
	
return:
	move $v0 $s0
	lw $ra 0($sp)
	
	
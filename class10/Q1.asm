#using syscalls to take input from user then power

.data 
param: .word 3 #name param givin the value 3 for init
result: .word 0 # init the result to be 0

.text
.globl main

main:
	lw $a0 param
	jal square # jump and link to call a new function
	move $a0 $v0
	jal square
	sw $v0 result
	
	
	li $v0 10
	syscall
	
square:
	addi $sp $sp -4 # store word
	sw $s0 0($sp)
	move $t0 $a0 # variable
	move $t1 $a0 # counter
	add $s0 $0 $0
loop:
	beqz $t1 return # branch not equal zero
	add $s0 $s0 $t0
	addi $t1 $t1 -1 # update the counter
	j loop # jump back to loop
	
return:
	move $v0 $s0
	# we have to return what was in s0 and reset the pointer
	lw $ra 0($sp)
	addi $sp $sp 4
	jr $ra

	#lw $s1 result
	#lw $t1 param
	#loop:
	#	addi $s1 $0 $s1
	#	addi $t1 $t1 -1
	#	beq $t1,$0,loop
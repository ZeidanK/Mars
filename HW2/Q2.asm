# Q2 have space for two strings 100 max size each and then comp the len

.data
msg1: .asciiz "\n please enter first string \n"
msg2: .asciiz "\n please enter second string \n"
msg3: .asciiz "\n the two strings are the same size"
str1: .space 100
str2: .space 100

.text
.globl main

main:

la $a0,msg1
li $v0,4  # ask user for string 1
syscall 
la $a0,str1 # set the input address into a0
li $a1,100  # set the max size for the string
    li $v0,8 # 8 for string input from user
    syscall
    jal strlen # after getting the input send the str1 address in a0 to strlen
    move $t1, $v0 # save the len of the string 1 into t1
    la $a0,msg2
    li $v0,4 	# start the same thing for string 2
    syscall
    
    la $a0,str2
li $a1,100
    li $v0,8
    syscall
    jal strlen
    move $t2, $v0
    #la $a0,($v0)
    blt $t1,$t2 , printStr2
    blt $t2,$t1 , printStr1
    beq $t2,$t1 , printEqual

li $v0,10
syscall
    #sw $v0 arr($t1)
    
printStr1:
	la $a0,str1
	li $v0,4  # ask user for string 1
	syscall 
	li $v0,10
syscall
	jr $ra
	
printStr2:
	la $a0,str2
	li $v0,4  # ask user for string 1
	syscall 
	li $v0,10
syscall
	jr $ra
	
		
printEqual:
	la $a0,msg3
	li $v0,4  # ask user for string 1
	syscall 
	li $v0,10
syscall
	jr $ra
# Function to calculate string length
# Input: $a0 = string address
# Output: $v0 = string length
strlen:
    li $v0, 0       # Initialize length counter
    
strlen_loop:
    lb $t2, ($a0)   # Load current character
    beqz $t2, strlen_end  # Exit if null terminator
    addi $v0, $v0, 1  # Increment length counter
    addi $a0, $a0, 1  # Move to next character
    j strlen_loop
    
strlen_end:
    jr $ra          # Return to caller


#strlen: ## input one string output the length of the string without the \n
	


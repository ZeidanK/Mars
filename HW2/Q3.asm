.data 
res: .word
str: .space 200
msg2: .asciiz "\n please enter a number \n"
space: .ascii " "
star: .ascii "*"
el: .ascii "\n"

.text

.globl main

main:

la $a0,msg2
    li $v0,4
    syscall
    li $v0,5
    syscall
    sw $v0 res
    
    
    lw $s1 res # the number of rows
    li $s2,1   # the number of start each row we add 2
    add $s3 $s1 -1 # the number of spaces on the left
    lb $s6 space
    lb $s4 star
    lb $s5 el
    move $t3 $s1
    loop:
    	blez $t3 end  # loop as the number in res from the user
    	li $t1 0      # t1 index for the string 
    	move $t2 $s2
    	spaceloop:
    		bgt $t1 $s3 starloop  # go to star loop after being done with the spaces
    		sb $s6 str($t1)
    		addi $t1 $t1 1
    		j spaceloop
    	starloop:
    		ble $t2 0 addline
    		sb $s4 str($t1)
    		addi $t1 $t1 1
    		addi $t2 $t2 -1
    		j starloop
    		
    	addline:
    		sb $s5 str($t1)
    		addi $s2 $s2 2
    		addi $s3 $s3 -1
    		la $a0,str
   		li $v0,4
    		syscall
    		addi $t3 $t3 -1
    		j loop
    	
end:
li $v0,10
syscall
    	


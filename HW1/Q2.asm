.data
arr: .word 5,4
result: .space 4

.text 
move $t1,$0 # $t1 will be the index starting at 0

addi $t2 $t1 4 # letting $t2 be the next addres after t1


lw $t4,arr($t1) # load the first digit into t4
lw $t5,arr($t2) # load the second digit into t5
loop:
lw $s1,result($0)
add $s1 $s1 $t4 # adding the value of t4 into s1 once for each multiplication 

sw $s1,result($t0) #saving the result each time we add 
addi $t5 $t5 -1 #remove one from the second number each time we multiply 
bne $t5,$0,loop

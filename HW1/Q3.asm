#Q3

.data
arr: .word 1,2,3,4,5,6,7,8,9,10
res: .space 4

.text 
move $t1,$0

# we want to go over 10 indexs in the array 

ArrLoop:

lw $t2,arr($t1) # getting the value at index $t1
addi $t3 $t2 0 # getting another temp variable to hold the same value for second loop
sw $0,res($0) # init the res to be 0 

multyLoop:
add $s1 $s1 $t2 # adding the value to the res 
addi $t3 $t3 -1 # removing 1 from the value for each add
sw $s1,res($0)
bne $t3,$0,multyLoop

sw $s1,arr($t1)
add $s1 $s0 0 # reset s1 to 0
addi $t1 $t1 4 # move t1 4 moves forward for next index

bne $t1,40,ArrLoop



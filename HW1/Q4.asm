#Q4

.data
arr: .word 1,2,3,4,5,6,7,8,9,10 # 0,4,8,12,16,20,24,28,32,36  

.text
move $t1,$0

# we want to move each one to the right but 10 will be first
# better to start from the end 

addi $t1 $t1 36 # letting t1 point at 10
addi $t2 $t1 -4 # the second ptr for the value before

lw $s1,arr($t1) # load the last value and keep it in $s1 for now
loop:

lw $s2,arr($t2) # read the value that will be inserted next

sw $s2,arr($t1) # save the 9 in 10's place
addi $t1 $t1 -4
addi $t2 $t2 -4

bne $t1,$0,loop
sw $s1,arr($t1)
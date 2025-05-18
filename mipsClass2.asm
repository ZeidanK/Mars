#q2
# getting the power 128 is 2^6 so we need a loop
# 128 return 7
# 512 return 9
#addi $t0 $0 128
#add $s0 $0 $0
#addi $t1 $0 1
# we use shift left sll for the power of 2
#loop:
#beq $t0 $t1 done 

#addi $s0 $s0 1
#sll $t1 $t1 1 # we use 1 for power of 2 if it was power of 4 we use 2
#j loop
#done:

#q3

li $t0 100
li $t1 20
li $t2 0x10010000
# store word
sw $t0 0($t2)
sw $t1 4($t2) # 4 bytes each reg is 32 bit

lw $t0 4($t2) # we load the two saved words numbers so we can comp them
lw $t1 0($t2)
sub $s0 $t0 $t1
bgez $s0 store #b greater equal zero ?
sub $s0 $t1 $t0

store:
sw $s0 8($t2)


#q4

li $s0 0x10010000
li $s1 7
li $s2 100 # stop condition
li $s3 65 # number to find
or $t2 $0 $0 # offset
move $t0 $s1
#after move we want to create the loop
loop:
add $t1 $s0 $t2 # usint t2 for the offset t1 destination address
sw $t0 0($s1)
add $t0 $t0 $s1
bge $t0 $s2 find
# after we save we increment t2 the offset by 4
addi $t2 $t2 4 #no sll as we only add not mult
#add $t0 $t0 $s1 # add 7 to num
j loop
find:
lw $t0 0($t1)
ble $t0 $s3 done# condition if its smaller we jump to the end ble will be translated into two commands as its psodu
addi $t1 $t1 -4

done:




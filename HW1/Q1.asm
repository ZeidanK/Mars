.data
array1: .word 5,10

.text
move $t1,$0
addi $t1 $0 4


lw $t5,array1($0)
lw $t6,array1($t1)

sw $t5,array1($t1)
sw $t6,array1($0)
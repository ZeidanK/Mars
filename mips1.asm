# this is the first test

.data

msg1:	.asciiz "this is my message"

.text

__start:
	

	la $t0,msg1	# this is a comment
	lw $t1,0($t0)
	
	addi $t1,$t2,-100     #commands blue
			#variables red
			#constants black
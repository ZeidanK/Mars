# sample get input function
.data
.text
loop:	addi	$2,$0,12	# "getc" synthasized in TAL the
		 syscall	# syscall askes for the key, the
		 		# value of the key is placed in $v0
	add	$t0,$0,$v0	# this places the ascii value into $t0
	addi	$t1,$t0,-48	# $t1 holds the non biased value
	j	loop
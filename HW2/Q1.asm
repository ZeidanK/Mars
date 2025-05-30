# start with writing a function that takes in 3 inputs 
# and calculates the int average of the three inputs

main:
    # Initialize test values
    li $s1, 8       # First number = 8
    li $s2, 9       # Second number = 9
    li $s3, 10      # Third number = 10
    
    # Pass arguments (using $a0-$a2 registers)
    move $a0, $s1   # First argument in $a0
    move $a1, $s2   # Second argument in $a1
    move $a2, $s3   # Third argument in $a2
    
    jal average     # Call the function
    
    # Result is now in $v0
    move $a0, $v0   # Prepare to print result
    li $v0, 1       # System call for print_int
    syscall
    
    li $v0, 10      # Exit program
    syscall

average:
    # Function prologue - save registers we'll modify
    addi $sp, $sp, -4   # Allocate space on stack
    sw $ra, 0($sp)      # Save return address
    
    # Sum the arguments (already in $a0-$a2)
    add $t0, $a0, $a1   # Add first two numbers
    add $t0, $t0, $a2   # Add third number
    
    # Divide by 3 to get average
    li $t1, 3
    div $t0, $t1        # Divide sum by 3
    mflo $v0           # Get quotient (integer average)
    
    # Function epilogue - restore registers
    lw $ra, 0($sp)     # Restore return address
    addi $sp, $sp, 4    # Deallocate stack space
    
    jr $ra             # Return to caller
	

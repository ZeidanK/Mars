.text
    # test main: call MyFunc
    #
    # call function, pass some parameters
    li $a0, 20          # load first arg register
    li $a1, 15          # load second arg register
    jal MyFunc          # the actual invocation 
                        # this jumps to the function, 
                        #   while also passing the return address in $ra

                        # here's where come back to when the function is done:
    move $a0, $v0       # move return value into $a0, so we can print it

    li $v0, 1           # and print
    syscall

    li $v0, 10          # and stop the program
    syscall
#
#
#
MyFunc:                 # start of MyFunc
    # ...               # code of function goes here
    jr $ra              # jump back to the caller by using the return address register
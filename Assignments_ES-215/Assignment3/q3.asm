.data
number1:   .word 10  # First number
number2:   .word 25  # Second number
gcd:       .word 0       
lcm_result: .word 0       
msg:       .asciiz "The LCM is: " 

.text
.globl main

main:
    lw $t0, number1       # $t0 = number1
    lw $t1, number2       # $t1 = number2
    
    move $t2, $t0         # $t2 = number1
    move $t3, $t1         # $t3 = number2
    
gcd_loop:
    beq $t1, $zero, done_gcd  # if $t1 == 0, then GCD is in $t0
    div $t0, $t1              # Divide $t0 by $t1
    mfhi $t4                  # $t4 = remainder
    move $t0, $t1             # Move $t1 to $t0
    move $t1, $t4             # Move remainder to $t1
    j gcd_loop                # Repeat the loop

done_gcd:
    # Calculate LCM
    mul $t5, $t2, $t3        # $t5 = number1 * number2
    div $t5, $t0             # Divide $t5 by GCD
    mflo $t6                 # $t6 = LCM result
    sw $t6, lcm_result      # Store LCM result in memory

# Print the message
    li $v0, 4              
    la $a0, msg            
    syscall               

# Print the LCM result
    li $v0, 1            
    lw $a0, lcm_result      
    syscall               

# Exit the program
    li $v0, 10         
    syscall
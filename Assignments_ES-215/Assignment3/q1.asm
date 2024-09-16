.data
num1:   .word 0x1134   # First 16-bit number is 4404
num2:   .word 0x11F0   # Second 16-bit number is 4592
result: .word 0       # To store the subtraction result 
msg:    .asciiz "Result: " # Message to print before the result

.text
.globl main

main:
    lw $t0, num1         # $t0 = num1
    lw $t1, num2         # $t1 = num2

    not $t1, $t1         # $t1 = ~num2
    addi $t1, $t1, 1    # $t1 = ~num2 + 1 (2's complement)

    add $t2, $t0, $t1   # $t2 = num1 - num2

    sw $t2, result      # result = $t2

#printing the result
    li $v0, 4           
    la $a0, msg         
    syscall             
    li $v0, 1          
    lw $a0, result      
    syscall          
    li $v0, 10          
    syscall            
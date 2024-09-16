.data
values: .word 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45
avg_result: .word 0
msg_text: .asciiz "The average is: "

.text
.globl main

main:
    # Initialize sum and counters
    li $t0, 0           # sum = 0
    li $t1, 15          # count = 15 (number of elements)
    li $t2, 0           # index = 0
    la $t3, values      # load base address of the array

sum_values:
    beq $t2, $t1, compute_avg   # if index == count, go to compute average
    lw $t4, 0($t3)             # load current element from array
    add $t0, $t0, $t4          # sum += current element
    addi $t3, $t3, 4           # move to next array element
    addi $t2, $t2, 1           # increment index
    j sum_values               # repeat loop

compute_avg:
    li $t5, 15                 # divisor = 15
    div $t0, $t5               # divide sum by count
    mflo $t6                   # store result in $t6
    sw $t6, avg_result         # save the average in memory

# Display message
    li $v0, 4
    la $a0, msg_text
    syscall

# Display the average value
    li $v0, 1
    lw $a0, avg_result
    syscall

# End the program
    li $v0, 10
    syscall

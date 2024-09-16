.data
    value1:  .word 7         # First number for multiplication
    value2:  .word 4         # Second number for multiplication
    prod:    .word 0         # To store the product
    linebreak: .asciiz "\n"  # For newline display

.text
    .globl main

main:
    lw $t0, value1           # Load value1 into $t0
    lw $t1, value2           # Load value2 into $t1
    li $t2, 0                # Initialize $t2 (product) to 0
    li $t3, 0                # Initialize $t3 (counter) to 0

multiply_loop:
    beq $t1, $t3, finish     # If counter == value2, end loop
    add $t2, $t2, $t0        # Add value1 to product
    addi $t3, $t3, 1         # Increment counter
    j multiply_loop          # Jump back to loop

finish:
    sw $t2, prod             # Store product in memory

    # Print the product
    li $v0, 1                # Syscall to print integer
    move $a0, $t2            # Move product into $a0
    syscall                  # Print the product

    # Print a newline
    li $v0, 4                # Syscall for printing string
    la $a0, linebreak        # Load newline address
    syscall                  # Print newline

    # Exit program
    li $v0, 10               # Syscall for program exit
    syscall

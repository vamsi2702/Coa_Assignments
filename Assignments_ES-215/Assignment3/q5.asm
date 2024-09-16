.data
    numbers:      .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19  # Sorted list of 10 numbers
    X:            .word 7                              # Number to search for (example)
    output:       .word 0                             # Output location
    not_found_msg: .asciiz "Number not found.\n"      # Message for number not found
    found_msg:     .asciiz "Number found.\n"         # Message for number found
    iterations_msg: .asciiz "Iterations: "           # Message for iterations
    index_msg:     .asciiz " Index: "                 # Message for index

.text
    .globl main

main:
    lw $t0, X              # Load the number to search for into $t0
    li $t1, 0              # Initialize index to 0
    li $t2, 10             # Total number of elements
    li $t3, 0              # Initialize iteration counter to 0

search_loop:
    beq $t1, $t2, not_found # If index equals total number, jump to not_found
    lw $t4, numbers($t1)   # Load the current number from the list
    addi $t3, $t3, 1       # Increment iteration counter
    beq $t0, $t4, found    # If the number matches, jump to found
    addi $t1, $t1, 4       # Move to the next number in the list
    j search_loop          # Repeat the loop

not_found:
    li $t5, 2              # Store 2 in output (number not found)
    sw $t5, output         # Store result
    
    # Print "Number not found."
    li $v0, 4              # Syscall for print string
    la $a0, not_found_msg  # Load address of the not found message
    syscall                # Print the message
    j exit_program         # Exit the program

found:
    li $t5, 1              # Store 1 in output (number found)
    sw $t5, output         # Store result
    sw $t3, output + 4     # Store the number of iterations at output + 4
    srl $t6, $t1, 2        # Calculate the index by dividing the byte offset by 4
    sw $t6, output + 8     # Store the index of the found number at output + 8

    # Print "Number found."
    li $v0, 4              # Syscall for print string
    la $a0, found_msg      # Load address of the found message
    syscall                # Print the message

    # Print the number of iterations
    li $v0, 4              # Syscall for print string
    la $a0, iterations_msg # Load address of the iterations message
    syscall                # Print the message
    li $v0, 1              # Syscall for print integer
    lw $a0, output + 4     # Load the number of iterations from output + 4
    syscall                # Print the number of iterations

    # Print the index
    li $v0, 4              # Syscall for print string
    la $a0, index_msg      # Load address of the index message
    syscall                # Print the message
    li $v0, 1              # Syscall for print integer
    lw $a0, output + 8     # Load the index from output + 8
    syscall                # Print the index

exit_program:
    li $v0, 10             # Load the exit syscall code
    syscall                # Exit the program
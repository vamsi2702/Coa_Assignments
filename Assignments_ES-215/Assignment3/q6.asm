.data
    sentence:   .asciiz "Assembly"   # The string to search through
    target:     .byte 'z'                    # Character to find
    msg_notfound: .asciiz "Character not found.\n"
    msg_found:    .asciiz "Character found at position: "
    newline_char: .asciiz "\n"

.text
    .globl main

main:
    # Initialize registers
    la $t0, sentence         # Load the address of the sentence into $t0
    lb $t1, target           # Load the target character to find into $t1
    li $t2, 0                # Initialize position/counter in $t2

find_loop:
    lb $t3, 0($t0)           # Load the current character from sentence
    beq $t3, $zero, no_match # If end of sentence (null terminator), jump to no_match
    beq $t3, $t1, match      # If the current character matches, jump to match
    addi $t0, $t0, 1         # Move to the next character in the sentence
    addi $t2, $t2, 1         # Increment the position counter
    j find_loop              # Repeat the loop

no_match:
    # Print "Character not found."
    li $v0, 4                # Syscall to print a string
    la $a0, msg_notfound      # Load the address of the not found message
    syscall                  # Print the message
    j end_program            # Jump to exit

match:
    # Print "Character found."
    li $v0, 4                # Syscall to print a string
    la $a0, msg_found         # Load the address of the found message
    syscall                  # Print the message
    
    # Print the position (stored in $t2)
    li $v0, 1                # Syscall to print an integer
    move $a0, $t2            # Move the position into $a0
    syscall                  # Print the position

    # Print newline
    li $v0, 4                # Syscall to print a string
    la $a0, newline_char      # Load the address of the newline character
    syscall                  # Print newline

end_program:
    # Exit the program
    li $v0, 10               # Exit syscall
    syscall

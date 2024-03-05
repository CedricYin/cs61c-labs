.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    addi sp, sp, -4
    sw s0, 0(sp)
    addi s0, x0, 1  # sum = 1
    add t0, x0, a0  # n
    loop:
        beq t0, x0, end
        mul s0, s0, t0
        addi t0, t0, -1  # n--
        jal x0, loop
    end:
        add a0, x0, s0
        lw s0, 0(sp)
        addi sp, sp, 4
        jr ra
    

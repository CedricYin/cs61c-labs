.import lotsofaccumulators.s

.data
inputarray: .word 1,2,3,4,5,6,7,0
inputarray2: .word 0,4

TestPassed: .asciiz "Test Passed!"
TestFailed: .asciiz "Test Failed!"

.text
# Tests if the given implementation of accumulate is correct.
#Input: a0 contains a pointer to the version of accumulate in question. See lotsofaccumulators.s for more details
#
#
#
#The main function currently runs a simple test that checks if accumulator works on the given input array. All versions of accumulate should pass this.
#Modify the test so that you can catch the bugs in four of the five solutions!
main:
    la a0 inputarray

    li t2, 10
    li s0, 10
    mv s1, s0
    lw s2, 4(sp)

    addi sp, sp, -4
    sw t2, 0(sp)
    jal accumulatorone
    lw t2, 0(sp)
    addi sp, sp, 4

    li t0 28
    li t1, 0
    bne a0, t0, Neq1
    addi t1, t1, 1
Neq1:
    bne s1, s0, Neq2
    addi t1, t1, 1
Neq2:
    lw s3, 4(sp)
    bne s2, s3, Neq3
    addi t1, t1, 1
Neq3:
    la a0, inputarray2
    jal accumulatorone
    li t0, 0
    bne a0, x0, Neq4
    addi t1, t1, 1
Neq4:
    li t0, 4
    beq t1 t0 Pass
Fail:
    la a0 TestFailed
    jal print_string
    j End
Pass:
    la a0 TestPassed
    jal print_string
End:
    jal exit

print_int:
	mv a1 a0
    li a0 1
    ecall
    jr ra
    
print_string:
	mv a1 a0
    li a0 4
    ecall
    jr ra
    
exit:
    li a0 10
    ecall
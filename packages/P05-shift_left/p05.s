# P05 program - see README.md for the task.
# Rules: start at the label p05_main and finish with ret; every label you
# create starts with p05_ ; save ra (and any s registers you use) on the stack.
# You may call the library routines in sw/lib/rcv_lib.s (rcv_puts, rcv_getc, ...).
       # P05 - Multiply with shifts

.text

p05_main:
    addi sp, sp, -32
    sw ra, 28(sp)
    sw s0, 24(sp)
    sw s1, 20(sp)
    sw s2, 16(sp)
    sw s3, 12(sp)

    # Read signed decimal number N
    call rcv_read_dec
    mv s0, a0

    # Calculate N*2, N*4, N*8
    slli s1, s0, 1
    slli s2, s0, 2
    slli s3, s0, 3

    # Print N*2
    la a0, p05_msg2
    call rcv_puts
    mv a0, s1
    call rcv_print_dec
    call rcv_newline

    # Print N*4
    la a0, p05_msg4
    call rcv_puts
    mv a0, s2
    call rcv_print_dec
    call rcv_newline

    # Print N*8
    la a0, p05_msg8
    call rcv_puts
    mv a0, s3
    call rcv_print_dec
    call rcv_newline

    # Print N*10 = N*8 + N*2
    la a0, p05_msg10
    call rcv_puts
    add a0, s3, s1
    call rcv_print_dec
    call rcv_newline

    lw s3, 12(sp)
    lw s2, 16(sp)
    lw s1, 20(sp)
    lw s0, 24(sp)
    lw ra, 28(sp)
    addi sp, sp, 32
    ret

.rodata
p05_msg2:
    .asciz "N*2  = "

p05_msg4:
    .asciz "N*4  = "

p05_msg8:
    .asciz "N*8  = "

p05_msg10:
    .asciz "N*10 = "

.align 2

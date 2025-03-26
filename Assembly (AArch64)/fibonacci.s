// Constants
    .section    .rodata
.fmt:
    .asciz "%llu\n"
.overflow_str:
    .asciz "Overflowed!"

// Code
.text
.globl main
main:
    // Store old register values in the stack
    stp x29, x30, [sp, -0x30]!
    stp x20, x19, [sp, 0x10]
    str x21, [sp, 0x20]

    // Set the frame pointer (x29) to the current stack pointer
    mov x29, sp
    
    // Load the format string address into x19 using 64-bit bitmasking wizardry
    adrp x19, .fmt
    add x19, x19, :lo12:.fmt

    // Load the string address and initial `0` into the correct registers; print to STDOUT
    mov x0, x19
    mov x1, xzr
    bl printf

    // Reload the address and initial `1` into the correct registers; print to STDOUT
    mov x0, x19
    mov w1, 0x1
    bl printf

    // Start the computational registers with 1 and 1
    mov w20, 0x1
    mov w21, 0x1

.loop:
    // Print the value in x20 to STDOUT
    mov x0, x19
    mov x1, x20
    bl printf

    // Add x20 and x21 into x21, branching to .overflow upon overflow
    adds x21, x21, x20
    b.hi .overflow

    // Print the value in x21 to STDOUT
    mov x0, x19
    mov x1, x21
    bl printf

    // Add x20 and x21 into x20, branching back to .loop unless overflow occurs
    adds x20, x20, x21
    b.lo .loop

.overflow:
    // Load the overflow string address into a register; call puts to print to STDOUT
    adrp x0, .overflow_str
    add x0, x0, :lo12:.overflow_str
    bl puts

    // Zero out w0 and pop the old register values
    mov w0, wzr
    ldr x21, [sp, 0x20]
    ldp x20, x19, [sp, 0x10]
    ldp x29, x30, [sp], 0x30
    ret

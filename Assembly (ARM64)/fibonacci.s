// Constants
.section    .rodata
.fmt:
    .asciz "%llu\n"
.overflow:
    .asciz "Overflowed!"

// Code
.text
.globl main
main:
    // Push frame pointer and link register to stack; increment sp by 16
    // Frame pointer is now the stack pointer value
    stp x29, x30, [sp, -0x30]!  // Frame pointer and link register
    stp x10, x11, [sp, 0x10]    // Calculation registers
    stp x12, x13, [sp, 0x20]    // String address registers
    mov x29, sp
    
    // Load effective addresses of strings into x0 (via x64 bitmask trickery)
    adrp x12, .fmt
    add x12, x12, :lo12:.fmt
    adrp x13, .overflow
    add x13, x13, :lo12:.overflow


    // Print `0`
    mov x0, x12
    mov x1, xzr
    bl printf

    // Print `1`
    mov x0, x12
    mov x1, xzr
    bl printf

    // End of program; pop old register values
    ldp x10, x11, [sp, 0x10]
    ldp x12, x13, [sp, 0x20]
    ldp x29, x30, [sp], 0x30
    mov w0, wzr
    ret

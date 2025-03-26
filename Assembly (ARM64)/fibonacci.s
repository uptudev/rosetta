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
    str x12, [sp, 0x10]         // String address registers
    stp x10, x11, [sp, 0x20]    // Calculation registers
    mov x29, sp
    
    // Load effective addresses of strings into x0 (via x64 bitmask trickery)
    adrp x12, .fmt
    add x12, x12, :lo12:.fmt

    // Print `0`
    mov x0, x12
    mov x1, xzr
    bl printf

    // Print `1`
    mov x0, x12
    mov w1, #1
    bl printf
    mov w10. #1
    mov w11. #1

.loop:
    mov x0, x12
    mov x1, x10
    bl printf

    // End of program; pop old register values
    mov w0, wzr
    ldp x10, x11, [sp, 0x20]
    ldr x12, [sp, 0x10]
    ldp x29, x30, [sp], 0x30
    ret

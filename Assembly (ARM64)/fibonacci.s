# Constants
.section    .rodata
.fmt:
    .asciz "%llu\n"
.overflow:
    .asciz "Overflowed!"

# Code
.text
.globl main
main:
    # Push frame pointer and link register to stack; increment sp by 16
    stp x29, x30, [sp, -0x10]!

    # Load effective address of .fmt into x0 (via x64 bitmask trickery)
    adrp x12, .fmt
    add x12, x12, :lo12:.fmt

    # Print `0`
    mov x0, x12
    mov x1, xzr
    bl printf

    # Print `0`
    mov x0, x12
    mov x1, 0x1
    bl printf

    # Print `1`
    mov x0, x12
    mov x1, 0x1
    bl printf

    # End of program; pop frame pointer and link register; decrement sp by 16 and return 0
    ldp x29, x30, [sp], 0x10
    mov w0, wzr
    ret

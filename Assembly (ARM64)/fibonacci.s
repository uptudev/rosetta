.text
.globl main
main:
    stp x29, x30, [sp, -0x30]!
    stp x20, x19, [sp, 0x10]
    str x21, [sp, 0x20]
    mov x29, sp
    
    adrp x19, .fmt
    add x19, x19, :lo12:.fmt

    mov x1, xzr
    mov x0, x19
    bl printf

    mov x0, x19
    mov w1, #1
    mov w21, #1
    bl printf
    mov w20, #1

.loop:
    mov x0, x19
    mov x1, x20
    bl printf

    adds x21, x21, x20
    b.hi .overflow

    mov x0, x19
    mov x1, x21
    bl printf

    adds x20, x20, x21
    b.lo .loop

.overflow:
    adrp x0, .overflow_str
    add x0, x0, :lo12:.overflow_str
    bl puts

    mov w0, wzr
    ldr x12, [sp, 0x20]
    ldp x10, x11, [sp, 0x10]
    ldp x29, x30, [sp], 0x30
    ret

    .section    .rodata
.fmt:
    .asciz "%llu\n"
.overflow_str:
    .asciz "Overflowed!"

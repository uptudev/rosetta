.text
.globl main
main:
    stp x29, x30, [sp, #-48]!
    str x21, [sp, #16]
    stp x20, x19, [sp, #32]
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
    mov x1, x10
    bl printf

    mov w0, wzr
    ldp x10, x11, [sp, #32]
    ldr x12, [sp, #16]
    ldp x29, x30, [sp], #48
    ret

    .section    .rodata
.fmt:
    .asciz "%llu\n"
.overflow:
    .asciz "Overflowed!"

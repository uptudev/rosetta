.global main
.intel_syntax noprefix

# Entry point
.p2align	4, 0x90
.type	main,@function
main:
    # Save registers and zero out rax
    push    r14
    push    rbx
    xor     rax, rax

    # print `0`
    mov     edi, offset .format_str
    xor     esi, esi
    xor     eax, eax
    call    printf

    # print `1`
    mov     r14d, 1
    mov     edi, offset .format_str
    mov     esi, 1
    xor     eax, eax
    call    printf

    # initialize loop variable
    mov     ebx, 1

# loop procedure
.p2align    4, 0x90
.loop:
    # print current value
    mov     edi, offset .format_str
    mov     rsi, rbx
    xor     eax, eax
    call    printf

    # add values, jumping up the loop unless the carry flag is set (indicating overflow)
    mov     rax, r14
    mov     r14, rbx
    add     rax, rbx
    mov     rbx, rax
    jae     .loop

    # print overflow message
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, offset .overflow_str
    mov     rdx, 13
    syscall

    # clear registers, pop old registers, and exit
    xor     rax, rax
    xor     rdi, rdi
    xor     rsi, rsi
    xor     rdx, rdx
    pop     rbx
    pop     r14
    ret

.end:
    .size main, .end-main

# Format string for u64 -> String conversion
	.type	.format_str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.format_str:
	.asciz	"%llu\n"
	.size	.format_str, 6

# String to print when integer overflows
	.type	.overflow_str,@object
.overflow_str:
	.asciz	"Overflowed!\n"
	.size	.overflow_str, 13

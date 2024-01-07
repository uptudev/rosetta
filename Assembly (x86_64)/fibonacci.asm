.text
	.globl	main                            

    # Entry point
	.p2align	4, 0x90
	.type	main,@function
main:                                   
    # push register values to the stack
	pushq	%r14
	pushq	%rbx
	pushq	%rax

    # print `0`
	movl	$.format_str, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	printf

    # print `1`
	movl	$1, %r14d
	movl	$.format_str, %edi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	printf

    # initialize loop variable
	movl	$1, %ebx

    # addition + printing loop 
	.p2align	4, 0x90
.loop:
    # print current value
	movl	$.format_str, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	printf

    # add values, jumping back up the loop unless the Carry Flag is true (indicates overflow)
	movq	%r14, %rax
	movq	%rbx, %r14
	addq	%rbx, %rax
	movq	%rax, %rbx
	jae	.loop

    # print overflow string
	movl	$.overflow_str, %edi
	callq	puts@PLT

    # clear `%eax` and increment stack pointer
	xorl	%eax, %eax
	addq	$8, %rsp

    # pop old values back into the registers and return out
	popq	%rbx
	popq	%r14
	retq

    # Calculates main function size for the linker
.end:
	.size	main, .end-main

    # Format string for u64 -> String conversion
	.type	.format_str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.format_str:
	.asciz	"%llu\n"
	.size	.format_str, 6

    # String to print when integer overflows
	.type	.overflow_str,@object
.overflow_str:
	.asciz	"Overflowed!"
	.size	.overflow_str, 12

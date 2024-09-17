# Constants
.section    .rodata
.fmt_str:
	.string	"%llu\n"

.overflow_str:
	.string	"Overflowed!"

# Code
.text
.globl	main

# Entry point
main:
    # Push old values onto the stack and zero out syscall registers
	pushq 	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	xorq	%rsi, %rsi
	xorq	%rax, %rax

    # Format string address into r13 for later use
    leaq    .fmt_str(%rip), %r13

    # Print `0`
	movq	%r13, %rdi  # load format string address into rdi
	movq	$1, %r12    # load 1 into r12
	movq	$1, %rbx    # load 1 into rbx
	subq	$8, %rsp    # subtract 8 from rsp to align stack
	call	printf      # call printf

    # Print `1`
	movq	$1, %rsi    # load 1 into rsi (was 0 before)
	movq	%r13, %rdi    # reload format string address into rdi
	call	printf      # call printf

    # Loop goto
.loop:
    # Print rbx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	printf  

    # Add rbx and r12 into rbp; check for overflow
    movq    %r12, %rbp
    addq    %rbx, %rbp
	jc	    .overflow

    # Print rbp
	movq	%rbp, %rsi
	movq	%r13, %rdi
	call	printf  

    # Add rbp and rbx into r12; check for overflow
    movq    %rbx, %r12
    addq    %rbp, %r12
	jc	    .overflow

    # Print r12
    movq	%r12, %rsi
	movq	%r13, %rdi
	call	printf

    # Add r12 and rbp into rbx; check for overflow
    movq    %rbp, %rbx
    addq    %r12, %rbx
	jnc	    .loop

.overflow:
    # Print overflow string
    leaq    .overflow_str(%rip), %rdi
	call	puts

    # Align stack
    addq    $8, %rsp

    # Reset registers and return
	xorq	%rax, %rax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret

# Calculate main function size for the linker
.end:
	.size	main, .-main

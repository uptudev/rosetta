# Constants
.section    .rodata
.fmt_str:
	.string	"%llu\n"

.overflow_str:
	.string	"Overflowed!"

# Code
.text
.globl	main
.intel_syntax noprefix

# Entry point
main:
# Push old values onto the stack and zero out syscall registers
	push 	r13
	push 	r12
	push 	rbp
	push 	rbx
	xor 	rsi,    rsi
	xor 	rax,    rax

# Format string address into r13 for later use
	lea     r13,    [rip + .fmt_str]

# Align stack pointer before syscalls (2 4-byte args for `printf`)
	sub 	rsp,    8

# Print `0`
	mov 	rdi,    r13
	call	printf

# Print `1`
	mov 	rsi,    1
	mov 	rdi,    r13
	call	printf

# load initial values into first 2 computational registers
	mov 	r12,    1
	mov 	rbx,    1

# Loop goto
.loop:
# Print rbx
	mov 	rsi,    rbx
	mov 	rdi,    r13
	call	printf  

# Add rbx and r12 into rbp; check for overflow
	mov 	rbp,    r12
	add 	rbp,    rbx
	jc	.overflow

# Print rbp
	mov 	rsi,    rbp
	mov 	rdi,    r13
	call	printf  

# Add rbp and rbx into r12; check for overflow
	mov 	r12,    rbx
	add 	r12,    rbp
	jc	.overflow

# Print r12
    mov 	rsi,    r12
	mov 	rdi,    r13
	call	printf

# Add r12 and rbp into rbx; check for overflow
    mov     rbx,    rbp
   	add     rbx,    r12
	jnc	.loop

.overflow:
# Print overflow string
    lea     rdi,    [rip + .overflow_str]
	call	puts

# Align stack after last syscall
    add     rsp,    8

# Reset registers and return
	xor 	rax,    rax
	pop 	rbx
	pop 	rbp
	pop 	r12
	pop 	r13
	ret

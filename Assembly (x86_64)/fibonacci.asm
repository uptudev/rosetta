.data
    format_string:
        .string "%llu\n"
    overflow_alert_string:
        .string "Overflowed!"

.text
    .global main

fibonacci:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $32, %rsp

        # a = 0
        movq    $0, -8(%rbp)

        # printf(a)
        movq    -8(%rbp), %rax
        movq    %rax, %rsi
        movl    $format_string, %edi
        movl    $0, %eax
        call    printf

        # b = 1
        movq    $1, -16(%rbp)

        # printf(b)
        movq    -16(%rbp), %rax
        movq    %rax, %rsi
        movl    $format_string, %edi
        movl    $0, %eax
        call    printf

    # The big loop of the program
    checked_add_u64:
        # Move `a` and `b` into %rdx and %rax
        movq    -8(%rbp), %rdx
        movq    -16(%rbp), %rax

        # Add the two, possibly overflowing
        addq    %rdx, %rax

        # Then moving the result into %rbp for storage
        movq    %rax, -24(%rbp)

        # Then comparing the value of `b` with `c` to detect overflow
        cmpq    -16(%rbp), %rax

        # Print the resultant value if the addition hasn't overflowed
        jnb     increment

        # Else print the overflow alert and clean up the application
        movl    $overflow_alert_string, %edi
        call    puts
        jmp     clean_up

    
    increment:
        # Print `c`
        movq    -24(%rbp), %rax
        movq    %rax, %rsi
        movl    $format_string, %edi
        movl    $0, %eax
        call    printf

        # Copy the values from `(c, b)` to `(b, a)`
        movq    -16(%rbp), %rax
        movq    %rax, -8(%rbp)
        movq    -24(%rbp), %rax
        movq    %rax, -16(%rbp)

        # Restart the loop
        jmp     checked_add_u64

    clean_up:
        nop
        leave
        ret

main:
        pushq   %rbp
        movq    %rsp, %rbp
        movl    $0, %eax
        call    fibonacci
        movl    $0, %eax
        popq    %rbp
        ret

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

        movq    $0, -8(%rbp)

        movq    -8(%rbp), %rax
        movq    %rax, %rsi
        movl    $format_string, %edi
        movl    $0, %eax
        call    printf

        movq    $1, -16(%rbp)
        
        movq    -16(%rbp), %rax
        movq    %rax, %rsi
        movl    $format_string, %edi
        movl    $0, %eax
        call    printf

    checked_add_u64:
        movq    -8(%rbp), %rdx
        movq    -16(%rbp), %rax

        addq    %rdx, %rax

        movq    %rax, -24(%rbp)

        cmpq    -16(%rbp), %rax

        jnb     increment

        movl    $overflow_alert_string, %edi
        call    puts
        jmp     clean_up

    
    increment:
        movq    -24(%rbp), %rax
        movq    %rax, %rsi
        movl    $format_string, %edi
        movl    $0, %eax
        call    printf

        movq    -16(%rbp), %rax
        movq    %rax, -8(%rbp)
        movq    -24(%rbp), %rax
        movq    %rax, -16(%rbp)

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

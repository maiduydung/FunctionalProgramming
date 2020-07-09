Register Allocation 
  Based on greedy algorithm
  Reuse register whose life span is over

  When not enough register:
    ->register spilling
        save variable value to stack frame (backup)
        when needed, pop stack, restore variable to that register

Constraints Related to Register Allocation
  x64 only has 2 operand instruction
  
  K-normalized instruction

        #mov src des
  x = a - b;
      3 registers
        mov %r1, %r0    #x  = a;
        add %r2, %r0    #x -= b;

      2 registers
        add %r2, %r0    #x  = a - b;

  Calling Convention
    Rules on how the arguments and return values are passed

    n = 123;
    r = fib(n);
      mov $123, %rdx
      mov %rdx, %rdi   #setting 1st argument n
      call fib
      mov %rax, %rcx   #copy return value to r

      or
      mov $123, %rdi
      call fib
          -> can allocate registers for variable used as arguments/return values
                to reduce register copying

    register value cant be modified if it's used be the caller


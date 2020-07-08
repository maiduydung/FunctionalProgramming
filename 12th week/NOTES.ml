Register Allocation
    Say we have an infinite amount of register, then ignoring the performance, put every variable to a register
    
    Obiviously, registers are finite.
        Reusing registers: assigning new value replacing no longer needed value
        Coalescing variable: allocate same register for multiple variable with the same value
        
        K-normal form not optimal for register allocation
          variable values may change
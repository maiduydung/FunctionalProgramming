Register Allocation
    Say we have an infinite amount of register, then ignoring the performance, put every variable to a register
    
    Obiviously, registers are finite.
        Reusing registers: assigning new value replacing no longer needed value
        Coalescing variable: allocate same register for multiple variable with the same value
        
        K-normal form not optimal for register allocation
          variable values may change
          -> need to assume the variable is going to be changed later
          ->convert to functional programming style, where variables cant be changed
        
        Register allocation corresponds to coloring problem
          ->check included graph  
          Find out how long each variable live, so that there's no other same color variable exist at the same time 
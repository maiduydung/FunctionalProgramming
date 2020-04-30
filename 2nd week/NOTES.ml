
(* Tail recursion *)


(* Pattern matching *)
    (*similar to a switch statement*)
let rec fib n = 
  match n with (* -> match expression with *)
    0 | 1 -> 1 (* if n == 0 or n == 1 then return 1 *)
    | x -> fib(x-1) + fib(x-2);; (*else x = n, call fib(x-1) + fib(x-2)*)

(*Constant and variable pattern*)
let rec pow x n = 
  match n with
    0  -> 1
    | m -> x * pow x (n-1);;
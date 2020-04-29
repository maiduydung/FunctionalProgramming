(* Global variables: let*)
(* Local variables: let ... in expression *)
let x = 2;;
let y = 10 in y *2;;
let pi = 3.14 and r = 3.0 in 
    pi *.r **2.0;;

(* Defining and calling function  *)
let add x y z = x + y + z;;
add 10 9 1;;
        (* or *)
let double x = x *. 2.0 in double 3.2;;
        (* even better *)
let func x = x *. 2.0;;

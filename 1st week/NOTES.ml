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
let peri_square a = a *4 in peri_square 10;;
let peri_rec a b = (a +. b) *. 2.0 in peri_rec 4.0 2.0;;
        (* even better *)
let func x = x *. 2.0;;


(* Nested let expression *)
let result = 
        let pi = 3.14 in
        let area r = pi *. r **2.0 in 
        area 5.0;;


(* Currying and partial application *)
let add x y = x + y;;
let add1 = add 1;;
add1 2;;  (* 3 *)


(* Conditional statement *)
let func x = 
        if x < 10
                then "less than 10"
        else
                "greater or equal to 10";;

let minus x = 
        if x > 0
                then "positive"
        else 
                if x = 0
                        then "0"
                else
                        "negative";;
minus(-9);;


(* Recursive function *)
let rec factorial x = 
        if x <= 0
                then 1
        else
                x * factorial (x - 1);;

let rec fib x = 
        if x <= 1
                then x
        else
                fib(x - 2) + fib(x - 1);;

(* Mutual recursion *)
        (* this could be obviously solved with return x mod 2
        just for the sake of demonstration only *)
let rec even x = 
        if x = 0 then true
        else odd(x - 1)

        and odd x = 
        if x = 0 then false
        else even(x - 1)
        
(* Divide and conquer with recursion *)
(* sum from 1 to 100 *)
let rec sum_to_n n = 
        if n <= 0 then 0
        else (sum_to_n (n -1)) + n;;
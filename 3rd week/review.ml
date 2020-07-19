type figure = 
  Circle of float 
| Rectangle of float * float;;

let area (fig) = 
  match fig with
  Circle (n) -> 3.14159 *. n *.n
  | Rectangle(n, m) -> n*. m;; 


let c = Circle(2.0);;
let r = Rectangle(3.0, 4.0);;

area(c);;
area(r);;


(* ----------------------------------- *)
(* type hand =
  Rock       (* グー *)
| Scissors   (* チョキ *)
| Paper      (* パー *)

let janken a b = 
  match a with
    Rock -> 1
  | Paper -> 2
  | Scissors -> 3

  match b with
  Rock -> 1
| Paper -> 2
| Scissors -> 3 *)


let histogram lst = 
  let rec print s n =
    if n <= 0 then ""
    else s ^ print s (n-1)
  in List.iter( fun x -> print_endline( print "*" x )) lst;;
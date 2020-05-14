type 'a stack = {mutable s: 'a list};;

exception EmptyStack;;

let new_stack () =
  {
    s = []
  };;

let push stack v = 
  stack.s <- v @ stack.s
;;


(* Since list in ocaml is immutable, we have to re-assign the list, minus the hd elemt  *)

let rec pop stack = 
  match stack.s with
    hd::tl -> stack.s <- tl ; hd
  | [] -> raise EmptyStack
;;


let s = new_stack();;
push s [1];;
push s [2];;
push s [3];;
push s [4];;
push s [5];;
push s [6];;
pop s;;
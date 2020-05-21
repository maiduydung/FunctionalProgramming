
type 'a t = {mutable s: 'a list};;
exception EmptyStack;;


let create () =
  {
    s = []
  };;

let push stk v = 
  stk.s <- v :: stk.s
;;



let rec pop stk = 
  match stk.s with
    hd::tl -> stk.s <- tl ; hd
  | [] -> raise EmptyStack
;;



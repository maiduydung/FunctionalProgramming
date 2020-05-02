
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
    | m -> x * pow x (n-1);; (* same as above, referenced variable m *)

(*Tuple pattern*)
let scarlar n tuple = 
  match tuple with
    (x, y) -> (n *. x, n *. y);;

scarlar 2.0 (2.0,55.1);;

(*Wild card pattern: Underscore (_) match with any values*)
let is_vowel character = 
  match character with
  'a' | 'o' | 'i' | 'e' | 'u' -> true
  | _ ->false;;

(* 
  # is_vowel 'm';; 
  - : bool = false 
*)

let get_first_char tuple = 
  match tuple with
    (f, _) -> f;; (*First character and the rest, return first char*)

    (* 
      # get_first_char ('M','a');;
      - : char = 'M' 
    *)

(* Alias pattern *)
let get_last_two tuple = 
  match tuple with
    (x, (y, z as last)) -> last;;

    (*
      # get_last_two (1,(2,3));;
      - : int * int = (2, 3)
    *) 

(* Guard clause *)
let is_equal tuple = 
  match tuple with
    (a, b) when a = b -> true
    | _ -> false;;

(* Pattern matching at function/variable definitions *)
let scarlar = 
  fun n (x, y) -> (x *. n, y *. n);;
let (x, y) = scarlar 3.0 (1.0, 2.1);;

let get_second(_, s) = s in 
  get_second ("Duy", "Dung");;

(* Patterns need to stay exhaustive *)
let flip = function
  0 -> 1 | 1 -> 0;;
    (* 
    Warning 8: this pattern-matching is not exhaustive.
    Here is an example of a case that is not matched: 2 
    *)
    (* # flip 2;;
    Exception: Match_failure ("//toplevel//", 1, 11). *)
    

(* List *)
  
  (* Empty list *)
  [];;

  (* :: operator *)
    (* Create a new list on top of list tail *)
    (* head :: tail *)

  (* Alternatives *)
  1::(2::(3::[]));;
    (* - : int list = [1; 2; 3] *)

  0::[1;2;3];;
    (* - : int list = [0; 1; 2; 3] *)
  
  (* Use operator :: to split list into the first element and the rest *)
  let rec list_sum lst =
    match lst with
      head::tail -> head + (list_sum tail)
      | [] -> 0;;
  
  list_sum [1;2;3;4;5];;
    (* 
    # list_sum [1;2;3;4;5];;
    - : int = 15 
    *)

  (* @ operator to concatenate 2 list *)
  [1;2] @ [3;4;5;6];;
    (* - : int list = [1; 2; 3; 4; 5; 6] *)
    (* list_1 @ list_2 = Big O of (list_1.size) *)
    (* for example *)
    let rec list_con l1 l2 =
      match l1 with
      [] ->l2
      | hd::tl -> hd::(tl @ l2);;

    list_con [1;2;3] [4;5;6];;
      (* - : int list = [1; 2; 3; 4; 5; 6] *)

  (* Pattern matching with list *)
  let sum_3 lst = 
    match lst with
    [a;b;c] -> a + b + c
    | _ -> failwith "error";;
    
  sum_3 [7;3;2];;
    (* - : int = 12 *)

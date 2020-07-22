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
type hand =
  Rock       (* グー *)
| Scissors   (* チョキ *)
| Paper      (* パー *)

let janken a b = 
  match a with
  Paper -> 
    (match b with 
      Paper -> false
      | Rock -> true
      | Scissors -> false)
  | Scissors ->
      (match b with
      Paper -> true
      | Rock -> false
      | Scissors -> false)
  | Rock ->
    (match b with 
    Paper -> false
    | Rock -> false
    | Scissors -> true);;




let histogram lst = 
  let rec repeat str n = 
    if n <= 0 then ""
    else str ^ (repeat str (n-1))
  in List.iter(fun x -> print_endline( repeat "*" x)) lst;;





type complex_num = {re: float; im: float};;

let c = {re = 10.2; im = 2.0};;
let d = {re = 5.0; im = 2.3};;
(* c.re +. d.re;; *)

let add {re = r1; im = i1} {re = r2; im = i2} = 
  {re = r1 +. r2; im = i1 +. i2};;

add c d;;



type person = 
  Student of {id : int; name : string}
| Teacher of {title: string ;name: string};;

let mai = Student{id = 069; name = "Mai Duy Dung"};;

let me = Teacher{title = "Teacher"; name = "Vu Thi Le Hang"};;

let string_of_person p = 
  match p with 
    Student {id = m; name = n} -> n ^ (if m > 5 then " senpai" else " san")
  | Teacher {title = _; name = n} -> n ^ " sensei";;


string_of_person mai;;


(* ----------------------------------------------------- *)
(*   *            
    ***
   *****
  * ******       

let pyramid h = 
  let rec iter str n = 
    if n < 0 then ""
    else str ^ (iter str (n-1))
  in print_endline( iter "*" h)
  print_endline( iter "*" h);; *)



let rec range a b = 
  if a < (b-1) then [a] @ (range (a+1) b)
  else [a];;



(* Linked list *)
type int_list = Node of int * int_list | Null;;

let rec length ll = 
  match ll with 
  Node(_,tl) -> 1 + length(tl)
  | Null -> 0 ;;

let ll = Node(1 , Node(2, Node(3, Null)));;
length ll;;


  (* polymorphic, a bit more concise *)
  type 'a llist = Node of 'a * 'a llist | Null;;
  let numbers = Node(1 , Node(2, Node(3, Null)));;
  let strings = Node("Mai" , Node("Duy", Node("Dung", Null)));;

  type ('a, 'b, 'c) trio = 'a * 'b * 'c;;
  type ('a, 'b) duo = 'a * 'b;;
  type 'a solo = 'a;;

  type foo = int * int;;
  let t = "Rei", "Ayanami";;



(* Returning first element in list *)
let hd_opt lst = 
  match lst with 
  x::_ -> Some(x)
  | [] -> None;;

(* Removing 1st element in list *)
let end_opt lst = 
  match lst with 
  _::x -> Some(x)
  | [] -> None;;


let rec last_ele lst = 
  match lst with 
   tl::[] -> Some(tl)
  |x::tl->  last_ele tl
  | [] -> None;;


let div x y = 
  if y <> 0 then Some(x/y) else None;

  

(* ---------------------------- *)
(* Binary tree *)
type 'a btree = 
  Node of 'a * 'a btree * 'a btree
| Leaf;;

let t2 = Node(1, Node(2,Node(4, Leaf, Node(5, Leaf, Leaf)) ,Leaf), Node(7,(Node(6, Leaf, Leaf)),(Node(8, Leaf, Node(9, Leaf, Leaf)))));;

Node (123, Leaf, t2);;

let t1 = Node(1, (Node(2,Leaf, (Node(3,Leaf,Leaf)))),(Node(4,Leaf,Leaf)));;

let rec depth tree = 
  match tree with 
  Node(_, t1, t2) -> 1 + max (depth t1) (depth t2) 
  | Leaf -> 0;;

depth t2;;

let btree = Node(1, Node(2, Leaf, Node(3, Leaf, Leaf)), Node(4, Leaf, Leaf))


let rec in_order = function
  | Leaf -> []
  | Node(i,l,r) -> in_order l @ (i :: in_order r);;
  (* Appending value from left traversal to the list of i and right trversal with :: operator *)







(* Syntax tree for mathematical expression *)
type expression = 
  Binop of char * expression * expression
  | Number of int;;


let math_tree = Binop('+', Number(2), Binop('*', Binop('-',Number(5), Number(3)),Number(4)));;



(* Evaluate expression *)
let rec eval expr = 
  match expr with 
    Binop('+', l, r) -> eval l + eval r
  | Binop('-', l, r) -> eval l - eval r
  | Binop('*', l, r) -> eval l * eval r
  | Binop('/', l, r) -> eval l / eval r
  | Binop(a, _, _) -> 0
  | Number(x) -> x;;


(* ============================================ *)
type expr = 
  Add of expr * expr
| Mul of expr * expr
| Val of int
| X ;;(* Variable x  *)


let rec eval expr x = 
  match expr with
    Add(l, r) -> eval l x + eval r x
  | Mul(l, r) -> eval l x * eval r x
  | Val (v) -> v
  | X -> x;;


(* ======================================= *)

type 'a b_tree = 
  Node of 'a * 'a b_tree * 'a b_tree
| Leaf;;

(* Find a value in binary tree, return true if found *)

let rec find a b_tree = 
  match b_tree with 
  Node(a', l, r) -> 
    if a = a' then true 
    else  find a l || find a r

  | Leaf -> false;;




  (* Counting the number of elements in binary trees *)

  let rec count_bst tr = 
    match tr with 
      Node(_, tr1, tr2) -> 1 + (count_bst tr1) + (count_bst tr2)
      | Leaf -> 0
  ;;


  

  let rec get_min tr = 
    match tr with 
      Node(v, Leaf, _) -> v
    | Node(_, tr1, _) -> get_min tr1
    |Leaf -> None;;
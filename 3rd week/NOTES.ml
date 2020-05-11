(* Custom type *)
  type trio = int * string * bool;;
  let id x : trio = x;;

  (* Record type *)
    (* Same as struct in C *)
    (* Can store multiple values *)

    (* Representing complex numbers *)
    type complex = {re: float; im: float};;
    let c = {re = 5.0; im = 3.0 };;
    c.re +. c.im;;

    (* Pattern matching *)
    let add {re = r1; im = i1} {re = r2; im = i2} = 
      {re = r1 +. r2; im = i1 +. i2};;
    let c1 = {re = 1.0; im = 3.0} and c2 = {re = 2.0; im = 6.0} in
      add c1 c2;;
    
      (* Can also be written as *)
      let add a b = 
        { re = a.re +. b.re; im = a.im +. b.im };;


    (* Variant type *)
    (* Label name has to start with a capital letter *)
    type person = 
      Student of   {id: string; name: string; grade:int}
      | Teacher of {title: string; name:string};;

    Student {id = "s1f10180069"; name = "Mai Duy Dung"; grade = 10};;
    Teacher {title = "Professor"; name = "Vu Thi Le Hang"};;

    (* Pattern matching *)
    let get_name p = 
      match p with 
        Student {id = _; name = n; grade = g} ->
          n ^ (if g > 3 then " senpai" else " san")
        | Teacher {title = t; name = n} -> t ^ " " ^ n;; 
    
    let mdd = Student{id = "007"; name ="Mai Duy Dung"; grade = 3} 
      in get_name mdd;;
    let mom = Teacher{title ="Prof."; name ="Vu Thi Le Hang";} 
      in get_name mom;;
    
    
    (* Singly linked list *)
    type int_list = Node of int * int_list | NULL;;

    let rec length xs =
      match xs with 
        Node (_,tl) -> 1 + length tl
        | NULL -> 0;;
    
    let lst = Node(1, Node(2, Node(3, NULL))) in length lst;;

    
    (* Polymorphic types with multiple type variables *)
    type ('a, 'b, 'c) trio = 'a * 'b * 'c;;

    (* Type "option" *)
    (* Saving time when valid values are not achievable *)
    
    let get_head xs = match xs with
      x::_ -> Some(x)
      | [] -> None;;
    get_head[1;2;3];;

    let div x y = 
      if y <> 0 then Some(x / y) else None;;








(* ----------------------------------------------------------- *)
(* Binary Tree *)

type 'a btree = 
  Node of 'a * 'a btree * 'a btree
  | Leaf;;

Node(10, Leaf, Leaf);;

let t = Node(1,
          Node(2,
            Node(4,Leaf,
              Node(5,Leaf,Leaf)),
            Leaf),
          Node(7,
            Node(6,Leaf,Leaf),
            Node(8,Leaf,Node(9,Leaf,Leaf))));;
  

(* Creating a new btree with left and right nodes swapped *)
let Node(v, t1, t2) = t
  in Node(v, t2, t1);; 

(* Depth of binary tree *)
let rec depth tree = 
  match tree with
    Node(_, t1, t2) -> 1 + max (depth t1) (depth t2)
  | Leaf -> 0;;

let btree = Node(1, Node(2, Leaf, Node(3, Leaf, Leaf)), Node(4, Leaf, Leaf));;

depth (Node(1, Node(2, Leaf, Node(3, Leaf, Leaf)), Node(4, Leaf, Leaf)));;



(* BFS Traversal *)
let bfs tree = 
  let rec bfs_iter result nodes = 
    if nodes = [] then result else
    let (new_result, nodes') = 
      List.fold_left (fun (rs, ns) n -> 
        match n with 
          Node(v, t1, t2) -> (rs @ [v], t1::t2::ns)
          | Leaf -> (rs, ns)) ([], []) nodes
    in bfs_iter (result @ new_result) nodes'
  in bfs_iter [] [tree];;




  (* Representation of Sets using Binary Search Trees *)
type 'a set = 'a list;;

let rec find v xs = 
  match xs with
    hd::tl -> if hd = v then true else find v tl
  | [] -> false
;;

find 2 [1;2;3;4;5;6];;


let append v xs = v::xs;;

let rec delete v xs = 
  match xs with 
    hd::tl -> if hd = v then tl else hd::delete v tl
  | [] -> [];;

delete 2 [1;2;3;4;5;6];;

    (* Finding element in BST   *)
    type 'a btree = 
      Node of 'a * 'a btree * 'a btree
      | Leaf;;

    let rec find_BST v t = 
      match t with 
        Node(v_node, t1, t2) ->
          if v_node = v then true
          else if v > v_node then find_BST v t2
          else find_BST v t1
        | Leaf -> false;;

    let btree = Node(4, Node(2, Leaf, Node(10, Leaf, Leaf)), Node(3, Leaf, Leaf));;

    find_BST 2 btree;;
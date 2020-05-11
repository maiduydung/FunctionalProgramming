type 'a btree = 
  Node of 'a * 'a btree * 'a btree
  | Leaf;;


let btree = (Node(8, Node(3, Node(1, Leaf, Leaf), Leaf), Node(10, Leaf, Leaf)));;


let rec min_bst tr = 
  match tr with
    Node(v, Leaf, Leaf) -> Some(v)
  | Node(v, tr1, tr2) -> min_bst tr1
  | Leaf -> None
;;

min_bst btree;;
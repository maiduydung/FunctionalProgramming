
type 'a btree = 
  Node of 'a * 'a btree * 'a btree
  | Leaf;;


let btree = Node(4, Node(2, Leaf, Node(10, Leaf, Leaf)), Node(3, Leaf, Leaf));;



let rec count_bst tr = 
  match tr with 
    Node(_, tr1, tr2) -> 1 + (count_bst tr1) + (count_bst tr2)
    | Leaf -> 0
;;

count_bst btree;;
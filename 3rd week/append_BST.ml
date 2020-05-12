

type 'a btree = 
  Node of 'a * 'a btree * 'a btree
  | Leaf;;

let btree = (Node(8, Node(3, Node(1, Leaf, Leaf), Leaf), Node(10, Leaf, Leaf)));;


let rec append_bst v tr =
  match tr with
    Node(tmp, tr1, tr2) when v < tmp -> Node(tmp,(append_bst v tr1), tr2 )
  | Node(tmp, tr1, tr2) when v > tmp -> Node(tmp, tr1,(append_bst v tr2))
  | Node(_,_,_)                      
  | Leaf -> Node(v, Leaf, Leaf);;

  append_bst 0 btree;;
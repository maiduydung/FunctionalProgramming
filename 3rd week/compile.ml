type instruction = 
    Add
  | Sub
  | Mul
  | Div
  | Push of int
;;

type expression =
  Binop of char * expression * expression
| Number of int;;

let bi_tree = Binop('+', Number(1), Binop('*', Number(2), Number(3)));;


let rec compile exp = 
  match exp with
  | Binop('+',tr1,tr2) -> (compile tr1) @ (compile tr2) @ [Add]
  | Binop('-',tr1,tr2) -> (compile tr1) @ (compile tr2) @ [Sub]
  | Binop('*',tr1,tr2) -> (compile tr1) @ (compile tr2) @ [Mul]
  | Binop('/',tr1,tr2) -> (compile tr1) @ (compile tr2) @ [Div]
  | Number(num) -> [Push num]
  | Binop(_,_,_) -> [];;

compile bi_tree;;
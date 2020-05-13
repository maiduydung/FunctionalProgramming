type expression =
  Binop of char * expression * expression
| Number of int;;

let bi_tree = Binop('+', Number(1), Binop('*', Number(2), Number(3)));;


let rec eval exp = 
  match exp with
  | Binop('+',tr1,tr2) -> (eval tr1) + (eval tr2)
  | Binop('-',tr1,tr2) -> (eval tr1) - (eval tr2)
  | Binop('*',tr1,tr2) -> (eval tr1) * (eval tr2)
  | Binop('/',tr1,tr2) -> (eval tr1) / (eval tr2)
  | Number(num) -> num
  | Binop(_,_,_) -> 0;;

  
eval bi_tree;;

(* Tail recursive power function  *)
let pow n m = 
  let rec iter i res =
    if i > m then res
    else iter (i+1) res*n
  in iter 1 1;;
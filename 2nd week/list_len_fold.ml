List.fold_left (+) 0 [1;2;3];;

let length lst = 
  List.fold_left (fun x _ -> x + 1) 0 lst;;

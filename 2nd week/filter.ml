List.fold_left (+) 0 [1;2;3];;

let length lst = 
  List.fold_left (fun x _ -> x + 1) 0 lst;;


let rec filter_lst lst exp =
  List.fold_left exp 0 lst;;

filter_lst [1;2;3;4;5;6] (fun x _ -> x mod 2 = 0)


(* --------------- *)
let rec fold f x xs = 
  match xs with 
    hd::tl -> fold f (f x hd) tl
    | [] -> x;;

let sum = fold (+) 0;;
sum [1;2;3];;
(* ---------------------- *)

let filter_lst expression lst =
  let rec fold f x xs = 
    match xs with 
      hd::tl -> fold f (f x hd) tl
      | [] -> x
    in fold expression lst;;

filter_lst (fun x _ -> x mod 2 = 0) [1;2;3;4;5;6] ;;

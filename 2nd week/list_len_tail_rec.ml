
(* Non tail-recursive *)
let rec length lst =
  match lst with 
    hd::tl -> 1 + length tl
    | [] -> 0
;;


(* Tail-recursive *)
let length2 lst =
  let rec iter sub count =
    match sub with
      hd::tl -> iter tl (count + 1)
      | [] -> 0
  in iter lst 0
;;

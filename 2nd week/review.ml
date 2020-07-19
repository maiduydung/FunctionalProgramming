(* how many digits in a num *)
let digit n = 
  let rec iter i count =
    if i <> 0 then  iter (i/10) (count+1) 
    else count 
  in iter n 0;;


let rec digit2 n = 
  if n <> 0 then 1 + digit2(n/10) else 0;;


(* running sum on a list *)
let rec running_sum xs =
  match xs with 
    (* seperating list into 2, hd and tl, then sum the head with the returning value of the rest *)
    hd::tl -> hd + running_sum tl
  | [] -> 0;;

running_sum [1;2;3;4;5];;

(* concatinating list  with operator @*)
let concat_list xs1 xs2 = 
  xs1 @ xs2;;

concat_list [1;2;3] [4;5;6];;  

(* the fancier way *)
let rec (@) xs1 xs2 = 
  match xs1 with 
    [] -> xs2
  | hd::tl -> hd::(tl @ xs2);;


(* concatinating first initails of a word *)
let rec concat_initial xs =
  match xs with 
    (* returning the (start, len) sub string then concat that with operator ^ *)
    hd::tl -> (String.sub hd 0 1) ^ (concat_initial tl)
  | [] -> "";;

concat_initial ["Mai"; "Duy"; "Dung"];;


(* running sum again *)
List.fold_left (+) 0 [1;2;3];;
(*  ===>  List.fold_left f a [b1; b2; b3] = f (f ( f a b1 ) b2) b3 *)

(* List.map f xs  *)
    (* Applying the f condition to all element in xs *)
    List.map (fun x -> x + 1) [1; 2; 3; 4];;

(* List.filter f xs *)
  (* Extract element in xs which satisfies f condition  *)
  List.filter (fun x -> x mod 2 = 1) [1; 2; 3; 4];;


  let lengh lst = 
    List.fold_left (fun x _ -> x + 1)  0 lst;;



let square_list lst = 
  List.map (fun x -> x ** 2.0) lst;;

let range a b = 
  []@[]
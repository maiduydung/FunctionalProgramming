(* Interate through the list, 
if an element statisfies the condition, then append to the result
else continue at the next index

when reach the end of list, return result *)


List.filter (fun x -> x mod 2 = 0) [1;2;3;4;5;6];;


let filter exp xs = 
  let rec filter_iter res xs =
    match xs with
      hd::tl -> if exp hd then hd::(filter_iter res tl) else filter_iter res tl
    | [] -> res
  in filter_iter [] xs;;

filter (fun x -> x mod 2 = 0) [1;2;3;4;5;6];;
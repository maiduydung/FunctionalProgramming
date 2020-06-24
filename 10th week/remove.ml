let rec remove xs n = 
  match xs with 
    hd::tl -> 
      if n > 0 then hd :: remove tl (n-1)

      else if n = 0 then tl


      else failwith "error"

  | [] -> []

;;


let apply f n = 
  let rec iter ff i = 
    if n = 0 then 
      ff
    else
      iter ??? ???
  in iter f n 
;;

let mysqrt v = 
  let f x =
  in
  
  let df x = 
  in

  let newton_map x = 
    x -. f(x) ./df(x)
  in

  let  iter_newton = 
    apply ???
  in
  iter_newton v
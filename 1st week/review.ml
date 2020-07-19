let is_10 x =
  if x < 10
  then "smaller than 10"
  else if x = 10
      then "is 10"
      else "larger than 10";;

let even x = 
  if x mod 2 = 0 then true else false;;

let rec fac n = 
  if n <= 1 then 1 else n * fac (n -1);;

let rec running_sum x = 
  if x <= 1 then x else x + running_sum (x-1);;


let rec gdc a b = 
  let remainder = a mod b  in 
  if remainder = 0 then b
  else gdc b remainder ;;

let even_vs_odd a b c = 
  if (a mod 2) + (b mod 2) + (c mod 2) < 2 then true else false;;

let rec pow a b = 
  if b = 1 then a
  else (pow a (b-1)) * a;;(*  make sure to put b-1 within () *)


let isprime n = 
  let rec iter n i = 
    if i = 1 then true
    else if (n mod i) = 0 then false
          else iter n (i-1)
  in iter n (n-1);;


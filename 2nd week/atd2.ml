(*Count number of digits*)

let rec digits num=
  if num <> 0 then 1 + digits(num/10)
  else 0;;

let digits2 num = 
  let rec iter i res = 
    if i <> 0 then iter (i/10) (res+1) 
    else res
  in iter num 0;;
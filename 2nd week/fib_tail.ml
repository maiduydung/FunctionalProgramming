let fib n =
  let rec iter fnum1 fnum2 i =
    if i = n then fnum1 + fnum2
    else iter (fnum1 + fnum2) fnum1 (i+1)
  in match n with
    0 -> 0
    | 1 -> 1
    | _ -> iter 1 0 2;;
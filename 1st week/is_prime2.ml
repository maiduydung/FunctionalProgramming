let rec f a =
  if a < 10
  then f (a+1)
  else a
 in
 let a = f 1 in
 Printf.printf "the number is now %d\n" a
let rec power a n =
  if n = 1 then a
  else a * (power a (n-1));;
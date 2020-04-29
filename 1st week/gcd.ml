let rec gcd a b =
  let remainder = a mod b in
  if remainder = 0 then b
  else gcd b remainder;;


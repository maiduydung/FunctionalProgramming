let rec factorial (num) = 
  if num <= 1 then num
  else num * factorial(num -1);;
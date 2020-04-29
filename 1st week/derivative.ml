let func num = 
  let delta = 0.00001 in
  ( ((num +. delta)**2.0) -. (num**2.0) ) /. delta;;
(* 
Define a record type memo with a mutable string type field content
Define a variable s of type memo. Let content be an empty string
Store the one-line character string input by the user in content of the variable s
Display content of variable s on the screen *)
  
  type memo = {mutable content:string};;
  let s = {content=""};;
  s.content <-read_line();;
  print_endline(s.content)
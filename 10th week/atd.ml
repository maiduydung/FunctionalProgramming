let rec printchars arg = 
  String.iter (fun x -> print_endline (Char.escaped x) ) arg
  ;;

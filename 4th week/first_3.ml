  (* Showing first 3 lines from std input *)
  (* ls -l / | ocaml head.ml *)
  let n = 3;;
  let rec head i = 
    if i < n then
      let line = read_line() in print_endline line;
      head (i+1)
    else ();;

  head 0;;
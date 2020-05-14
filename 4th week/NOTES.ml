
(* Inputing string *)
print_string "your name: ";;
let name = read_line();;
print_endline ("Hi, " ^ name ^ ".");;

(* type:()
   Same as void in C 
   Returning void in ocaml *)

  let hi() = 
    let name = read_line() in
    print_endline ("Hi, " ^ name ^ ".");;



  (* Grouping 3 expression into 1, returning string name *)
  let greet() = 
      let name = read_line() in
      print_endline ("Hi, " ^ name ^ ".");
      print_endline ("Good day, isn't it?");
      print_endline ("Enjoy your day.");
      name;;

  

  (* Showing first 3 lines from std input *)
  (* ls -l / | ocaml head.ml *)
  let n = 3;;
  let rec head i = 
    if i < n then
      let line = read_line() in print_endline line;
      head (i+1)
    else ();;

  head 0;;


Printf.printf "%d %08x %b %s\n" 12 345 false "Hello";;
Scanf.sscanf

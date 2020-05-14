
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


(* Representation of States using Mutable Types *)

  let a = ref 0;;

  !a;;

  a := 3;;

  !a;;

  a := !a + 1;;

  !a;;

  (* Counting how many times count() has been call *)
  let cnt = ref 0;;
  let count()=
    cnt := !cnt + 1;
    !cnt;;
  count();;

  (*Better yet*)

  let count = 
    let cnt = ref 0 in
    fun() -> cnt := !cnt + 1; !cnt


  (* Mutable *)
  (* Enables assigning value with <- operator*)

  type bank_account = {name: string; mutable amount:int};;

  let alice = {name = "Mai"; amount = 10000};;
  alice.amount <- alice.amount + 3000;;
  alice;;

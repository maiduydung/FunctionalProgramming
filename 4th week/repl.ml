(* REPL *)

type expression =
  Binop of char * expression * expression
| Number of int

exception ParseError;;
let parse expr =
let expr = 
  let r = ref "" in
  String.iter (fun c -> if c <> ' ' then r := !r ^ (String.make 1 c) else ()) expr;
  !r
in let len = String.length expr in
let rec parse_addsub pos =
  let rec iter (pos, e) =
    if pos >= len then pos, e
    else match expr.[pos] with
        '+' | '-' as op ->
        let pos, e2 = parse_muldiv (pos+1) in iter (pos, Binop(op, e, e2))
      | _ -> (pos, e)
  in iter (parse_muldiv pos)
and parse_muldiv pos =
  let rec iter (pos, e) =
    if pos >= len then pos, e
    else match expr.[pos] with
        '*' | '/' as op ->
        let pos, e2 = parse_simple (pos+1) in iter (pos, Binop(op, e, e2))
      | _ -> (pos, e)
  in iter (parse_simple pos)
and parse_simple pos =
  if pos >= len then raise ParseError
  else match expr.[pos] with
      '(' ->
      let pos, head = parse_addsub (pos+1) in
      if pos >= len || expr.[pos] <> ')' then raise ParseError
      else (pos+1), head
    | c when c >= '0' && c <= '9' ->
      let char_of_int c = Char.code c - Char.code '0' in
      let rec iter (pos, v) =
        if pos >= len || expr.[pos] < '0' || expr.[pos] > '9' then (pos, v)
        else iter (pos+1, v * 10 + char_of_int expr.[pos])
      in let (pos, v) = iter (pos+1, char_of_int c)
      in pos, Number(v)
    | _ -> raise ParseError
in let pos, head = parse_addsub 0 in
if pos < len then raise ParseError
else head
;;

exception EvalError;;
let rec eval exp = 
  match exp with
  | Binop('+',tr1,tr2) -> (eval tr1) + (eval tr2)
  | Binop('-',tr1,tr2) -> (eval tr1) - (eval tr2)
  | Binop('*',tr1,tr2) -> (eval tr1) * (eval tr2)
  | Binop('/',tr1,tr2) -> (eval tr1) / (eval tr2)
  | Number(num) -> num
  | Binop(_,_,_) -> raise EvalError;;


let rec repl () = 
  begin
    try
      print_string ">>> ";
      let command = read_line() in
      let expr = parse command in 
      let res = eval expr in 
      print_endline (string_of_int res);
    with
        ParseError -> print_endline "ERROR: syntax error" 
      | EvalError -> print_endline "ERROR: evaluation error" 
      | Division_by_zero -> print_endline "ERROR: devision by zero"
  end;
  repl() 
;;

repl() ;;

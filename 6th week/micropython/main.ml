let main argc argv =
  let env = ValueEnv.create () in
  if argc = 2 then
    Load.load_file argv.(1)
    |> Load.convert_block
    |> Lexing.from_string
    |> Parser.prog Lexer.token
    |> Eval.eval_stmt_list env
  else prerr_endline "Usage: micropython <filename>"

let _ = main (Array.length Sys.argv) Sys.argv

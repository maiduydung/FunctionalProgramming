(* Semantic Analysis and Type Checking *)
(* Analyzing data type in order to compile proper machine code
 -> (int * int) vs (int * str) *)
 
(* Type checking implemented as recursive function on abstract syntax tree

  Type checker demo *)

  type pyvalue =
    IntVal of int
  | StrVal of string

  type pytype = 
    IntType
  | StrType

  type pyexpr = 
    Add of pyexpr * pyexpr
  | Mul of pyexpr * pyexpr
  | Value of pyvalue

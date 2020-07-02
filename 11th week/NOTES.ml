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

(* For languages requires type deleclaration like C
1. Create evironment to include all global and local variables 
2. From local variables, create local environment
  local_env = 
  {
    "x" : IntType;
    "y" : IntType;
    "z" : IntType;
  }
3. check return type correspond to function type

For ocaml
  Implement as recursive function
  let x = 1 + 2 in x + 3;; *)
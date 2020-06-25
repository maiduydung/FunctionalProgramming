(* simple type-checking *)

type pyvalue =
    IntVal of int
  | StrVal of string
  | FloatValue of float

type pytype =
    IntType
  | StrType
  | FloatType

type pyexpr =
    Add of pyexpr * pyexpr  (* e1 + e2 *)
  | Mul of pyexpr * pyexpr  (* e1 * e2 *)
  | Value of pyvalue


(* program execution *)
let rec eval_expr = function
    Add(e1, e2) ->
    begin
      match eval_expr e1, eval_expr e2 with
        IntVal(v1), IntVal(v2) -> IntVal(v1 + v2)
      | StrVal(v1), StrVal(v2) -> StrVal(v1 ^ v2)
      | FloatValue(v1), FloatValue(v2) -> FloatValue(v1 +. v2)
      | FloatValue(v1), IntVal(v2) | IntVal(v2), FloatValue(v1) -> FloatValue( v1 +. float_of_int(v2))
      | _ -> failwith "type error"
    end      
  | Mul(e1, e2) ->
    begin
      match eval_expr e1, eval_expr e2 with
        IntVal(v1), IntVal(v2) -> IntVal(v1 * v2)
      | IntVal(n), StrVal(s) | StrVal(s), IntVal(n) -> failwith "not implemented"
      | FloatValue(v1), FloatValue(v2) -> FloatValue(v1 *. v2)
      | FloatValue(v1), IntVal(v2) | IntVal(v2), FloatValue(v1) -> FloatValue( v1 *. float_of_int(v2))
      | _ -> failwith "type error"
    end
  | Value(v) -> v

(* type checking *)
let rec type_expr = function
    Add(e1, e2) ->
    begin
      match type_expr e1, type_expr e2 with
        IntType, IntType -> IntType
      | StrType, StrType -> StrType
      | FloatType, FloatType | IntType, FloatType -> FloatType
      | _ -> failwith "type error"
    end
  | Mul(e1, e2) ->
    begin
      match type_expr e1, type_expr e2 with
        IntType, IntType -> IntType
      | IntType, StrType | StrType, IntType -> StrType
      | FloatType, FloatType | IntType, FloatType | FloatType, IntType -> FloatType
      | _ -> failwith "type error"
    end
  | Value(IntVal(_)) -> IntType
  | Value(StrVal(_)) -> StrType
  | Value(FloatValue(_)) -> FloatType


let t1 = type_expr (Add(Value(IntVal(1)), Value(FloatValue(2.0))))


let t2 = eval_expr (Add(Value(IntVal(1)), Value(FloatValue(2.0))))


let t3 = type_expr (Mul(Value(IntVal(1)), Value(StrVal("abc"))));;


let t4 = type_expr (Mul(Value(FloatValue(3.0)), Value(StrVal("abc"))));;



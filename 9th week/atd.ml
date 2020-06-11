type 'a solo = 'a
type ('a, 'b) duo = 'a * 'b
type ('a, 'b, 'c) trio = 'a * 'b * 'c

type myvalue =
    BoolSolo of bool solo
  | BoolStrDuo of (bool, int) duo
  | BoolStrIntTrio of (bool, int, string) trio
;;

let var1 = (BoolStrDuo(true, 1))
;;  

match var1 with
    BoolSolo(_) -> 1
  | BoolStrDuo(_, _) -> 2
  | BoolStrIntTrio(_, _, _) -> 3
;;
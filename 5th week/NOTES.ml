(* Requirements for large scale programming
Avoid name conflict -> namespace *)

module Bank = 
  struct
    (* name, balance *)
    type t = (string, int) Hashtbl.t

    (* bank init *)
    let create() = 
      Hashtbl.create 100
  end


(* in general *)
module Bank:
  sig
    (* signature content *)
  end =
  struct
    (* module content *)
  end

  (* compile foo.ml, bar.ml and link them together *)
  (* 
    ocamlc -c foo.ml -o foo.cmo
    ocamlc -c bar.ml -o bar.cmo
    ocamlc foo.cmo bar.cmo -o a.out 
  *)


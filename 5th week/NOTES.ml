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
(* Pipe operator |> *)

  (* Extract even number in list, then double all elements still remain within *)
  xs |> List.filter(fun x -> (x mod 2) = 0) |> List.map (fun x -> x**2.0);;
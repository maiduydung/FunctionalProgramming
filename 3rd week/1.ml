let mymap f mylist =
  List.fold_left (fun result x->
    (f x) :: result
   ) []  (List.rev mylist);;


mymap (fun x -> x -1) [1;2;3;4];;

let rec mymap2 f mylist =
  match mylist with
    hd::tl -> hd mymap2 f mylist
    | [] -> 0;;
(* Custom type *)
  type trio = int * string * bool;;
  let id x : trio = x;;

  (* Record type *)
    (* Same as struct in C *)
    (* Can store multiple values *)

    (* Representing complex numbers *)
    type complex = {re: float; im: float};;
    let c = {re = 5.0; im = 3.0 };;
    c.re +. c.im;;

    (* Pattern matching *)
    let add {re = r1; im = i1} {re = r2; im = i2} = 
      {re = r1 +. r2; im = i1 +. i2};;
    let c1 = {re = 1.0; im = 3.0} and c2 = {re = 2.0; im = 6.0} in
      add c1 c2;;
    
      (* Can also be written as *)
      let add a b = 
        { re = a.re +. b.re; im = a.im +. b.im };;


    (* Variant type *)
    (* Label name has to start with a capital letter *)
    type person = 
      Student of   {id: string; name: string; grade:int}
      | Teacher of {title: string; name:string};;

    Student {id = "s1f10180069"; name = "Mai Duy Dung"; grade = 10};;
    Teacher {title = "Professor"; name = "Vu Thi Le Hang"};;

    (* Pattern matching *)
    let get_name p = 
      match p with 
        Student {id = _; name = n; grade = g} ->
          n ^ (if g > 3 then " senpai" else " san")
        | Teacher {title = t; name = n} -> t ^ " " ^ n;; 
    
    let mdd = Student{id = "007"; name ="Mai Duy Dung"; grade = 3} 
      in get_name mdd;;
    let mom = Teacher{title ="Prof."; name ="Vu Thi Le Hang";} 
      in get_name mom;;
    
    
    (* Singly linked list *)
    type int_list = Node of int * int_list | NULL;;

    let rec length xs =
      match xs with 
        Node (_,tl) -> 1 + length tl
        | NULL -> 0;;
    
    let lst = Node(1, Node(2, Node(3, NULL))) in length lst;;

    
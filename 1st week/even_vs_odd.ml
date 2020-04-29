let f a b c d e =
  if  ( (abs a) mod 2) + ((abs b) mod 2) + ((abs c) mod 2) + (( abs d) mod 2) + ((abs e) mod 2)  < 3
  then true
  else false
  ;;

  (* let f a =
    if  ( ( (abs a) mod 2 ) = 0 )
    then true
    else false
    ;; *)


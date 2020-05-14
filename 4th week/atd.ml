type lat_lng = float * float;;

type lat_lng_op =
  Values of lat_lng
| Null
;;

let north_of_iniad llo = 
  match llo with
    Values (lat,_) -> true
  | Null -> false
;;

let akabane_st = Values(35.780246, 139.7156);;

north_of_iniad akabane_st;;
north_of_iniad Null;;
type location =    
  LatLng of { lat : float; lng : float; }  
| Place of { name : string; }

type way = Walk | Fly | Car | Train

let duration w l1 l2 = 
  match l1, l2 with 
    LatLng{lat = x1; lng = y1}, LatLng{lat = x2; lng = y2} ->
      begin
        let dist =  in 
          match ? with
            ?? -> dist /. 4.0
          | ?? -> dist /. 800.0
          | ?? -> dist /. 50.0
          | ?? -> dist /. 90.0
      end
    | _,_, ->failwith "Error"
  ;;
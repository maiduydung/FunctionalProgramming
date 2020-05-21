type 'a t  
exception EmptyStack
val create : unit -> 'a t 
val push : 'a t -> 'a -> unit
val pop : 'a t -> 'a 
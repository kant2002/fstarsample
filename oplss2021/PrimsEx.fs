(* This is workaround for incomplete ulibfs *)
module Prims
let __proj__Cons__item__hd : 'Aa list -> 'Aa =
  fun projectee  -> List.head projectee
let __proj__Cons__item__tl : 'Aa list -> 'Aa list =
  fun projectee  -> List.tail projectee

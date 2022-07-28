module GC_Env
open GC_Types
open GC_Memory

let mutable global_gc_state: gc_state = {
    abs_fields = fun x -> no_abs;
    color = fun x -> Unalloc; // should store in the map?
    fields = fun x -> Prims.of_int 0;
    to_abs = fun x -> no_abs;
}

let get : unit -> gc_state = fun () -> global_gc_state
let set : gc_state -> unit = fun (state) -> global_gc_state <- state

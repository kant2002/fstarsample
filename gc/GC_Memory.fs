module GC_Memory
open Prims

(*assume*) type abs_node = int //: a:Type0{hasEq a}

let mem_lo = Prims.of_int 1
let mem_hi = Prims.of_int 1024

let is_memory_address address =
    mem_lo <= address && address < mem_hi

let no_abs
    = Prims.of_int -123

//let valid a = a <> no_abs
// type valid_node = a:abs_node{valid a}
type valid_node = abs_node

type memory_address = int

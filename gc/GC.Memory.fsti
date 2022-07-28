module GC.Memory

(*assume*) val mem_lo : x:int{0 < x}
(*assume*) val mem_hi : x:int{mem_lo < x}
let is_memory_address address =
    mem_lo <= address && address < mem_hi

assume type abs_node : a:Type0{hasEq a}
(*assume*) val no_abs : abs_node
let valid a = a <> no_abs
type valid_node = a:abs_node{valid a}

type memory_address  = i:int{is_memory_address i}

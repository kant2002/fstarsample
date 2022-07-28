module GC.Types
open GC.Memory

type color =
 | Unalloc
 | White
 | Gray
 | Black

// Let's assume that our object has just 2 fields, F1 and F2.
type field =
  | F1
  | F2

type color_map = memory_address -> Tot color
type field_map     = memory_address * field -> Tot memory_address
type abs_field_map = abs_node * field -> Tot abs_node
type abs_map   = memory_address -> Tot abs_node

noeq type gc_state = { 
  to_abs: abs_map;
  color: color_map;
  abs_fields: abs_field_map;
  fields: field_map
}

type trigger (i:int) = True

type to_abs_inj (to_abs:abs_map) =
  forall (i1:memory_address) (i2:memory_address).{:pattern (trigger i1); (trigger i2)}
    trigger i1 /\
    trigger i2 /\
       valid (to_abs i1)
    /\ valid (to_abs i2)
    /\ i1 <> i2
    ==> to_abs i1 <> to_abs i2

type ptr_lifts gc_state (ptr:memory_address) : Type =
  b2t (valid (gc_state.to_abs ptr))

type ptr_lifts_to gc_state (ptr:memory_address) (abs:abs_node) : Type =
  valid abs
  /\ gc_state.to_abs ptr = abs

type obj_inv gc_state (i:memory_address) =
  valid (gc_state.to_abs i)
  ==> (forall f. ptr_lifts_to gc_state (gc_state.fields (i, f)) (gc_state.abs_fields (gc_state.to_abs i, f)))

unfold type inv gc_state (color_invariant:memory_address -> Type) =
    to_abs_inj gc_state.to_abs
    /\ (forall (i:memory_address).{:pattern (trigger i)}
	trigger i ==>
          obj_inv gc_state i /\
          color_invariant i /\
          (not (valid (gc_state.to_abs i)) <==> gc_state.color i = Unalloc))

type mutator_inv gc_state =
  inv gc_state (fun i -> gc_state.color i = Unalloc \/ gc_state.color i = White)


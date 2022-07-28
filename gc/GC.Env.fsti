module GC.Env

open GC.Types

new_effect GC_STATE = STATE_h gc_state

// Type representing generic type which provide different GC post condition types.
let gc_post_condition (a:Type) = a -> gc_state -> Type0
sub_effect
  DIV   ~> GC_STATE = fun (a:Type) (wp:pure_wp a) (p:gc_post_condition a) (gc:gc_state) -> wp (fun a -> p a gc)

effect GC (a:Type) (pre_condition:gc_state -> Type0) (post_condition: gc_state -> Tot (gc_post_condition a)) =
       GC_STATE a
             (fun (p:gc_post_condition a) (gc:gc_state) ->
                  pre_condition gc /\ (forall a gc'. (pre_condition gc /\ post_condition gc a gc') ==> p a gc')) (* WP *)

effect GCMut (res:Type) (req:gc_state -> Type0) (ens:gc_state -> Tot (gc_post_condition res)) =
       GC res (fun gc -> req gc /\ mutator_inv gc)
              (fun gc res gc' -> ens gc res gc' /\ mutator_inv gc')
   
(*assume*) val get : unit -> GC gc_state (fun gc -> True) (fun gc res gc' -> gc==gc' /\ res==gc')
(*assume*) val set : g:gc_state -> GC unit (fun gc -> True) (fun _ _ gc' -> g==gc')

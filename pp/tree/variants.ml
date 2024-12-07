(* A variant type is defined using the type keyword followed by 
the | symbol to separate different constructors. 
Each constructor represents one possible form of the type. *)

(* .mli *)


(* .ml *)
(* Define a module type `OrderedType` which specifies a type `t` 
   and a comparison function `compare` for ordering elements of type `t` *)
module type OrderedType = sig
  type t
  val compare: t -> t -> int
end

(* Define a module type `S`, which describes the interface for a set data structure *)
module type S = sig
  type elt  (* element *)
  type t

  val empty : t                    (* An empty set *)
  val is_empty : t -> bool         (* Check if a set is empty *)
  val insert : elt -> t -> t       (* Insert an element into the set *)
  val of_list : elt list -> t      (* Create a set from a list of elements *)
  val delete : elt -> t -> t       (* Delete an element from the set *)
  val mem : elt -> t -> bool       (* Check if an element is a member of the set *)
end

(* Functor `Make` takes a module `Ord` that 
  matches `OrderedType` and returns a set module.
   This module provides a binary search tree implementation of 
   a set with elements of type `Ord.t`. *)
module Make (Ord: OrderedType) = struct
  type elt = Ord.t
  type t = Leaf | Node of elt * t * t

  let empty = Leaf
  let is_empty t = t = Leaf
  let rec insert x t = 
    match t with
    | Leaf -> Node(x, Leaf, Leaf)
    | Node(x', l, r) when Ord.compare x' x < 0 -> Node(x', insert x l, r)
    | Node(x', l, r) when Ord.compare x' x > 0 -> Node(x', l, insert x r)
    | _ -> t

  let of_list l = List.fold_left (Fun.flip insert) empty l 

  let rec largest t = 
    match t with 
    | Leaf -> failwith "Empty"
    | Node(x, _, Leaf) -> x
    | Node(_, _, r) -> largest r

  let rec delete z t =
    match t with
    | Leaf -> Leaf
    | Node(x, l, r) when Ord.compare z x < 0 -> Node(x, delete z l, r)
    | Node(x, l, r) when Ord.compare z x > 0 -> Node(x, l, delete z r)
    | Node(_, Leaf, r) -> r
    | Node(_, l, Leaf) -> l 
    | Node(_, l, r) -> 
      let max = largest l in 
      Node(max, delete max l, r)

 let rec mem z t = 
  match t with
  | Leaf -> false
  | Node(x, l, _) when Ord.compare z x < 0 -> mem z l
  | Node(x, _, r) when Ord.compare z x > 0 -> mem z r
  | _ -> true (* `z` equals `x`, so return true *)
end
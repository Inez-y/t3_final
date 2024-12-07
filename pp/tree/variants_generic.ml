(* Define a binary search tree type `t` with generic element type `'a`.
   - `Leaf` represents an empty tree.
   - `Node` represents a tree node containing an element of type `'a` and left and right subtrees. *)
   type 'a t = Leaf | Node of 'a * 'a t * 'a t

   (* `empty` represents an empty tree, which is just `Leaf`. *)
   let empty = Leaf
   
   (* Check if a tree `t` is empty by comparing it to `Leaf`. *)
   let is_empty t = t = Leaf
   
   (* Recursively calculate the size (number of nodes) of a tree `t`. *)
   let rec size t =
     match t with
     | Leaf -> 0                           (* An empty tree has size 0. *)
     | Node (_, l, r) -> 1 + size l + size r  (* A node adds 1, plus sizes of the left and right subtrees. *)
   
   (* Recursively calculate the height of the tree `t`.
      The height is the length of the longest path from the root to a leaf. *)
   let rec height t =
     match t with
     | Leaf -> 0                           (* An empty tree has height 0. *)
     | Node (_, l, r) -> 1 + max (height l) (height r) (* A node adds 1, plus the maximum height of its children. *)
   
   (* Recursively insert an element `z` into the tree `t` using a comparison function `cmp`.
      - If `z` is less than the current node's element, insert `z` into the left subtree.
      - If `z` is greater, insert `z` into the right subtree.
      - If `z` is equal, do nothing (no duplicates allowed). *)
   let rec insert cmp z t =
     match t with
     | Leaf -> Node (z, Leaf, Leaf)        (* Insert `z` as a new node if the tree is empty. *)
     | Node (x, l, r) when cmp z x < 0 ->
       Node (x, insert cmp z l, r)         (* Insert `z` into the left subtree if `z < x`. *)
     | Node (x, l, r) when cmp z x > 0 ->
       Node (x, l, insert cmp z r)         (* Insert `z` into the right subtree if `z > x`. *)
     | _ -> t                              (* Do nothing if `z = x` (no duplicates). *)
   
   (* Create a tree from a list `l` by inserting each element with `insert`.
      Starts with `empty` and folds `insert` over the list. *)
   let of_list cmp l =
     List.fold_left (fun acc x -> insert cmp x acc) empty l
   
   (* Find the largest element in a non-empty tree `t`.
      This helper function assumes `t` is not empty. *)
   let rec largest t =
     match t with
     | Leaf -> failwith "largest: empty tree"  (* Raise an error if the tree is empty. *)
     | Node (x, _, Leaf) -> x                  (* If `Leaf` is reached on the right, `x` is the largest element. *)
     | Node (_, _, r) -> largest r             (* Otherwise, continue to the right subtree. *)
   
   (* Recursively delete an element `z` from the tree `t` using the comparison function `cmp`.
      Handles three cases:
      - If `z` is less than the current node, delete from the left subtree.
      - If `z` is greater, delete from the right subtree.
      - If `z` equals the current node:
        - Replace with the right child if the left child is `Leaf`.
        - Replace with the left child if the right child is `Leaf`.
        - Otherwise, replace with the largest element in the left subtree. *)
   let rec delete cmp z t =
     match t with
     | Leaf -> Leaf                            (* If the tree is empty, return `Leaf`. *)
     | Node (x, l, r) when cmp z x < 0 ->
       Node (x, delete cmp z l, r)             (* Delete `z` from the left subtree if `z < x`. *)
     | Node (x, l, r) when cmp z x > 0 ->
       Node (x, l, delete cmp z r)             (* Delete `z` from the right subtree if `z > x`. *)
     | Node (_, Leaf, r) -> r                  (* No left child; replace node with right subtree. *)
     | Node (_, l, Leaf) -> l                  (* No right child; replace node with left subtree. *)
     | Node (_, l, r) ->
       let max = largest l in                  (* Find the largest element in the left subtree. *)
       Node (max, delete cmp max l, r)         (* Replace `x` with `max` and delete `max` from left. *)
   
   (* Recursively check if element `z` exists in the tree `t` using the comparison function `cmp`. *)
   let rec mem cmp z t =
     match t with
     | Leaf -> false                           (* If the tree is empty, return false. *)
     | Node (x, l, _) when cmp z x < 0 ->
       mem cmp z l                             (* Check left subtree if `z < x`. *)
     | Node (x, _, r) when cmp z x > 0 ->
       mem cmp z r                             (* Check right subtree if `z > x`. *)
     | _ -> true                               (* If `z = x`, return true. *)
   
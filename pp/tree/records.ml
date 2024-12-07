(** A record type representing a student. 
    @field id  The unique identifier for the student.
    @field name The full name of the student.
    @field gpa  The student's grade point average. *)
type student = {id: string; name: string; gpa: float}

(** An example student with id "a12345678", name "Homer Simpson", and a GPA of 25.5. *)

let s1 = {id = "a12345678"; name = "homer simpson"; gpa = 25.5}

(** A new student record created by updating the GPA of [s1] to 50.0.
    This demonstrates the use of the `with` keyword for creating updated records. *)
let s2 = {s1 with gpa = 50.0}

(** Creates a new student record.
    @param id   The unique identifier for the student.
    @param name The full name of the student.
    @param gpa  The student's grade point average.
    @return A new [student] record. *)
let make_student id name gpa = {id; name; gpa}


(** Extracts the name from a student record.
    @param student The student record.
    @return The name of the student. *)
let name {name; _} = name

(** A record type representing a student with a mutable GPA.
    This allows modifying the GPA field after the record has been created.
    @field id  The unique identifier for the student.
    @field name The full name of the student.
    @field gpa  The student's mutable grade point average. *)
type student' = {id: string; name: string; mutable gpa: float}

(** An example mutable student record with id "a12345678", name "Homer Simpson",
    and a GPA of 25.5. The GPA can be modified directly. *)
let s1' = {id = "a12345678"; name = "homer simpson"; gpa = 25.5}

let mutable_update = s1'.gpa <- 49.9

(* lecture *)
(** Type representing a binary search tree, where 'a is the type of the elements stored in the tree.
L represents an empty leaf (empty tree).
N represents a node containing a value of type 'a (v), a left subtree (l), and a right subtree (r). *)
type 'a t = L | N of {v: 'a; l: 'a t; r: 'a t}

(** An empty tree, represented by L. *)
let empty = L

(** Checks if a given tree is empty.
    @param t The tree to check.
    @return true if the tree is empty (L), false otherwise. *)
let is_empty t = t = L

(** Calculates the size of a binary search tree.
    @param t The tree whose size is to be calculated.
    @return The number of nodes in the tree. *)
let rec size t =
  match t with
  | L -> 0  (* Base case: an empty tree has size 0. *)
  | N {l; r} -> 1 + size l + size r  (* Recursively count nodes in left and right subtrees. *)

(** Inserts a new value into the binary search tree, maintaining the BST property.
    @param x The value to insert.
    @param t The tree in which to insert the value.
    @return A new tree with the value inserted. *)
let rec insert x t =
  match t with
  | L -> N {v = x; l = L; r = L}  (* Insert at an empty position, creating a new node. *)
  | N {v; l; r} when x < v ->
    N {v; l = insert x l; r}  (* Insert in the left subtree if x is less than v. *)
  | N {v; l; r} when x > v ->
    N {v; l; r = insert x r}  (* Insert in the right subtree if x is greater than v. *)
  | _ -> t  (* If x is equal to v, do nothing (no duplicates). *)

(** Constructs a binary search tree from a list of values.
    @param l The list of values to insert into the tree.
    @return A binary search tree containing all values from the list. *)
    (* List.fold_left : ('acc -> 'a -> 'acc) -> 'acc -> 'a list -> 'acc 
    ince List.fold_left passes the accumulator as the first argument and the list element as the second argument, we need to "flip" insert to match this order: insert becomes (tree -> value -> new_tree), so insert works with fold_left*)
let of_list l =
  List.fold_left (Fun.flip insert) empty l

(** Checks if a value exists in the binary search tree.
    @param x The value to search for.
    @param t The tree to search within.
    @return true if the value exists in the tree, false otherwise. *)
let rec mem x t =
  match t with
  | L -> false  (* Base case: an empty tree does not contain x. *)
  | N {v; l} when x < v -> mem x l  (* Search in the left subtree if x is less than v. *)
  | N {v; r} when x > v -> mem x r  (* Search in the right subtree if x is greater than v. *)
  | _ -> true  (* If x equals v, the value is found. *)

(** Finds the maximum value in a non-empty binary search tree.
    @param t The tree from which to find the maximum value.
    @raise Failure if the tree is empty.
    @return The maximum value in the tree. *)
let rec max t =
  match t with
  | L -> failwith "max: empty tree"  (* Raise an error if the tree is empty. *)
  | N {v; r = L} -> v  (* If the right subtree is empty, the current node is the maximum. *)
  | N {r} -> max r  (* Recursively find the maximum in the right subtree. *)

(** Deletes a value from the binary search tree, maintaining the BST property.
    @param x The value to delete.
    @param t The tree from which to delete the value.
    @return A new tree with the value deleted (if it existed). *)
let rec delete x t =
  match t with
  | L -> L  (* Base case: an empty tree remains unchanged. *)
  | N {v; l; r} when x < v ->
    N {v; l = delete x l; r}  (* Delete from the left subtree if x is less than v. *)
  | N {v; l; r} when x > v ->
    N {v; l; r = delete x r}  (* Delete from the right subtree if x is greater than v. *)
  | N {l = L; r} -> r  (* If the left subtree is empty, replace with the right subtree. *)
  | N {r = L; l} -> l  (* If the right subtree is empty, replace with the left subtree. *)
  | N {l; r} ->
    let m = max l in  (* Find the maximum in the left subtree. *)
    N {v = m; l = delete m l; r}  (* Replace the current node with this maximum, and delete it. *)

(** Converts a binary search tree to a string representation.
    @param converter A function to convert values of type 'a to strings.
    @param t The tree to convert to a string.
    @return A string representation of the tree.
    Empty nodes are represented as "*", and nodes are represented in the form "(value,left_subtree,right_subtree)". *)
let rec stringify converter t =
  match t with
  | L -> "*"  (* Base case: an empty node is represented by "*". *)
  | N {v; l; r} ->
    "(" ^
    converter v ^  (* Convert the node value to a string using the converter function. *)
    "," ^
    stringify converter l ^  (* Recursively stringify the left subtree. *)
    "," ^
    stringify converter r ^  (* Recursively stringify the right subtree. *)
    ")"

(* Making tree with records *)
type tree =
  | Leaf 
  | Node of {v: int; l: tree; r: tree}

type t = tree

let empty = Leaf

let is_empty t = t = empty

let compare x y = x - y

let rec insert x t =
  match t with
  | Leaf -> Node {v=x; l=Leaf; r=Leaf}
  | Node {v=x'; l; r} when compare x x' > 0 -> Node {v=x'; l; r=insert x r}
  | Node {v=x'; l; r} when compare x x' < 0 -> Node {v=x'; l=insert x l; r}
  | _ -> t  (* No insertion if the value already exists *)

let of_list l = List.fold_left (Fun.flip insert) empty l

let rec largest t =
  match t with
  | Leaf -> None  (* Return None for an empty tree *)
  | Node {v; r=Leaf; _} -> Some v  (* Largest value is found here *)
  | Node {r; _} -> largest r

let rec delete x t =
  match t with
  | Leaf -> Leaf  (* Return Leaf for an empty tree *)
  | Node {v=x'; l; r} when compare x x' > 0 -> Node {v=x'; l; r=delete x r}
  | Node {v=x'; l; r} when compare x x' < 0 -> Node {v=x'; l=delete x l; r}
  | Node {v=_; l=Leaf; r} -> r  (* Replace with right subtree *)
  | Node {v=_; l; r=Leaf} -> l  (* Replace with left subtree *)
  | Node {v=_; l; r} ->  (* Replace with largest value in the left subtree *)
      match largest l with
      | None -> Leaf  (* Shouldn't happen since `l` is not Leaf *)
      | Some max -> Node {v=max; l=delete max l; r}

let rec mem x t =
  match t with
  | Leaf -> false  (* Membership check should return false for an empty tree *)
  | Node {v=x'; l; r} when compare x x' > 0 -> mem x r
  | Node {v=x'; l; r} when compare x x' < 0 -> mem x l
  | _ -> true

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

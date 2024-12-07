(* A custom type in OCaml is a user-defined data type 
that allows you to model more complex structures or concepts specific to your application. 
They are created using the type keyword and are one of OCaml's most powerful features, 
enabling expressive and type-safe programming. *)

(* Basic *)
(* 1.
Define a Variant: Write a custom type traffic_light with variants Red, Yellow, and Green. 
Create a function next_light : traffic_light -> traffic_light 
that returns the next traffic light in the sequence. *)
type traffic_light = Red | Yellow | Green
let next_light t = 
  match t with
  | Red -> Yellow
  | Yellow -> Green
  | Green -> Red

(* 2.
Record Definition: Define a record type book with fields title, author, and pages 
(all strings except pages, which is an integer). 
Write a function summary : book -> string that returns a string summarizing the book 
(e.g., "Title: ..., Author: ..., Pages: ...").
 *)
type book = {title:string ; author:string ; pages:int}
let summary b = "Title: " ^ b.title  ^ " Author: " ^ b.author ^ "Pages: " ^ string_of_int b.pages

(* 3.
Pattern Matching with Variants: Create a variant type shape with constructors:

Circle of float (radius),
Rectangle of float * float (width and height),
Square of float (side length)
 *)
 type shape =
 | Circle of float  (* Radius of the circle *)
 | Rectangle of float * float  (* Width and height of the rectangle *)
 | Square of float  (* Side length of the square *)

let area s =
 match s with
 | Circle r -> Float.pi *. r *. r  (* Area of a circle: πr² *)
 | Rectangle (w, h) -> w *. h  (* Area of a rectangle: width × height *)
 | Square a -> a *. a  (* Area of a square: side² *)


(* 4.
Recursive Type: Define a recursive type 'a list_tree that can store 
a value of type 'a and a list of subtrees. 
Write a function size : 'a list_tree -> int that computes the number of nodes in the tree
*)
type tree = Leaf | Node of int * tree * tree

let rec size lst = 
  match lst with
  | Leaf -> 0
  | Node(_, l, r) -> size l + size r

type 'a list_tree = Node of 'a * 'a list_tree list
let rec size (Node(_, subtrees)) =
  1 + List.fold_left (fun acc subtree -> acc + size subtree) 0 subtrees

(* Intermediate *)
(* 5.
Parameterized Types: Define a type 'a option_tree for binary trees where each node 
either contains a value of type 'a or is None. 
Write a function count_nodes : 'a option_tree -> int to count the number of non-None nodes in the tree. *)
type 'a option_tree = Empty | Node of int * 'a option_tree * 'a option_tree
let rec count_nodes ot = 
  match ot with
  | Empty -> 0
  | Node(_, l, r) -> 1 + count_nodes l + count_nodes r

(* 6.
List Conversion: Create a type int_pair = Pair of int * int. 
Write a function pairs_to_list : int_pair list -> (int * int) list 
that converts a list of int_pair into a list of tuples.
*)
type int_pair = Pair of int * int
let rec pairs_to_list ip = 
  match ip with
  | [] -> []
  | Pair (x, y) :: xs -> (x, y) :: pairs_to_list xs

(* 7.
Mutual Recursion: Define a mutually recursive type for even and odd-length lists:
type even_list =
  | EvenEmpty
  | EvenCons of int * odd_list
and odd_list =
  | OddCons of int * even_list
Write a function sum_even_list : even_list -> int to compute the sum of all integers in an even_list
 *)
 type even_list =
 | EvenEmpty
 | EvenCons of int * odd_list
and odd_list =
 | OddCons of int * even_list

 let rec sum_even_list l =
  match l with
  | EvenEmpty -> 0
  | EvenCons (n, OddCons (m, el)) -> n + sum_even_list el

  
(* 8.
Polymorphic Variants: Create a polymorphic variant type for ok, error, or pending. 
Write a function status_message : [ Ok of string | Error of string | Pending ] -> string` 
to return appropriate status messages.

A polymorphic variant is a variant type in OCaml that does not require explicit type declarations. Instead, you can define and use them directly with backtick syntax (`). Polymorphic variants allow greater flexibility because you don't need to predefine the type and can reuse or extend it in different contexts.

*)
type status = OK of string| Error of string | Pending

let status_message s =
  match s with
  | OK str -> "OK: " ^ str
  | Error str -> "Error: " ^ str
  | Pending -> "Pending" 



(* Advanced *)
(* 9.
Complex Records: Define a record type student with fields id, name, and grades (a list of integers). 
Write a function average_grade : student -> float 
to compute the average grade, handling an empty grade list gracefully. *)

(* 10.
Binary Search Tree: Define a recursive type 'a bst for binary search trees. 
Write functions:

insert : 'a -> 'a bst -> 'a bst to insert an element,
find : 'a -> 'a bst -> bool to check if an element exists,
to_list : 'a bst -> 'a list to convert the tree into an in-order list.
 *)

(* 11.
JSON-like Tree: Define a custom type json for JSON-like data:
type json =
  | JNull
  | JBool of bool
  | JNumber of float
  | JString of string
  | JArray of json list
  | JObject of (string * json) list

Write a function stringify : json -> string 
to convert the custom type to a JSON-like string representation.
*)

(* 12.
Heterogeneous Tree: Create a custom type for a tree where each node can store either an integer, a string, or a float. 
Write a function count_int_nodes : tree -> int to count how many integer nodes exist in the tree.
 *)


(* 13.
Expression Trees: Define a type expr to represent mathematical expressions:
type expr =
  | Const of float
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr
Write a function evaluate : expr -> float to evaluate the expression.
 *)


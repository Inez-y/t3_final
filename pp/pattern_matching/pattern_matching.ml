(* 
1. Sum of a List 
Write a function sum that computes the sum of all integers in a list using pattern matching.
*)
let rec sum lst = 
  match lst with
  | [] -> 0
  | x :: xs -> x + sum xs

(* 
2.
Write a match expression to classify an integer as "negative", "zero", or "positive"
*)
let rec exam_integer n = 
  match n with
  | n when n > 0 -> "positive"
  | 0 -> "zero"
  | _ -> "negative"

(* 
3. Count Leaves in a Tree
Define a binary tree type and write a function to count the number of leaves in a binary tree using pattern matching.
*)
type tree =
  | Leaf
  | Node of int * tree * tree

let rec count_leaves t =
  match t with
  | Leaf -> 1
  | Node (_, l, r) -> (count_leaves l) + (count_leaves r)

(* 
4. Swap tuple
*)
let swap(a, b) = (b, a)

(* 
5. Finding an Element in a List
Write a function find that takes an element and a list, and returns true if the element is in the list, otherwise false. 
Use pattern matching.
*)

let rec find elem lst = 
  match lst with
  | [] -> false
  | x :: xs -> if (x == elem) then true else (find elem xs)

(* 
6. Complex Pattern Matching
Extend the function to handle cases where the circle's radius, rectangle's width, or square's side is zero and return "Invalid shape".
*)

type shape =
  | Circle of float
  | Rectangle of float * float
  | Square of float

let describe_shape_question s =
  match s with
  | Circle r -> "Circle with radius " ^ string_of_float r
  | Rectangle (w, h) -> "Rectangle with width " ^ string_of_float w ^ " and height " ^ string_of_float h
  | Square side -> "Square with side " ^ string_of_float side

let describe_shape_answer s =
  match s with
  | Circle r when r = 0.0 -> "Invalid shape"
  | Rectangle (w, h) when w = 0.0 || h = 0.0 -> "Invalid shape"
  | Square side when side = 0.0 -> "Invalid shape"
  | Circle r -> "Circle with radius " ^ string_of_float r
  | Rectangle (w, h) -> "Rectangle with width " ^ string_of_float w ^ " and height " ^ string_of_float h
  | Square side -> "Square with side " ^ string_of_float side

(* 
7. Classify a List
Write a function classify_list that takes a list of integers and returns:

"empty" if the list is empty,
"singleton" if the list has exactly one element,
"pair" if it has exactly two elements,
"long" otherwise.
*)
let classify_list lst =
  match lst with 
  | [] -> "empty"
  | [x] -> "singleton"
  | [x; y] -> "pair"
  | _ -> "long"

(* 
8. Decompose a List
Write a function decompose that takes a list and:

Returns None if the list is empty,
Returns Some (head, tail) otherwise, where head is the first element and tail is the rest of the list.
*)

let decompose lst = 
  match lst with
  | [] -> None
  | head:: tail -> Some (head, tail)

(* 
9. Flatten a Nested Lest 
Define a type nested_list and write a function flatten that takes a nested list and returns a flat list of integers.
*)

type nested_list =
  | Int of int
  | List of nested_list list

let rec flatten lst =
  match lst with
  | Int(x) -> [x]
  | List[] -> []
  | List(x::xs) -> flatten x @ flatten (List xs)

(* 
10. Fibonacci Sequence with Pattern matching
Write a function fib that computes the nth Fibonacci number using pattern matching.
*)
let rec fib n =
  match n with
  | n when n < 0 -> failwith "cannot be under 0"
  | n when n < 2 -> n
  | _ -> fib (n - 1) + fib (n - 2)

(* 
11. Reverse a List
Write a function reverse that reverses a list using pattern matching.
*)
let rec reverse lst = 
  match lst with
  | [] -> []
  | x :: xs -> reverse xs @ [x]
(* 
6. Check Palindrome
Write a function is_palindrome that checks whether a given list is a palindrome. 
Use pattern matching and recursion. 
*)
let rec is_palindrome lst =
  let rec reverse lst = 
    match lst with
    | [] -> []
    | x :: xs -> reverse xs @ [x]
  in
  lst = reverse lst


(* 
7. Remove Duplicates
Write a function remove_duplicates that removes duplicate elements from a list, keeping only the first occurrence of each element. 
Use pattern matching and recursion.
*)
let rec remove_duplicates lst = 
  let rec aux acc lst = 
    match lst with
    | [] -> List.rev acc
    | x::xs -> 
      if List.mem x acc then aux acc xs
      else aux (x::acc) xs 
  in aux [] lst

(* 
8. Map Over a Binary Tree
Define a type for binary trees and write a function map_tree that applies a given function to every node in the tree.
*)

type tree =
  | Leaf
  | Node of int * tree * tree

let rec map_tree f t =
  match t with
  | Leaf -> Leaf
  | Node (n, l, r) -> Node (f n, map_tree f l, map_tree f r)

(*
9. Partition a List
Write a function partition that takes a predicate f and a list, and splits the list into two lists: 
one that satisfies the predicate and one that doesn’t.
*)
let rec partition f lst =
  match lst with
  | [] -> ([], [])
  | x :: xs ->
    let (acc1, acc2) = partition f xs in
    if f x then (x :: acc1, acc2)
    else (acc1, x :: acc2)


(* 
10. Zip Two Lists
Write a function zip that takes two lists and returns a list of pairs. 
If the lists are of unequal length, stop at the shorter one.
 *)
let rec zip lst1 lst2 =
  match (lst1, lst2) with
  | ([], _) -> []
  | (_, []) -> []
  | (x::xs, y::ys) -> (x,y) :: zip xs ys
(* 
11. Unzip a List of Pairs
Write a function unzip that takes a list of pairs and returns a pair of lists. 
*)
let rec unzip lst =
  match lst with
  | [] -> ([], [])
  | (x, y) :: t -> 
    let (xs, ys) = unzip t in
    (x:: xs, y::ys)



(* 
12. Find the Depth of a Tree
Using the binary tree type defined earlier, write a function tree_depth that calculates the depth of the tree.
*)
type tree =
  | Leaf
  | Node of int * tree * tree

let rec map_tree f t =
  match t with
  | Leaf -> Leaf
  | Node (n, l, r) -> Node (f n, map_tree f l, map_tree f r)

let rec tree_depth t =
  match t with
  | Leaf -> 0 
  | Node (n, l, r) -> 
    let left_depth = tree_depth l in
    let right_depth = tree_depth r in
    1 + (max left_depth right_depth)
  
  

(* 
13. Count Vowels in a String
Write a function count_vowels that counts the number of vowels in a string 
using pattern matching on characters.
*)
let rec count_vowels str =
  let is_vowel c = 
    match c with
    | 'a' |  'e' | 'o' | 'i' | 'u' | 'y' -> true
    | 'A' | 'E' | 'O' | 'I' | 'U' | 'Y' -> true
    | _ -> false
  in 
  let rec aux acc i =
    if i >= String.length str then
      acc 
    else 
      let count = if is_vowel str.[i] then acc + 1 else acc in
      aux count(i + 1)
    in aux 0 0
    
(* 
14. Parse Options
Write a function parse_option that takes a list of options (e.g., [Some 1; None; Some 3]) and 
returns a list of all non-None values.
*)
let rec parse_option lst =
  let rec aux acc lst = 
    match lst with
    | [] -> List.rev acc
    | None:: xs -> aux acc xs 
    | Some x :: xs -> aux (x :: acc) xs
    in 
    aux [] lst

(* 
15. Split a List in Half
Write a function split_half that splits a list into two halves. 
If the list has an odd number of elements, 
the extra element goes into the first half.
*)
let split_half lst =
  let len = List.length lst in
  let mid = (len + 1) / 2 in
  let rec aux i acc1 acc2 lst = 
    match lst with
    | [] -> (List.rev acc1, List.rev acc2)
    | x::xs -> 
      if i < mid then aux (i + 1) (x :: acc1) acc2 xs
      else aux (i + 1) acc1 (x :: acc2) xs
    in
    aux 0 [] [] lst
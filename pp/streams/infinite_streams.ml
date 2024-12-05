(* 
Basic Understanding
What is an infinite stream in functional programming? 
Write an OCaml implementation of a simple infinite stream that generates natural numbers starting from 0.
 *)
type 'a infstream = Cons of 'a * (unit -> 'a infstream)

let rec from n = Cons (n, fun() -> from (n+1))
let nats = from 1

(* 
Filter Stream:
Implement a function filter_stream that takes a predicate and an infinite stream, 
returning a new stream containing only elements that satisfy the predicate. *)
let rec filter_stream f (Cons(h, t)) = 
  if f h = true then Cons(h, fun() -> filter_stream f (t ()))
  else filter_stream f (t ())

(* 
Map Stream:
Implement a function map_stream that applies a given function 
to each element of an infinite stream 
and returns the resulting stream.
 *)
let rec map_stream f (Cons(h, t)) = Cons(f h, fun() -> map_stream f (t()))

(* 
Take N Elements:

Write a function take_n that extracts the first n elements 
from an infinite stream and returns them as a list.
*)
type 'a infstream = Cons of 'a * (unit -> 'a infstream)
let rec take_n n (Cons(h, t)) = 
    if n = 0 then []
    else h:: take_n (n-1) (t())

(*  
Fibonacci Stream:

Implement an infinite stream that generates Fibonacci numbers.
*)
type 'a infstream = Cons of 'a * (unit -> 'a infstream)

let rec fibs = 
  let rec aux a b = 
    Cons (a, fun() -> aux b (a + b)) in
    aux 0 1

let rec take_n n (Cons (h, t)) = 
  if n = 0 then []
  else h::take_n (n-1) (t())

let first_10_fibs = take_n 10 fibs

(*  
Prime Numbers Stream:

Create an infinite stream of prime numbers using the Sieve of Eratosthenes.
*)
type 'a infstream = Cons of 'a * (unit -> 'a infstream)
(* inf stream *)
let rec from n = Cons(n, fun() -> from(n+1))
(* filter *)
let rec filter f (Cons(h, t)) = 
  if f h then (Cons (h, fun() -> filter f (t())))
  else filter f (t())

(* non prime for soe *)
let rec soe (Cons(h, t)) = 
Cons (h, fun() -> soe (filter (fun x -> x mod h <> 0) (t())) )

let prmimes = soe (from 2)


(* 
Repeating Stream:

Write a function repeat that creates an infinite stream of a given element.
 *)

type 'a infstream = Cons of 'a * (int -> 'a infstream)
let rec repeating_stream n = Cons(n, fun x -> repeating_stream n)


 (* Zipping Streams:

Write a function zip that takes two infinite streams and combines them into a single stream of pairs.
 *)

type 'a infstream = Cons of 'a * (unit -> 'a infstream)
let rec zip (Cons (h1, t1)) (Cons (h2, t2)) =
  Cons ((h1, h2), fun () -> zip (t1 ()) (t2 ()))
(* Stream of Streams:

Create a stream of streams where the nth stream contains the natural numbers up to n.

*)

type 'a infstream = Cons of 'a * (unit -> 'a infstream)
let rec from n = Cons (n, fun() -> from (n+1))
let rec take_n n (Cons (h, t)) = 
  if n = 0 then []
  else h:: take_n (n-1) (t())

let rec first_n n = 
  let rec aux m = 
    if m = 0 then []
    else m :: aux (m-1)
  in List.rev (aux n)

let rec stream_of_streams = 
  let rec generate n = Cons (first_n n, fun () -> generate (n+1)) in generate 1

let rec take_streams n (Cons (h, t)) = 
  if n = 0 then []
  else h:: take_streams (n-1) (t())
(* 

Cycle Stream:

Write a function cycle that takes a finite list and 
produces an infinite stream that repeatedly cycles through the elements of the list.
*)
type 'a infstream = Cons of int * (unit -> 'a infstream)
let rec cycle lst =
  match lst with
  | [] -> failwith "Nope"
  | _ -> 
    let rec helper lst = 
      match lst with
      | [] -> helper lst (* Restart from beginning *)
      | x::xs -> Cons(x, fun() -> helper xs) 
    in helper lst

(* 

Converging Stream:

Write a function that generates an infinite stream 
converging to a specific value using a mathematical series (e.g., approximating π or e).

*)


(* 
Merge Sorted Streams:

Implement a function merge_sorted that merges 
two sorted infinite streams into a single sorted infinite stream.

*)
type 'a infstream = Cons of int * (unit -> 'a infstream)

let rec sort_stream (Cons(h, t)) = 
  (* stream of what? *)
  if h >= t then (Cons(t, fun() -> sort_stream (Cons(h, t))))
  else (Cons(h, fun () -> sort_stream (Cons(h, t))))
  

let rec merge_two (Cons(h1, t1)) (Cons(h2, t2)) = 
  let sort_1 = sort_stream (Cons(h1, t1)) in
  let sort_2 = sort_stream (Cons(h2, t2)) in
  let head (Cons(h,t)) = h in 
  let tail (Cons(h,t)) = t in
  (* compare two *)
  if head sort_1 >= head sort_2 
    then Cons( head sort_2, 
    fun() -> merge_two (sort_1) (tail sort_2()) ) 
  else Cons( head sort_1, 
  fun() -> merge_two (sort_2) (tail sort_1()))
    


(* 
Lazy Evaluation Debugging:

Write a function that prints the first 10 elements of an infinite stream to understand its behavior without fully materializing it.

*)

(* 
Performance:

Explain how to efficiently create and work with infinite streams. Discuss the trade-offs between laziness, memory usage, and computational efficiency.

*)

(* 
Error Handling:

What issues can arise when defining or working with infinite streams? Write an example of a problematic infinite stream and show how to handle it gracefully.

*)

(* 

Random Stream:

Write a function random_stream that generates an infinite stream of random integers within a given range.

*)

(* 
Stream-Based Computation:

Solve a real-world problem using streams. For example, use a stream to model a sequence of stock prices and compute a moving average.

*)

(* 
Event Simulation:

Create a stream that simulates events occurring at irregular intervals, such as customer arrivals in a queue.

*)
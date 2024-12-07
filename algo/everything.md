`same format as mt
cheatsheet, 1page, both sides, hand written
2/3 MC/TF, 1/3 short answer/write algos
more focus on stuff after mt (about 1/4 on stuff before mt)
emphasis on using algos to solve problems`

# Lecture 1. Algorithm Analysis

## Session Topics

• Why do we care? What are we doing here?
• Define algorithm
• Examine time efficiency and space efficiency
• Determine the basic operation for a given algorithm
represented in pseudocode
• Determine running time of an algorithm
• Define asymptotic notations (big-O)

## Why we learn algorithm

Algorithms are at the core of computer
programming
• There are many important, standard algorithms
• We want to design new algorithms and analyze
their efficiency

Important problem types
• Sorting
• Searching
• String processing
• Graph problems
• Combinatorial problems
• Numerical problems
• Optimization problems

Algorithm design techniques
• Brute force
• Divide and conquer
• Decrease and conquer
• Transform and conquer
• Space and time
tradeoffs
• Greedy approach
• Dynamic programming
• Iterative improvement
• Backtracking
• Branch and bound

## Definition

What is an Algorithm?
• Definition:
An algorithm is a sequence of unambiguous instructions
for obtaining a required output for any legitimate input
in a finite amount of time

• There is always more than one algorithm for the
same problem
• We care about several characteristics:
• Is it correct?
• Is it time-efficient?
• Is it space-efficient?

## Correctness

Will find work correctly?
• for any possible input? (how many are there?)
• within a finite amount of time?
• How would you argue this
rigorously?

## Time Efficiency

• Is find a time-efficient algorithm?
• Seems good
• To find the largest, you need to check each array
element exactly once

## Space Efficiency

• Is find a space-efficient algorithm? (amount of
memory )
• Again… it seems reasonable
• Two temp variables introduced

## Variation of the Problem

Variation of the problem
• What if you are guaranteed that A is pre-sorted?
• Is this find() algorithm still efficient?
• Could you do better?

Fib is a basic example of why we care about
algorithm efficiency
• A well thought out algorithm can run much faster
• There can be big variation in efficiency

```
NOT GOOD
Algo: fib( n )
if n ≤ 1
return n
else
return fib( n-1 ) + fib( n-2 )
```

```
BETTER
Algo: fib2( n )
F[0] ← 0; F[1] ← 1;
for i ← 2 to n do
F[i] ← F[i-1] + F[i-2]
return F[n]
```

## How to Determine Efficiency

idea: estimate efficiency before writing code
• What we know:

1. Running time (efficiency) of an algorithm depends on
   the input size
2. The total execution time for any algorithm depends
   primarily on the number of instructions executed
   • Different execution times of specific instructions is of
   secondary importance

- We define the basic operation of an algorithm as the
  statement that gets executed most frequently
  ◦ Tiebreakers: deepest inside the loop; which one is more
  “expensive”; or maybe sometimes we don’t care

## Basic Operations

The deepest
This is the fundamental concept we use to analyze algorithmic efficiency:
count the number of basic operations
executed for an input of size n

We don’t count instructions that are not basic
operations

```
1. Mystery1(n) // n > 0
2. S ← 0
3. for i ← 1 to n do
4. S ← S + i *  i // basic algorithm
5. return S
```

## Basic Operations: Tie-Breakers

1. Function calls (growing with N)
2. Function calls (constant time)
3. Key comparisons (comparing data)
4. Assignments (copying data)
5. Expression evaluations
   • Arithmetic tie-breakers:
6. Multiplication/division
7. Addition/subtraction
   • These are all more like guidelines than strict rules

SO FAR: we learned how to determine the running
time aka the efficiency of an algorithm
• Non-recursive algorithms only
• Count the statements, or the basic operations
• The result is a function of n (input size)

An algorithm for analyzing
algorithms?
• Given an algorithm (as input):
• Decide on the basic operation
• May require tie-breakers
• Count how many times the basic operation is
executed
• Set up summations
• Simplify to an expression (function) that depends on N
• This is the running time
• Determine big-O class of the running time function

Running times of algorithms are functions.

## Simplifying the sum

![alt text](image.png)

## Computing functions

Comparing functions
• Some functions are bigger than others
• What does “bigger” mean?
• We need a formalized way to talk about this

From earlier:

1. Efficiency of an algorithm depends on input size
2. Efficiency of an algorithm also depends on basic operation
3. Efficiency can be expressed by counting the basic operation

![alt text](image-1.png)

## Worst case, average case, best case

• Worst case:
• Most possible number of steps needed by an algorithm
• Average case:
• Number of steps needed “on average”
• Best case:
• Number of steps needed if you “get lucky” with a
particular input
• Consider the

• We will focus on worst-case analysis in this course
• Unless otherwise specified, you should always analyze
the worst case
• There are many situations where best case = worst
case
• Example: find the largest element in an unsorted list

Running time/efficiency can be
many different functions

## General strategy for analysis of non-recursive algorithms

From the textbook (p62):

1. Decide on a parameter indicating the input’s size.
2. Identify the algorithm’s basic operation.
3. Be sure the number of times the basic operation is executed depends only on the size of the input.
   • If it depends on some other property, the best/worst/average case efficiencies must be investigated separately
4. Set up a sum expressing the number of times the basic operation is executed.
5. Use summation algebra to find a closed-form expression for the
   sum from step 4 above.
6. Determine the efficiency class of the algorithm using asymptotic
   notations

## Asymptotic order of growth

Asymptotic order of growth
A way of comparing functions
• Big O (Pronounced “big oh”)
• Big Ω
• Big Θ

## Big-O

Big-O (formal definition)
Definition:
• a function f(n) is in the set O(g(n)) [denoted: f(n) ∈
O(g(n))] if there is a constant c and a positive integer n0
such that
f(n) ≤ c \* g(n) , for all n ≥ n0
i.e. f(n) is bounded above by some constant multiple of g(n)

Set of all functions whose rate of growth
is the same as or lower than that of g(n).
We also say “f(n) is bounded above by a
constant multiple of g(n)”
or (carelessly) just “f(n) is bounded by g(n)”
![alt text](image-2.png)
![alt text](image-3.png)

Big-O
• Simple Rule: Drop lower order terms and constant
factors

1. 50n3 + 20n + 4
2. 4n2 + 10
3. n(2n + 1)
4. 3log n + 1
5. 3log n + n
6. 1 + log6
7. 5! + 32
   ∈ O(n3)
   ∈ O(n2)
   ∈ O(n2)
   ∈ O(log n)
   ∈ O(n)
   ∈ O(1)
   ∈ O(1)

## Big Omega

![alt text](image-4.png)
Set of all functions whose rate of growth is the
same as or higher than that of g(n).
![alt text](image-5.png)

Big Omega
Definition:
• a function f(n) is in the set Ω(g(n)) [denoted: f(n)
∈ Ω(g(n))] if there is a constant c and a positive
integer n0 such that
f(n) ≥ c \* g(n) , for all n ≥ n0
• i.e. f(n) is bounded below by some constant
multiple of g(n)

## Big Theta

Big Theta
Definition:
• a function f(n) is in the set Θ(g(n)) [denoted: f(n) ∈
Θ(g(n))] if there are constants c1 and c2, and a
positive integer n0 such that
c2 g(n) ≤ f(n) ≤ c1 g(n) , for all n ≥ n0
• i.e. f(n) is bounded both above and below by constant
multiples of g(n)

![alt text](image-6.png)
Set of all functions that
have the same rate of growth as g(n).

![alt text](image-7.png)

## Summary of Notations

![alt text](image-8.png)

Summary of notations - intuition
• Big-O  execution will take at MOST that long
• Big-Ω  execution will take at LEAST that long
• Big-Θ  execution will take THAT long

In general…
• We will usually focus on Big-O
• Why?
• Focuses on worst case efficiency
• Most common when people talk about algorithms

Examples
What is the efficiency class of the following functions?
• 10n
• 5n2 + 20
• 10000n + 2n
• log(n) \* (1 + n)
O(n)
O(n2)
O(2n)
O(nlog(n))

Example 1
![alt text](image-9.png)
• Problem: find the max element in a list
• Input size measure:
• Number of list items, i.e. n
• Basic operation:
• Comparison

Example 2
• Problem: Multiplication of two matrices
• Input size measure:
• Matrix dimensions or total number of elements
• Basic operation:
• Multiplication of two numbers

![alt text](image-10.png)

Example 3: Element uniqueness problem
![alt text](image-11.png)
![alt text](image-12.png)

More practice problems
For each of the following problems, write an
algorithm and then determine:
a. its basic operation
b. basic operation count
c. if basic op count depends on input form

1. Computing the sum of a set of numbers
2. Computing n! (n factorial)
3. Checking whether all elements in a given array
   are distinct

# Lecture 2. Brute Force

## Agenda

• Brute force algorithms
• “Generate and test” subcategory
• Examples:
• A couple of sorting algorithms
• String matching
• Optimization problems

## Brute Force Technique

Brute force technique
• Direct, “obvious”, or straightforward algorithm
• The first thing you’d think of
• Nothing too clever
• No over-optimization
• “Just do it”

Important subcategory:
Exhaustive search
“Generate and test”:

1. Generate/consider all possible solutions
2. Test every one to see if it works
   • If only need one solution, break when you find it
   • May be looking for all solutions

• Advantage: easy to understand, implement
• Disadvantage:
• Maybe not the most efficient
• But you can get lucky
• Sometimes called a naïve approach
• But this is subjective and possibly misleading
• A better word would be “straightforward”

Brute force examples
• What is the brute force solution for these
problems:
• Search for a key value in a list
• Computing n!
• Computing an (a > 0, n is a nonnegative integer)
• Find the combination to a bicycle lock with 4 numbers
• Given an unsorted list of numbers, find the two that
have the largest product

## Selection Sort

Selection sort – general idea
• “Sorted part” and “unsorted part”
• At each iteration:
• Find the smallest item remaining in the unsorted part
• Move it to the end of the sorted part

Selection sort: idea
• Scan the whole array to find the smallest element.
• Swap it with the 1st element (A[0]).
• Scan A[2..n-1] for the smallest element
• Swap it with the 2nd element (A[1])
• Scan A[3..n-1] for the smallest element
• Swap it with the 3rd element (A[2])
• Generally: on pass i, find the smallest element in
A[i..n-1] and swap it with A[i].

![alt text](image-13.png)
![alt text](image-14.png)

Why is this brute force?
• Each main iteration involves a sequential search
(aka linear search) for the smallest remaining item

## Bubble Sort

Bubble sort – general idea
• “Sorted part” and “unsorted part”
• At each iteration:
• Run a “bubble” across the unsorted part
• The largest (remaining) element bubbles to the end
![alt text](image-16.png)
![alt text](image-17.png)
![alt text](image-15.png)

## String Matching

Pattern： compress
Text： We introduce a general framework which is suitable to
capture an essence of compressed pattern matching

The String Matching Problem
Input:

- Pattern: A string of m characters to search for
- Text: A longer string of n characters to search in
  Problem:
  Find a substring in the Text that matches the Pattern

Solution (in words)
Brute-force algorithm
![alt text](image-18.png)

1. Align pattern at beginning of text
2. Moving from left to right, compare each character of
   pattern to the corresponding character in text until
    all characters are found to match (successful search); or
    a mismatch is detected
3. While pattern is not found and the text is not yet
   exhausted, realign pattern one position to the right and
   repeat Step 2
   ![alt text](image-19.png)

Worst-case analysis
• There are m comparisons for each shift in the worst
case (inner loop)
• There are n-m+1 shifts (outer loop)
• So, the worst-case running time is:
O((n-m+1)*m)
• In the example on previous slide, we have (13-
4+1)*4 comparisons in total

## Travelin Salespoerson Problem

• A salesperson needs to visit n cities. You know the distance between any two
cities. Find the shortest path that visits each city exactly once and returns to the
starting city.
• Note that this has lots of applications in real life.
![alt text](image-20.png)

Brute force for “optimization
problems”
• Generate a list of all potential solutions to the
problem in a systematic manner
• Evaluate potential solutions one by one,
disqualifying infeasible ones, and keeping track of
the best one found so far
• When search ends, announce the solution(s) found

• Abstract model:
• A weighted graph.
• Hamiltonian circuit: a circuit that visits every node
exactly once
• Goal:
• Find lowest cost Hamiltonian circuit
![alt text](image-21.png)

TSP efficiency
• How many possible routes – for large n?
• Remember that since we are always starting and ending at a specific city (eg: a),
we only need to consider routes that start with ‘a’
• ie: we would consider a→b→d→c→a but not b→d→c→a→b
• this means there are only (n-1)! permutations to consider
• but we also notice that there are some duplicate routes, eg: a→b→d→c→a is
the same as a→c→d→b→a (it is just reversed)
• so we only consider one of them
• every route has a reverse path, so ...
• the brute force solution requires that we generate and compute the length of
(n-1)!/2 routes

TSP brute-force solution
for each permutation P of cities
for each city i in P
length ← length + weight(i,i+1)
if length < min
min ← length
minroute ← P
return minroute
Efficiency? (n-1)!/2 = O(n!)

## Knapsack Problem

• Input:
• weights: w1 w2 … wn
• values: v1 v2 … vn
• a knapsack of capacity W
• Goal:
• Find most valuable subset of the items that fit into
the knapsack
![alt text](image-22.png)
Knapsack problem
• Generate all possible subsets of the n items
• Compute total weight of each subset
• Identify feasible subsets
• Find the subset of the largest value

Efficiency?
Need to generate all subsets. For n
items, there are 2n subsets. So this is
an O(2n) algorithm.

Assignment problem
• Brute force algorithm:
• Check every combination of assignments
• Calculate the cost of each one
• Find the combination with minimum cost

for each permutation P of job assignments
totalcost ← sum of the job costs for P
if totalcost < mincost
mincost ← totalcost
minperm ← P
return minperm

Efficiency? Need to generate all permutations. For n
jobs, there are n! permutations. So this is
an O(n!) algorithm.

Comments on brute force
• Brute force (exhaustive-search) algorithms run in a
realistic amount of time only on very small inputs
• In many cases, exhaustive search or its variation is
the only known way to get an exact solution

Strengths
• wide applicability
• simplicity
• yields reasonable
algorithms for some
important problems
• matrix mult.
• sorting
• searching
• string matching

Weaknesses
• rarely yields the most
efficient algorithms
• some brute-force
algorithms are
unacceptably slow
• not as constructive as
some other design
techniques

Practice problem
You have a row of 2n discs of 2 colors, n dark and n light. They
alternate dark, light, dark, light, dark, and so on. You want to get all
the dark discs on the right hand side and all the light discs on the
left.
The only move you are allowed to make is to interchange two
adjacent discs.
![alt text](image-23.png)
(a) Design an algorithm that solves this problem
(b) Analyze the efficiency of your algorithm

# Lecture 3. Decrease and Conquer

Aside:
Programs/algorithms
as “black boxes”

How many edges in Kn?
• Recursive definition (algorithm):

ALGORITHM num_edges(int n)
// n is the number of vertices in a complete graph
// Return the number of edges in the graph
if n = 1
return 0
else
return (n-1) + num_edges(n-1)
endif
END

• num_edges(K37) = 36 + num_edges(K36)

Decrease and conquer
• Reduce problem instance to smaller instance of the
same problem and solve smaller instance
• I.e. Solve a smaller problem
• Extend solution of smaller instance to obtain
solution to original instance
• Extend, augment, enhance, adapt, adjust, …
• Sometimes this part is trivial
• Can be implemented:
• Top-down (recursive)
• Bottom-up (iterative)

## Top-down

![alt text](image-24.png)
top-down (recursive)
Factorial(n)
if n=0 or n=1 then
return 1
else
return n \* Factorial(n − 1)
![alt text](image-25.png)

## Bottom-up

Example: bottom-up (iterative)
Factorial (n)
F ← 1
for i ← 1 to n
F ← F \* i
return F
![alt text](image-26.png)

Three types of
Decrease and Conquer
• Decrease by a constant (usually by 1)
• Insertion sort
• Generating permutations
• Generating subsets
• Decrease by a constant factor (usually by half)
• Binary search
• Exponentiation by squaring
• Fake coin problem
• Variable-size decrease
• Euclid’s algorithm (we won’t have time)

## Decrease by a constant amount

![alt text](image-27.png)
Generating permutations
Example of “decrease by 1”
Example: To find all permutations of 3 objects
A, B, C
• First find all permutations of 2 objects, say B and C:
B C and C B
• Then insert the remaining object, A, into all possible
positions in each of the permutations of B and C:
ABC BAC BCA and ACB CAB CBA
• To find all permutations of n objects:

1. Find all permutations of n-1 of those objects
2. Insert the remaining object into all possible positions
   of each permutation of n-1 objects
   • Example: find all permutations of A, B, C
   ![alt text](image-28.png)

generatePerms (a1, a2, ..., an)
if n==1
// return “list” with one item a1
else // case where n > 1
PermsOfNMinus1 = generatePerms (a1, a2, ..., an-1)
initialize allPerms to {}
for each p in PermsOfNMinus1
insert an before a1 and add to allPerms
for i  1 to n-1
insert an after ai and add to allPerms
return allPerms

Generating subsets
Example of “decrease by 1”

In “lexicographic” order:
{},
{a}, {b}, {c}, {d},
{a,b}, {a,c}, {a,d}, {b,c}, {b,d}, {c,d},
{a,b,c}, {a,b,d}, {a,c,d}, {b,c,d},
{a,b,c,d}

Generating subsets: IDEA
To find all subsets of a set with N items:

1. Find all subsets of a set with N-1 of the items
2. Copy/clone the subsets
3. Insert the last item into all the copies
   ![alt text](image-29.png)

generateSubsets (a1, a2, ..., an)
if n==0
return “list” of just one set, the empty set {}
else // nonempty input i.e. n > 0
subsetList = generateSubsets (a1, a2, ..., an-1)
for each subset s in subsetList
clone s to create s’
insert an to s’
add s’ to subsetList
return subsetList

## Insertion Sort

Insertion sort
Example of “decrease by 1”

Sort algorithm idea:

1. Sort items A[0] through A[n-2]
   • This is a big step ... think of it as a subroutine
2. Find the spot where last item A[n-1] goes
3. Shift items over and drop in A[n-1]

![alt text](image-30.png)

Insertion sort
• Insertion sort (A[0..n-1])

1. Insertion sort (A[0..n-2])
2. Insert A[n-1] in its proper place among the sorted
   A[0..n-2]

![alt text](image-31.png)

InsertionSort(A,n) - RECURSIVE
1 if n > 1
2 InsertionSort(A,n-1)
3 key  A[n-1]
4 i = n-2
5 while i ≥ 0 and A[i] > key
6 A[i+1]  A[i]
7 i  i - 1
8 A[i + 1]  key

Insertion Sort (iterative)

1. InsertionSort(A[0..n-1])
2. for i ← 1 to n-1 do
3. v ← A[i]
4. j ← i-1
5. while j≥0 and A[j]>v do
6. A[j+1] ← A[j]
7. j ← j-1
8. A[j+1] ← v

Insertion sort and Selection sort:
Similarities
• "Sorted" and "unsorted" piles
• Each main iteration does two things:
• Choose item from "unsorted"
• Place item in "sorted"
• Number of main iterations is O(n)
• O(n2) overall (worst case)

Insertion sort and Selection sort:
Differences
• Selection sort: each main iteration
• "Choose from unsorted part" is O(n) (linear search)
• "Place into sorted part" is O(1) (it goes at the end)
• Insertion sort: each main iteration
• "Choose from unsorted part" is O(1) (choose first item)
• "Place into sorted part" is O(n) (shift the other items)

## Decrease by a constant factor

Make the problem smaller
by some constant factor
• Often the constant factor
is two, i.e, we divide the
problem in half
• Discard one or more of
the parts
Program F (n)
if n=BASECASE then
return (SomethingSimpleHere)
else
return (ExtendResultOrNot)
endif
END

## Binary Search

Example of “decrease by factor of 2”
i.e. solve a problem of size n/2

Example: binary search, key =7
![alt text](image-32.png)

• Binary Search works by dividing the sorted array
(i.e. the solution space) in half each time, and
searching in the half where the target should exist
• In other words, we eliminate half the input on each
iteration!
• It makes efficiency gains by ignoring the part of the
solution space that we know cannot contain a
feasible solution

binarySearch(a[], k, s, e)
if e < s
return not found
m ← floor((s+e)/2)
if k > a[m]
return binarySearch(a[], k, m+1, e)
else if k < a[m]
return binarySearch(a[], k, s, m-1)
else
return m

Binary search
• Example: Binary search, k=90
binarySearch(a[], k, s, e)
![alt text](image-33.png)
Call trace:

1. binarySearch(a, 90, 0, 20)
   1.1 binarySearch(a, 90, 11, 20)
   1.1.1 binarySearch(a, 90, 16, 20)
   1.1.1.1 binarySearch(a, 90, 16,17)
   1.1.1.1.1 binarySearch(a, 90, 17, 17)
   \*\*target found, returns

• Time efficiency
• Worst-case efficiency…
• C(n) = log2(n) + 1
• So binary search is O(log n)
• This is VERY fast: e.g., C(1000000) = 20
• Optimal for searching a sorted array
• Limitations: must be a sorted array

Binary search (recursive)
Example: Trace the values of s,e,m as the algorithm runs with different keys (k)
◦ Trace for k=81 (s=0, e=20 initially)
 iteration 1: s,e,m = 11,20,10
 iteration 2: s,e,m = -
,
-,15 ** target found
◦ Trace for k=22
 iteration 1: s,e,m = 0,9,10
 iteration 2: s,e,m = 5,9,4
 iteration 3: s,e,m = 5,6,7
 iteration 4: s,e,m = 6,6,5
 iteration 5: s,e,m = -
,
-,6 ** target found
◦ Note: largest number of iterations is 6, when

Binary search (iterative)
binarySearch(a[], s, e, k)
while s ≤ e
m ← floor((s+e)/2)
if k > a[m]
s ← m+1
else if k < a[m]
e ← m-1
else
return m
return not found

## Exponentiation by squaring

Example of “decrease by factor of 2”
i.e. solve problem of size n/2

Exponentiation by squaring
• Compute an where n is a nonnegative integer
• Brute-force algorithm requires n–1 multiplications
• We can do much better!

Example: calculating a38
a38  a19 _ a19
a19  a _ a9 _ a9
a9  a _ a4 _ a4
a4  a2 _ a2
a2  a \* a

Compute an where n is a nonnegative integer
For even values of n
For odd values of n
a n = (a n /2 )2
a n = (a (n-1)/2 )2 a

power(a, n):

1. if (n = 1)
2. return a
3. if (n % 2 = 0)
4. t = power(a, n/2)
5. return t\*t
6. else:
7. t = power(a, (n - 1) / 2)
8. return a * t*t

Efficiency of exp-by-sqr

O(logn)

## Fake coin problem

Example of “decrease by factor of 2”
i.e. solve problem of size n/2
(Bonus: alternate solution that is “decrease by factor of 3”)
Fake coin problem
• A mischievous banker gives you n identical-
looking coins, but tells you one is a fake (it is
made from a lighter metal). Luckily, you have a
balance scale, and can compare any two sets
of coins.
• Design an efficient Decrease by a Constant
Factor algorithm that finds the fake coin.
Key observation:
• Divide the pile in half
• Half on each side
of balance
• Lighter half has the fake
• We eliminate HALF the coins in one step

Picky details
• What if n is odd?
• Set aside one coin, then divide and weigh
• Lighter pile  fake coin is there
• Equal piles  fake coin is the extra (bonus!)
• Repeat the procedure until down to only 2 (or 3)
coins

Fake coin problem
• Assume that n=17. How many times will you need
to use the scale? Give two answers, one for the
best case and one for the worst case.
• Best case: 1 weight comparison is needed.
• Worst case: 4 weight comparisons are needed.

Algorithm FindFakeCoin(C[N])
if N = 1 then
return C[0] // just one coin – it's the fake
else
if N is odd
remove C[0] and set it aside
endif
divide remaining coins into 2 piles C1 and C2
weigh C1 vs. C2
if they weigh the same
return C[0]
else
discard the heavier pile
return FindFakeCoin(the lighter pile)
endif
endif
END

• This solution is O(log2n)
• It involves dividing the problem in half every time
• There is a better solution
• Runs in O(log3n)

Something to ponder
• The 3-pile solution is better by actual running time
• log3(n) is less than log2(n)
• But they are both O(logn)
• So how much “better” is the 3-pile solution?
• What is log3(100) vs. log2(100)?
• How about log3(1000000) vs. log2(1000000)?
• P.S. the 3-pile solution has a slightly trickier “base
case”

# Lecture 4. Divide and Conquer

## Agenda

• Divide and conquer algorithms
• Example: Count a key in an array
• How to analyze Divide and Conquer (the “Master
Theorem”)
• Example: Mergesort

generatePerms (a1, a2, ..., an)
if n > 1
smallerPerms = generatePerms (a1, a2, ..., an-1)
initialize allPerms to {}
for each p in smallerPerms
insert an before a1 and add to allPerms
for i = 1 to n-1
insert an after ai and add to allPerms
return allPerms

Divide and conquer algorithms
• Divide a problem into two or more smaller
instances
• Solve smaller instances (often recursively)
• Obtain solution to original (larger) instance by
combining these solutions

## Divide and conquer technique

Divide-and-conquer vs.
decrease-and-conquer
• Think of the fake coin problem (decrease-and-
conquer):
• We discarded half the coins at each step
• So we only worked on one “subproblem”
• For divide and conquer…
• You need to solve all of the subproblems

## Count a key in an array

• Problem:
• Count the number of times a specific key occurs in an
array.
• For example:
• If input array is A=[2,7,6,6,2,4,6,9,2] and key=6…
• ... should return the value 3.
• Design an algorithm that uses divide and conque
![alt text](image-34.png)

Algorithm CountKeys(A[], Key, L, R)
//Input: A[] is an array A[0..n−1]
// L & R (L ≤ R) are boundaries of the current search
//Output: The number of times Key exists in A[L..R]

1. if L = R
2. if (A[L] = Key) return 1
3. else return 0
4. else
5. leftCount = CountKey(A[], Key, L, (L+R)/2)
6. rightCount = CountKey(A[], Key, (L+R)/2+1, R)
7. return leftCount + rightCount

• Superficially, CountKeys resembles Binary Search
• Similar arguments (array bounds)
• Finding a midpoint
• What’s the difference?
• We have to process both sides
• In CountKeys, both sides must be searched
• In Binary Search, one half gets ignored

## Analysis of divide and conquer

Analyzing a divide-and-conquer
algorithm
• What matters:

1. Number of parts
2. Size of each part
3. Cost of combining subproblems
   a
   n/b
   F(n)

This expression is your new friend: nlogba

Algorithm CountKeys(A[], Key, L, R)
//Input: A[] is an array A[0..n−1]
// L & R (L ≤ R) are boundaries of the current search
//Output: The number of times Key exists in A[L..R]

1. if L = R
2. if (A[L] = Key) return 1
3. else return 0
4. else
5. leftCount = CountKey(A[], Key, L, (L+R)/2)
6. rightCount = CountKey(A[], Key, (L+R)/2+1, R)
7. return leftCount + rightCount

each subproblem is
half the size (n/2)
b = 2

additional computation
time is O(1)
F(n) = 1
![alt text](image-35.png)

What is the big-O
efficiency class of T(n)?
T(n) = a T(n/b) + F(n)
Compare
nlogba and F(n)
The bigger
one wins
f they’re equal:
O(nlogbalogn)

The Master Theorem
If T(n) = a T(n/b) + F(n)
![alt text](image-36.png)

Another version
If T(n) = a T(n/b) + F(n)
Master Theorem examples

![alt text](image-37.png)

Analyzing a decrease and conquer
algorithm
• Can use the same Master Theorem
• Fake coin problem:
• a=1 (we only solve ONE sub-part)
• b=2 (each part is n/2)
• F(n)=1 (no combination step = constant time)
•  Running time is T(n) = 1T(n/2) + 1
• nlogba == nlog21 == n0 == 1
• F(n) = 1
• They are equal
•  Final answer is O(nlogba logn) == O(logn)

## Mergesort

- mergesort sudocode
- The “combine partial solutions” part of mergesort
  is merging two sorted arrays into one
  • Example:
  • B = { 3 8 9 } C = { 1 5 7 }
  • merge(B, C) = { 1 3 5 7 8 9 }

- Mergesort running time
  T(n) = 2 T(n/2) + n
  T(n) ∈ O(n logn)

# Lecture 5. Transform and Conquer

## Transform and Conquer

Transform and Conquer
• This technique solves a problem by a
transformation to:
• a more convenient instance of the same problem (aka
instance simplification)
• a different representation of the same instance (aka
representation change)

• Instance simplification (pre-sorting)
• Checking element uniqueness in an array
• Computing the mode
• Searching (again)
• Representation change
• Heap
• Implementation
• Insert and Delete
• Construction
• Heap sort

Instance simplification
• Transform a problem into a more convenient
instance of the same problem

### Element uniqueness in an array

Problem: Determine if all elements in an array are
distinct
Brute force algorithm
• Compare all pairs of elements
• Efficiency: O(𝑛^2)
Instance simplification (presorting) approach:
• Part 1: sort by efficient sorting algorithm (e.g.
mergesort)
• Part 2: scan array to check pairs of adjacent elements
• Efficiency: O(nlogn) + O(n) = O(nlogn)

- sudocode

### Computing a mode

• The mode is the value that occurs most often in a given list of numbers.
• Brute Force:
• Scan the list
• Compute the frequencies of all distinct values
• Find the value with the largest frequency

- Efficiency (worst-case):
  • List has no repeated elements
  • ith element must be compared to i − 1 existing elements
  in the “Data” array
  • Creating auxiliary list (“Data” array):
  0 + 1 + 2 +⋯ + (𝑛𝑛 − 1) = O(𝑛𝑛2)
  • Finding max: O(n)
  • Efficiency (worst-case): O(𝑛𝑛2)

- pre-sorting
  Part 1: Sort the input
  • All equal values will be adjacent to each other
  Part 2: Find the longest run of adjacent equal
  values in the sorted array
  check the sudocode
  Efficiency:
  T(n) = Sorting time + Scanning time
  = O(n log n) + O(n)
  = O(n log n)

### Searching with presorting

Problem: Search for a given key K in an array A[0..n-1]
• Presorting-based algorithm:
• Part 1: Sort the array by an efficient sorting algorithm
• Part 2: Apply binary search
• Efficiency: O(n log n) + O(log n) = O(n log n)
• Good or bad? (Note that sequential search is O(n))
• Why do we have our dic

- Linear vs Binary Search
  • We know that Binary Search is better
  • O(N) vs. O(logN)
  • But Binary Search requires a sorted list
  • Sorting is O(NlogN)
  • Q: How does this help?
  • A: If we have to search MANY times

- Why is presorting better?
  • What if we have A[1000] and search a million
  times?
  • With Linear/Sequential Search:
  • Search is O(n)  500 steps per search (average)
  • 1,000,000 searches  500,000,000 steps
  • Total time: 500,000,000 steps
  • With Presort + Binary Search
  • Presort = O(nlogn) = 1000\*10 = 10,000 steps
  • Search is O(logn)  10 steps per search (max)
  • 1,000,000 searches  10,000,000 steps
  • Total time: 10,010,000 steps
  • Presort+BinarySearch is about 50x better
  • Bigger input  even MORE better!

- Transform and Conquer
  • Previous examples:
  • Instance simplification
  • More specifically, pre-sorting
  • Next example:
  • Representation change

### Representation change: Heaps and Heapsort

- Sample problem
  • You're running a hospital ER
  • Patients are coming in with different priority

- We need two operations
  • Insert()
  • Add a new person to the waiting room
  • Each person has a designated priority
  • deleteMax()
  • Determine the person with the highest priority
  • Remove them from the waiting room

- Simple implementations
  • ArrayList
  • Insert: O(1)
  • deleteMax: O(n)
  • SortedArrayList
  • Insert: O(logn + n) = O(n)
  • deleteMax: O(1)

- Representation change
  • Idea:
  • Given an array
  • Transform to a new data structure
  (Make a “heap” out of it)
  • Efficiency of heap:
  • Insert an item: O(logn)
  • deleteMax: O(logn)

- Heap definition
  • Almost complete binary tree
  • filled on all levels, except last, where filled from left to
  right
  • Every parent is greater than (or equal to) children

- Heap characteristics
  • Max value is in the root
  • Heap with N elements has height = floor(log2 N)

- Heap implementation
  Use an array: no need for explicit parent or child pointers.
  • Parent(i) = floor(i/2)
  • Left(i) = 2i
  • Right(i) = 2i + 1

- Heap insertion
  • Insert into next available slot
  • Bubble up until it's heap ordered (“heapify”)
  Efficiency is O(log n)

- Delete max from heap
  • Exchange root with “last” leaf (bottom-most, right-
  most)
  • Delete element
  • Bubble root down until it's heap ordered
  Efficiency is O(log n)

- Heaps – RECAP
  • Previously:
  • Heap properties (structure & values)
  • Array vs. tree representation
  • Insert & deleteMax algos (both are O(logn))
  • Constructing a heap of N elements
  • “Straightforward”: For each item x in the input, call H.insert(x)
  • Today:
  • Another way to “build” a heap
  • Heapsort algorithm

- Heap construction
  • What if we are given an entire array?
  • How can we transform it into a heap?
  • Step 0: Initialize the structure with keys in the order
  given
  • (Done already)
  • Step 1: Starting with the last (rightmost) parental
  node, fix the heap rooted at it, if it doesn’t satisfy
  the heap condition: keep exchanging it with its
  largest child until the heap condition holds
  • Step 2: Repeat Step 1 for the preceding parental
  node

- Complexity of heap construction
  • ~ n/2 “parental” nodes  O(n)
  • logn steps to fix each node  O(logn)
  • Overall  O(nlogn)

### Heapsort

• How can we use a Heap to sort an arbitrary array?
• Stage 1: Transform the array into a heap (Construct a
heap)
• Stage 2: Call deleteMax N times to get all array elements
in sorted order

- Analysis of Heapsort
  • Stage 1: Build heap for a given list of n keys
  • O(nlogn)
  • Stage 2: Repeat operation of root removal n times
  (fix heap each time)
  • O(nlogn)

# Lecture 6. Space/time Trade-offs

- Space/time tradeoffs
  • Space refers to the memory consumed by an
  algorithm to complete its execution
  • Time refers to the required time for an algorithm to
  complete the execution
  • The best algorithm is one that
  • Requires less memory
  • AND takes less time
  • We have to sacrifice one at the cost of the other.
  • If space is our constraint, then we have to choose an
  algorithm that requires less space at the cost of more
  execution time. (example: Bubble Sort, Selection Sort)
  • If time is our constraint then we have to choose an
  algorithm that takes less time to complete its execution at
  the cost of more space. (example: MergeSort)

- Types of space/time tradeoffs

1. Input enhancement: preprocess the input to store
   some info to be used later in solving the problem
   • Comparison Counting Sort
   • Distribution Counting Sort
   • String Matching (improved algorithm)
2. Pre-structuring: use extra space to facilitate faster
   access to the data
   • Hashing
   • Hash Function
   • Collision Handling
   • Efficiency of Hashing

- Comparison Counting Sort
  • Idea: for each element of a list to be sorted, count
  the total number of elements smaller than this
  element and record the results in a table.
  check psudocode

- Efficiency of CCS
  • It’s O(n2)
  • Of course we know a couple of algorithms that are
  O(nlogn): MergeSort and HeapSort

- Distribution Counting Sort
  • Suppose we need to sort an array with a “small” set
  of known values
  • Idea: count how many of each number...
  • ...and determine the distribution from that
  • three 5’s  positions 0 to 2
  • two 6’s  positions 3 to 4
  • two 7’s  positions 5 to 6
  • five 8’s  positions 7 to 11 (11 is n-1)
  check psudocode

  - Loop 1: initialization
  - Loop 2: count
  - Loop 3: compute running sum
  - Loop 4: re-arrange

- Efficiency of Distribution Counting Sort
  • If the range of input values is roughly <= the
  number of input values
  • … then this algorithm is O(n)
  • This is really, really good!
  • But it is a special-purpose algorithm
  • Significant constraint on the range of input values

- String Matching: reminder
  • Pattern: a string of m characters to search for
  • Text: a (long) string of n characters to search in
  • Brute force algorithm:
  • Align pattern at beginning of text
  • Moving L-R within pattern, compare pattern to text until
  • All characters are found to match (successful search); or
  • A mismatch is detected
  • While pattern is not found and the text is not yet
  exhausted, shift pattern one position to the right and
  repeat step 2.
  • Time Complexity: O((n-m+1) × m)

- Input Enhancement in String Matching
  • How can we improve string matching by using the
  concept of input enhancement?
  • Useful observation: Whenever we have a
  mismatch, maybe we can shift the pattern over by
  more than one character before comparing again

- String Matching: Key Observation
  Consider, as an example, searching for the pattern
  BARBER in some text. Here is a moment in time:
  • When a mismatch occurs, look at the Text character
  that is aligned with the rightmost character of P

- String Matching: Four cases
  • Text char c never appears in the Pattern
  • Text char c appears in the Pattern but not last
  • Text char c appears last in the Pattern but only that
  one time
  • Text char c appears last in the Pattern and other
  times

- The Strategy
  • How can we use this observation for input
  enhancement?
  • Strategy:
  • Create a “shift table”
  • One entry for each possible value in the input alphabet
  • Shift table will indicate the number of positions to shift
  the pattern

- The Shift Table
  • How to construct the shift table:
  • it will have a size equal to the number of elements in the
  input alphabet (so we have to know this in advance!)
  t(c) =
  distance from c’s rightmost occurrence in pattern
  among its first m-1 characters to its right end
  pattern’s length m, otherwise
  • Example:
  • assume our alphabet is {A B C D E F G H I J}
  • assume our pattern is IDIGDAB (m=7)
  • When a mismatch occurs, what character is aligned with
  our pattern?

- You know about HashMaps
  • Map.put(key, value)
  • value = Map.get(key)
  Today we are looking inside these boxes.

- Fast Storage of Keyed Records
  information, based on an arbitrary key
  eg: key = A00043526 value = Jimmy
  Let’s consider traditional data structures ...
  Array: How would you use an array (or arrays) to store this
  • use either 2 1D arrays or 1 2D array or an array of objects
  • store key in a sorted array (for fast retrieve)
  • use the second array (or column) to store the record or a pointer to the record ... or ...
  • alternatively, create an object ‘Employee’, and store in an array of

- Using Sorted Array
  ...

- What if we use an unsorted Array:
  • Insertion will be much faster – O(1)
  • Search, retrieve will be slower – O(n)
  • Deletion will be the same O(n)
  • So how to get better performance ... ?
  • Hashing

- Hashing
  • Each item has a unique key.
  • Use a large array called a Hash Table.
  • Use a Hash Function that maps keys to an index in
  the Hash Table.
  f(key) = index
  Common hash function for
  numerical keys: “mod m”
  • What do we do if our key is not a number?
  • answer: map it to a number!
  • Example
  assume m=5
  Insert into hash table (Emily, 604-6321)
  Sample hash function for string keys:
  h ← 0 // input is a string S of length s
  for i ← 0 to s-1 do // ci is the char in ith posn of S
  h ← h + ord(ci) // ord(ci) is the relative posn
  // of ci in the alphabet
  hashcode ← h mod numBuckets // map sum of posns into range
  the actual hashcode depends on the number of buckets
  Collisions occur when different keys are mapped to the
  same bucket

- Collision Handling
  Two strategies to handle collisions:

1. Separate Chaining
2. Closed Hashing

- Collision Handling: Separate Chaining
  • Each bucket in the table points to a list of entries that map
  there

- collision handling Strategy 2: Closed Hashing
  with Linear Probing
  • It works like this:
  • compute the hash
  • if the bucket is empty, store the value in it
  • if there is a collision, linearly scan for next free bucket
  and put the key there
  • note: treat the table as a circular array
  • Note: important - with this technique the size of
  the table must be at least n (or there would not be
  enough room!)

- Linear Probing
  • Use the hash function h(i) = i mod 10
  • Draw the hash table resulting from inserting
  following key and values:
  (44, mojo)
  (12, buzz)
  (13, iggy)
  (88, flem)
  (23, sue)
  (16, vern)
  (22, sami)

- Efficiency of Hashing
  What is the efficiency of the hashtable structure?
  • insert(key, value) ... is (usually)
  • value ← get(key) ... is (usually)
  • delete(key) ... is (usually)
  • Warning: there could always be a degenerate case, where
  (almost) every insert causes a collision to be handled. We
  could end up with O(n) for each operation.
  →conclusion : implementation of the hashing function is
  important
  →it must distribute the keys evenly over the buckets

- Hash Functions
  • the efficiency of hashing depends on the quality of
  the hash function
  A “good” hash function will

1. distribute the keys uniformly over the buckets
2. produce very different hashcodes for similar data
   • hashing of numbers is relatively easy, as we just
   distribute them over the buckets with
   key mod numBuckets

- Hashing Strings
  • most keys are Strings, and Strings are a bit trickier
  • consider the simple algorithm:
  h ← 0
  for i ← 0 to s-1 do
  h ← h + ord(ci) // ord(ci) is the posn of char i
  code ← h mod numBuckets
  • Is that a good hash function?
  • sample: assume numBuckets = 99
  • hash("dog") = 26
  • hash("god") = 26
  • hash("add") = 9
  • hash("dad") = 9

- Better String Hash Function
  • a better hashcode algorithm for strings
  alpha ← |alphabet| // size of the alphabet used
  h ← 0
  for i ← 0 to s-1 do
  h ← h + (ord(ci) \* alpha^(i))
  code ← h mod numBuckets
  • Assuming alpha = 128 (number of ascii codes)
  • Assuming numBuckets = 99
  • dog = 89
  • god = 44
  • add = 16
  • dad = 31

# Lecture 7. Data Structures and Graphs

## Fundamental Data Structures

- Data Structures
  • A data structure is a particular way of storing and
  organizing data
  • Data structures and algorithms are often deeply
  interconnected
  • The way you organize data affects the performance of
  your algorithm
  • We’ve mostly been using arrays … so far
  • Linear Data Structures
  • Array
  • Linked list
  • Stack
  • Queue
  • Set
  • Dictionary (Map)
  • Tree
  • Graph

- Arrays
  • A sequence of n items of the same type, accessed by
  an index
  • The good:
  • Each item accessed in same constant time
  • The bad:
  • Size is fixed
  • Insertion / deletion in an array is time consuming – all the
  elements following the inserted element must be shifted
  appropriately

- Linked Lists
  • (singly) A sequence of zero or more elements called
  nodes, consisting of data and a pointer
  • (doubly) Pointers in each direction
  • Linked lists provide two key advantages over arrays
  • Dynamic size
  • Ease of insertion/deletion
  • Linked lists have some drawbacks:
  • Random access is not allowed

- Stack
  • Like a stack of plates
  • Last-in-first-out (LIFO)

- Operations on a stack
  • Insert operation is called Push
  • Delete operation is called Pop
  • Examining the top item is Peek
  • Example application:
  • Analysis of languages (e.g. properly nested brackets)
  • Properly nested: (())
  • Wrongly nested: ())(()

- Algorithm CheckBalancedParenthesis(expr)

1. n = length(expr)
2. Create a stack s
3. for i = 0 to n-1 do
4. if (expr[i] is '(' ) do
5. s.Push(expr[i])
6. else if (expr[i] is ')' )
7. if (s is empty) or
   (s.Peek() does not pair with expr[i])
8. return False
9. else
10. s.Pop()
11. if (s is empty)
12. return True
13. else
14. return False

- Abstract Data Type
  • Often a data structure is closely associated with a
  set of available operations
  • Data structure + operations = abstract data type
  • From an OOP perspective, think about members
  (methods) of a class
  • Example 1: priority queue
  • Underlying implementation was a heap
  • Operations were Insert and deleteMax
  • Example 2: stack
  • Operations are push, pop, peek

- Queues
  • Like a line-up
  • First-in-first-out (FIFO)

- Operations on a queue
  • Adding to the queue is Enqueue
  • Removing from the queue is Dequeue
  • The top/front element is the Head (sometimes
  there is a “Peek” method)

- Set
  • Like a set in math, e.g. {1, 2, 3, 4}
  • Sets cannot contain duplicate items
  • Operations on a Set:
  • Add an item to it
  • Remove an item from it
  • Check if an item is in it
  • Iterate over it (loop based on all items, one-by-one)

  - In java
    • Different ways to implement a set
    • HashSet
    • Faster implementation, but it is unordered
    • TreeSet
    • Slower, but the items are available in order

- Map (as a hash table)
  • A Map is a lookup table that takes a key and returns a value
  • the most common implementation is as a hashtable (hashmap)

## Graphs

• G = (V, E)
• V is a set of vertices
• E is a set of edges
• Connected graph
• A graph where there is a path available between any two vertices
• Cyclic graph
• A graph containing at least one cycle
• Acyclic graph
• A graph containing no cycles
• Tree
• Any connected + acyclic graph
• Complete graph
• Every pair of vertices is connected by an edge
• Weighted graph
• Every edge has an associated value

- Trees
  • Connected, acyclic graphs
  • Usually we think of trees as having a root
  • Representing data in a tree can speed up your
  algorithms in many natural problems

- Representation of graphs
  • Two common ways to represent graphs:
  • Adjacency matrix
  • |V| x |V| matrix
  • Cell i, j represents an edge from vertex i to j
  • Adjacency lists
  • |V| linked lists – one for each vertex, showing all the
  neighbours of that vertex

- Representation: Adjacency Matrix
- Representation: Adjacency List
- Representing Graphs

1. Adjacency matrix
   • Or Weight Matrix for weighted graphs
2. Adjacency lists
   • A list of vertices connected to each vertex
   • Which one to use?
   • Depends on the nature of the graph (sparse or not)
   • Depends on the algorithm

## Graph Algorithms

- Graph Traversal
  Many real-world problems require processing of each
  vertex (or edge) in a graph
  • Routing a message on a network
  • Web crawling
  • Social networking
  • Garbage collection
  • Solving puzzles

- Graph Travel Algorthms
  • Graph traversal algorithms give a method for
  systematically processing all vertices
  • Two approaches:
  • Depth-First Search (DFS)
  • Breadth-First Search (BFS)
  Basic idea: "visit" all the vertices, one at a time,
  marking them as we visit them

- Depth-first search(DFS)
  • Think about how you might try to find your way
  through a maze
  • Visits all vertices by always moving away from the
  last vertex visited (if possible)
  • Backtracks at “dead-ends” (no adjacent, unvisited
  vertices)
  • Implementation often uses a stack of vertices being
  processed
  • Follows a tree-like route throughout the graph

  • To track the progress of the algorithm we use a stack
  • When we make a recursive call, e.g. dfs(v), we push v onto
  the stack
  • When v is a dead-end (i.e. no more neighbors to visit) it is popped off the stack
  • Our convention: break ties for “next neighbor” by using some natural order
  • Typical results from running DFS can be:
  • List of vertices in order visited
  • List of vertices in order of “dead-ends” (when popped from
  stack)
  • DFS Tree – tree containing all the edges that were used to
  visit nodes
  • Unused edges of G (edges not in DFS tree) are called “back edges”

  - psudocode
    Algorithm Depth_First_Search(Graph G)
    // Graph G = {V,E}
    initialize visited to false for all vertices
    for each vertex v in V
    if v has not been visited
    dfs_helper(v)
    function dfs_helper(Vertex v)
    visit node v
    for each vertex w in V adjacent to v
    if w has not been visited
    dfs_helper(w)

- Common Uses of DFS
  • Find a spanning tree of a graph
  • Find a path between two vertices v and u
  • Find a path out of a maze
  • Determine if a graph has a cycle
  • Find all the connected components of a graph
  • Search the state-space of problems for a solution
  (AI)
  • Many more!

- Efficience of DFS
  • The basic operation is the if statement in dfs_helper():
  for each vertex w in V adjacent to v
  if w has not been visited
  dfs(w)
  • Each time dfs_helper() is called, this loop examines all the neighbors of some vertex v … eventually it looks at ALL the neighbors of ALL the vertices
  • Therefore the number of basic operations depends on the data structure used to implement the graph
  • Basically we need to visit each element of the data structure exactly once. So the efficiency must be:
  • O(|V|2) for adjacency matrix
  • O(|V|+|E|) for adjacency lists

  - Whch is better?
    • O(|V|2)
    • O(|V|+|E|)

- Breadth-first search (BFS)
  • Recall the “trick” where we used an array to store a
  (very specific type of) binary tree (a heap).

  • Visit all neighbors “the same distance” from
  starting vertex
  • Visit immediate neighbors first
  • Then the neighbors of all those vertices
  • Etc.
  • Instead of a stack, BFS uses a queue
  • Follows a tree-like route throughout the graph, but
  perhaps a different tree than DFS

  - dfs psudocode
    • Uses a queue (FIFO) to determine which vertex to visit next
    • Edges that are in G but not in the resulting BFS tree are called
    “cross-edges”
    Algorithm Breadth_First_Search(Graph G)
    // Graph G = {V,E}
    initialize visited to false for all vertices
    for each vertex v in V
    if v has not been visited
    bfs_helper(v)
    function bfs_helper(Vertex v)
    visit node v
    initialize a queue Q
    add v to Q
    while Q is not empty
    for each w adjacent to Q.head
    if w has not been visited
    visit node w
    add w to Q
    Q.dequeue()

  • Same efficiency as DFS:
  • Adjacency matrix: O(|V|2)
  • Adjacency list: O(|V|+|E|)
  • Yields just one ordering of vertices (order
  added/deleted from queue is the same)
  • Whereas with DFS, the order that vertices are visited
  may be different from the order they get finished
  (become dead-ends)

- BFS applications
  • Really the same as DFS
  • Sometimes one or the other may be better for
  specific problems

## Some problems solvable with graph traversal

Problem 1: Spanning Tree
• Given a connected graph G, find a spanning tree T
• This is a straight-up application of BFS (or DFS)
• Build a new graph (the spanning tree) as we go
• Initialize a new graph T
• Each time we visit a vertex, add the edge we used to T
• BFS or DFS?
• BFS usually gives shorter paths between vertices

Problem 2: Solving a Maze
• Represent maze as a graph
• Nodes for start, finish, intersections, and dead-ends
• Find a path from start to finish
• BFS or DFS?
• If interested in end-result:
• BFS will find the shortest total path
• If actually walking while solving:
• DFS tends to result in less actual walking
• BFS backtracks to parent nodes too often

Problem 3: Shortest Path
• Find the shortest path between two vertices u and
w
• BFS or DFS?
• BFS will find a shortest path
• DFS will find a path – maybe not the shortest one
• Idea of algorithm (and why it works):
• First, use bfs(u) to create a spanning tree T with u as the root.
Note that all paths that appear in T are the shortest paths
from u to their respective vertices
• Then, use DFS on T to find a path from u to w (as in the maze
problem)

Problem 4: Determine
Connectivity
• Determine if a graph is connected
• BFS or DFS?
• Either will work
• Think about this yourself!
• What modification(s) do you need to make to the
algorithm to answer this question?

## Graph Algorithms: Binary tree traversal

- Tree traversal
  • Traversing a tree means to visit all of the nodes of
  the tree
  • We’ve already seen DFS and BFS (for graphs)
  • Here are a few traversals specific to binary trees:
  • Preorder – root before the children
  • Inorder – root between the children
  • Postorder – root after the children

- Preorder traversal

1. Visit the root
2. Traverse the left subtree
3. Traverse the right subtree

- Inorder traversal

1. Traverse the left subtree
2. Visit the root
3. Traverse the right subtree

- Postorder traversal

1. Traverse the left subtree
2. Traverse the right subtree
3. Visit the root

- Preorder traversal
  • Is when the path
  passes the LEFT
  side of each
  node

- Inorder traversal
  • Is when the path
  passes the
  BOTTOM of
  each node

- Postorder traversal
  • Is when the path
  passes the RIGHT
  side of each
  node

- Pseudocode
  Algorithm preOrder(Node N)
  if N != null
  Print N.value
  preOrder(N.leftChild)
  preOrder(N.rightChild)

  Algorithm inOrder(Node N)
  if N != null
  inOrder(N.leftChild)
  Print N.value
  inOrder(N.rightChild)

  Algorithm postOrder(Node N)
  if N != null
  postOrder(N.leftChild)
  postOrder(N.rightChild)
  Print N.value

- Fun facts about pre/in/postorder
  • Given pre + in, you can reconstruct the tree
  • (and also determine postorder)
  • Given post + in, you can reconstruct the tree
  • (and also determine preorder)
  • Given pre + post, you can only sometimes
  reconstruct the tree
  • For you to ponder: under what condition(s)?

- DFS algorithm
  • “Visit node v” means doing whatever you need to do at each node
  Algorithm Depth_First_Search(Graph G)
  // Graph G = {V,E}
  initialize visited to false for all vertices
  for each vertex v in V
  if v has not been visited
  dfs_helper(v)
  function dfs_helper(Vertex v)
  visit node v
  for each vertex w in V adjacent to v
  if w has not been visited
  dfs_helper(w)

• Uses a queue (FIFO) to determine which vertex to visit next
• Edges that are in G but not in the resulting BFS tree are called
“cross-edges”

Algorithm Breadth_First_Search(Graph G)
// Graph G = {V,E}
initialize visited to false for all vertices
for each vertex v in V
if v has not been visited
bfs_helper(v)
function bfs_helper(Vertex v)
visit node v
initialize a queue Q
add v to Q
while Q is not empty
for each w adjacent to Q.head
if w has not been visited
visit node w
add w to Q
Q.dequeue()

# Lecture 8 and 9. Solving Problems with Graph Algorithms

Two strategies

1. Modify a known graph algorithm
   • Technically we have already done this
   • DFS and BFS in class notes did not perform output
   • But we tracked it in the examples
2. Use a known graph algorithm as a black box
   • Black box needs input
   • Black box gives output

- Example: Connected components
  • Problem: Given a graph G, how many connected
  components does G have?
  • Strategy 1: Modify a known graph algorithm
  • Solution idea: Use either DFS or BFS
  • Add a counter to the “main loop”
  • Count how many times (from main) the helper function
  is called
  • Return the counter

- Example 2: Count map regions
  • A board game is played on hex tiles.
  • Tiles are drawn at random from a large supply.
  • Adjacent tiles of the same colour make up a region.
  • Input data is a list of the colours for all tiles:
  • colour(0,0) = red
  • colour(4,4) = aqua
  • Problem: determine how many
  regions are on the map.
  • This map has 38 regions 

- Solution idea
  • Strategy 2: Use the “connected components”
  algorithm as a black box
  • We need to construct a clever graph – just the right
  graph
  • It will encapsulate or model or represent our input
  problem in some way

- Finding the right graph
  • For a graph we need vertices and edges
  • Vertices represent things and edges represent
  relationships between things
  • The things we have are tiles
  • Idea: represent each tile as a vertex
  • Every vertex “label” will be a point (the grid location)

- Every tile is a vertex

- Now how about edges?
  • Idea: Connect vertices of the same colour

- Idea 2: Same colour AND adjacent

- The Solution
  • Step 1: Define a Graph G=(V, E) as follows:
  • The vertices of G are the tiles of the map; each is
  represented by a grid location aka point (0,0) to (m,n)
  • There is an edge between two vertices u and v iff
  • u and v have the same colour AND
  • u and v are in adjacent locations
  • Step 2: Run “Count Connected Components” on G
  • Step 3: The output of step 2 is the final answer

- Strategy 2 (using a graph
  algorithm as a black box)
  • You MUST specify what is the input (usually a
  graph, maybe other info)
  • You MUST specify how the output (of the graph
  algorithm) determines the answer to the problem

### Graph Algorithms: Topological sorting

- Directed acyclic graphs (DAGs)
  • A directed graph is a
  graph whose edges are
  directional or one-way
  • A directed acyclic graph is a directed graph that
  contains no cycles

- Topological sort problem
  • Given a set of tasks with dependencies (precedence
  constraints), e.g., “task A must be completed
  before task B”, …
  • … find a linear ordering of the tasks that satisfies all
  dependencies

- Example: Getting dressed
  • Suppose you need to wear all these items:
  • Belt
  • Jacket
  • Pants
  • Shirt
  • Shoes
  • Socks
  • Suspenders
  • Tie
  • Underwear
  • Some of these items must come before others
  • Socks before shoes
  • Shirt before suspenders
  • Pants before
  suspenders
  • Pants before shoes
  • Pants before belt
  • Shirt before tie
  • Shirt before jacket
  • Suspenders before
  jacket
  • Belt before jacket
  • Tie before jacket
  • Underwear before
  pants

- Represent the problem as a graph

1. V = vertices are the items (tasks)
2. E = edges are the dependencies (constraints)
   between tasks
   • an edge (v → w) means:
   • w is dependent on v, OR (in other words)
   • Task v comes before task w

- Topological Sort Algo 1:
  Use Depth First Search

1. Apply DFS to G
   • Starting at any vertex
   • No, really: ANY vertex
2. The order in which vertices become dead ends is
   the reverse of a topological sort order
   • Why?

- Example
  • Assume you have a set of 6 tasks (a, b, c, d, e, f)
  with the following dependencies:
  • a must be done before b, e, f
  • b must be done before c
  • d must be done before b and c
  • e must be done before d
  • f must be done before c and e
  • Step 1: Construct a directed
  graph to represent the problem
  (verify it is a DAG)
  • Step 2: Apply DFS
  Order vertices
  become dead ends:
  c b d e f a
  • Step 3: Reverse this to get topological sort order:
  a f e d b c

- TopoSort Algorithm 2:
  Decrease (by 1) and conquer
  • Key observation:
  • If a vertex v in the dependency graph G has no incoming
  arrows (i.e. in-degree(v) == 0), then v does not have any
  dependencies
  • It follows that any v that does not have dependencies is
  a candidate to be visited next in topological order

- Idea of the algorithm
  • Identify a v∈V that has in-degree=0
  • Delete v and all edges coming out of it
  • Repeat until done
  • The topological order is the order the vertices are
  deleted
  • If there are v∈V, but no v has in-degree=0, the
  graph G is not a DAG (no feasible solution exists)

- Algorithm details
  • Use a set to store the candidate vertices
  • I.e. the vertices with in-degree = 0
  • Any ordered set will do, e.g. TreeSet.
  • Use an ordered list to store the delete order
  • Any list type will do, e.g. ArrayList, always adding to the
  end

- TopoSort “Decrease by one”
  pseudocode
  Algorithm TopoSort(G)
  create an empty ArrayList A
  create an empty TreeSet Candidates
  add all v with inDegree=0 to Candidates
  while Candidates is not empty
  v = Candidates.first()
  add v to A
  for each vertex w adjacent to v
  remove edge (v,w) from G
  if w has inDegree=0
  add w to Candidates
  remove vertex v from G
  if there are no vertices remaining in G
  solution is in A
  else
  no solution exists

### Greedy Algorithms

Always make the choice
that looks best right now

- Making Change
  • Imagine you’re a shop clerk giving change and you
  want to use the smallest number of coins
  • Strategy:
  • Always select the biggest feasible
  coin
  • Example: 37 cents
  • 1 quarter (need 12 more cents)
  • 1 dime (need 2 more cents)
  • 2 pennies (2 what?)

  - psudocode
    Algorithm MakeChange(N)
    sum = 0
    coins = {} // set of coins to be returned
    while sum < N do
    choose the largest coin X with value <= (N-sum)
    sum += X.value
    coins += {X}
    endwhile
    return coins
    END

  - puzzle
    • Make a “smaller” counterexample

  • What if your coins were:
  • And you had to make **x** cents?
  • I.e., find a,b,c,x so that the greedy algorithm gives a
  3-coin answer, even though a 2-coin answer exists

- Moral of the story
  • Greedy algorithms do not always give optimal
  general solutions to problems
  • But sometimes they do

- Optimization problems and
  decision problems
  • An optimization problem is one in which you want
  to find not just any solution, but the best solution
  • As opposed to decision problem – “does a solution
  exist?”
  • Decision problem has a yes/no answer
  • Optimization problem is about minimizing or maximizing
  • Greedy algorithms attempt to solve optimization
  problems

- Remember the Knapsack problem
  • Optimization version:
  • Given N items with weights + values, and a knapsack
  with carrying capacity W, what is the greatest overall
  value of stuff the thief can steal?
  • Decision version:
  • Given N items with weights + values, and a knapsack
  with carrying capacity W, can the thief steal $V worth of
  stuff?

- Greedy algorithms
  • For solving optimization problems
  • Construct a solution through a sequence of choices
  • Always choose the best option available “right now”
  • The “best” choice is the one that gets us closest to an optimal
  solution (e.g. take the biggest feasible coin)
  • You hope that by choosing a local optimum at each
  step, you will end up at a global optimum

  • Greedy choice properties:
  • Feasible: Must satisfy the problem’s constraints
  • If you are making change for 17 cents, you don’t pick a quarter
  • Locally optimal: Best local choice among all feasible choices
  available on that step
  • If you are making change for 14 cents, you pick a dime, not a nickel
  • Assumption: it is “reasonably efficient” to determine this (think
  about the Knapsack Problem – how to find the “best” choice)
  • Irrevocable: Once made, it cannot be changed during
  subsequent steps of the algorithm

  • We will examine greedy algorithms for the
  following problems:
  • Finding a minimum spanning tree (MST) of a graph
  • Prim’s algorithm
  • Kruskal’s algorithm
  • Finding Shortest Paths from a Single Source in a graph
  • Dijkstra’s algorithm
  • Coloring a graph

- Greedy algorithm TL/DR

1. Iteratively construct a solution
2. At each step select the “best” item to add
   • Idea for how to select the best should be “simple”

- A real-world problem: Build a (physical) network
  • A minimum spanning tree (MST) is a
  subgraph of a connected, undirected, weighted
  graph G, such that
  • it includes all the vertices (“spanning”)
  • it is acyclic (“tree”)
  • the total cost associated with the edges is the
  minimum among all possible spanning trees
  • MST may not be unique

  - If you do MST
    on a complete graph:
    • The result:
    • Is a tree (obvs)
    • therefore connected
    • connects all the nodes
    • using the minimum cost

  - Represent it as a graph
    • Vertices are all the nodes to be connected
    • One edge for every possible connection
    • I.e. the complete graph of N vertices
    • Each edge has a “weight” associated with it
    • Cost of running a wire from node A to node B
    • Now find the MST
    • How does this solve the problem?
    • Spanning tree  all nodes are connected
    • Lowest cost tree  cheapest possible network

- Reminder: Solving problems
  with graphs, strategy 2

1. Represent the problem “cleverly” as a graph
2. Feed the graph to a Graph Algorithm
3. Use the output to determine the answer to your
   problem

### Greedy Algorithms: Prim’s Algorithm

- Prim’s algorithm
  • Greedy algorithm TL/DR:

1. Iteratively construct a solution
2. Greedy choice at each step adding to the solution
   • Prim’s algo:
   • Start with any one vertex
   • Greedy choice at each iteration:
   • Lowest-cost edge that has one vertex already IN and one vertex
   OUT

- psudocode
  Algorithm Prim(G)
  VT ← {v0}
  ET ← ∅
  for i ← 1 to N-1 do
  find a min-weight edge e=(u,v) from E
  where u is in VT (in the tree)
  and v is in V-VT (not yet in the tree)
  VT ← VT ∪ {v}
  ET ← ET ∪ {e}
  return T = (VT, ET)

### Greedy Algorithms: Kruskal’s Algorithm

- Context
  • Another one of several “greedy algorithms” we are
  examining:
  • Minimum Spanning Tree of a graph
  • Prim’s algorithm
  • Kruskal’s algorithm
  • Shortest Paths from a Single Source in a graph
  • Dijkstra’s algorithm
  • Graph coloring
- Kruskal’s (overview)
  • Repeatedly add a minimum-weight edge that does not
  introduce a cycle
- psudocode
  Kruskal(G)
  sort edges of E in ascending order by weight
  VT ← V // T has all the vertices of G
  ET ← ∅ // start with no edges in T
  count ← 0
  k ← 0 // index over edges of G
  while count < |V|-1 do // done when T has this many edges
  k ← k + 1
  if ET ∪ {ek} is acyclic // safe to add this edge to T?
  ET ← ET ∪ {ek} // ...then add it
  count ← count + 1
  return T = (VT, ET)

- Kruskal’s algorithm: Implementation challenges

1. Sort the edges
   • We know several O(NlogN) methods
   • Which will serve us well?
2. Determine if adding an edge would create a cycle
   • Maybe use a DFS or BFS to test for a cycle?
   • These are O(N2) and we have to do it O(N) times
   • Can we improve on O(N3)?
   • The answer is Yes, with a clever data structure

- Disjoint Subsets
  (aka “Union-Find”)
  • A collection of disjoint subsets – any element can
  only be in one subset at any time
  • Operations on a DS:
  • Makeset(x) – creates a new subset with the element x
  • Find(x) – returns the subset that contains x
  • Union(x,y) – merges the subsets containing x and y
  together

- Kruskal’s with disjoint subsets
  • Maintain DS of vertices in the spanning tree T
  • Initially each vertex is a separate subset
  • When an edge (u,v) is added to T:
  • DS.union(u,v)
  • Each subset is a connected component
  • It’s also a tree – a subset of the eventual MST
  • If u,v are in the same subset do not add edge
  • It would create a cycle
  • At the end there will be only one subset in DS
  • T is a single connected component

-Kruskal’s algorithm with PQ + disjoint subsets

- psudocode
  Algorithm Kruskal(G)
  Add all vertices in G to T // add v's but don’t add e's
  Create a priority queue PQ // will hold candidate edges
  Create a collection DS // disjoint subsets
  for each vertex v in G do
  DS.makeset(v)
  for each edge e in G do
  PQ.add(e.weight, e ) // PQ of edges by min weight
  while T has fewer than n-1 edges do
  (u,v) ← PQ.removeMin() // get next smallest edge
  cu ← DS.find(u)
  cv ← DS.find(v)
  if cu ≠ cv then // be sure u,v are not in
  T.addEdge(u,v) // the same subset
  DS.union(cu, cv)
  return T

- Efficiency of Kruskal's
  With an efficient union-find algorithm, the slowest
  thing is the initial sort on edge weights
  • O(|E| log(|E|))
  • Remember that |E| is (in the worst case) |V|2
  • So this is also O(|V|2 log(|V|))
  • Since we usually use N as the number of vertices in a
  graph, this is O(N2 logN)

- Prim’s and Kruskal’s TL/DR
  • Same problem: Minimum Spanning Tree (MST)
  • Both are greedy algorithms
  • Both add edges one at a time
  • Prim’s greedy choice: smallest edge that extends the
  tree
  • Graph (tree) under construction is always connected, adds one
  vertex+edge at a time
  • Kruskal’s: smallest edge that doesn’t make a cycle
  • Graph under construction is a forest, all vertices are already
  present, we are only adding edges

### Greedy Algorithms: Dijkstra’s Algorithm

- Constext
  • Another one of several “greedy algorithms” we will
  examine:
  • Minimum Spanning Tree of a graph
  • Prim’s algorithm
  • Kruskal’s algorithm
  • Shortest Paths from a Single Source in a graph
  • Dijkstra’s algorithm
  • Graph coloring

- Problem:
  Single-source Shortest Paths
  • Find the shortest path from a chosen vertex (the
  source) to every other vertex

- Idea of Dijkstra’s algorithm
  • Remember the best-known shortest distances for
  all vertices
  • Initially “infinity” for all
  • Choose the nearest unprocessed vertex
  • Definition of “nearest” tbd
  • Look at all of its neighbors
  • Update their known shortest distances (“Relax”)
  • Repeat

- Relaxation
  • Dijkstra refers to “relaxing” a vertex
  • Meaning: update the best known shortest path to v

- Dijkstra’s Algorithm
  • Builds a tree of shortest paths rooted at the starting vertex
  • This is a greedy algorithm: it adds the closest vertex, then the next closest,
  and so on (until all vertices have been added)
  High-level pseudocode:

1. Initialise d and prev
2. Add all vertices to a PQ with distance from source as the key
3. While there are still vertices in PQ
4. Get next vertex u from the PQ
5. For each vertex v adjacent to u
6. If v is still in PQ, relax v
7. Relax(v):
8. if d[u] + w(u,v) < d[v]
9. d[v] ← d[u] + w(u,v)
10. prev[v] ← u
11. PQ.updateKey(d[v], v)

- Output from Dijkstra’s
  • There are (at least) two possible outputs from
  Dijkstra’s algorithm:
  • Tree of shortest paths from v to all other vertices
  • List (map) of total costs of shortest paths from v to all
  other vertices. I.e. the list tells you “min_distance(v, w)”
  for all the vertices reachable from v.

- Similarity of Dijkstra to Prim
  • Both accumulate a tree T of edges from G
  • Each iteration: select the minimum priority edge adjacent to the tree that has been built so far
  • In Prim’s the priority of an edge is simply the weight of the edge
  • In Dijkstra’s the “priority” is the weight of the edge (u, v) plus the
  distance from the start to the parent of v

- Sample application of Dijkstra’s
  • Suppose London wants fresh pineapples from
  Hawaii.
  • There are no direct flights, but many possible
  connections.
  • What is the best possible route to minimize overall
  shipping cost?

### Greedy Algorithms: Graph Coloring

- Map coloring
  • Problem: Color the regions on a map
  • Regions that share a border must be different colors
  • Meeting at a single point is not a border
  • As a decision problem:
  • Can this map be colored with N colors?
  • As an optimization problem:
  • What is the minimum number of colors needed to color
  this map?

- Graph representation
  • One vertex for each region
  • Edge between regions if they share a border
  • Problem re-stated as a graph problem:
  • Assign colors to the vertices of a graph so that no
  adjacent vertices are the same color

- Graph coloring problem
  • Color a graph with as few colors as possible such
  that no two adjacent vertices are the same color

- Graph coloring – greedy algorithm
  • Start with just one color
  • Consider the vertices in a specific order v1, … , vn
  • For each vi , assign the first available color not used
  by any of vi’s neighbours
  • If all colors are in use by neighbours, add a new
  color

- Is this algorithm optimal?
  • Consider the previous graph but with vertices
  numbered differently
  • Needed only two colors before
  • The order of considering the
  vertices matters
  • Greedy algorithms do not
  always yield optimal solutions
  • But like brute-force, they are
  often worth considering
  because they may be easy to
  implement

# Lecture 10. Dynamic Programming

- Known graph algorithms (so far)
  • Depth first search (DFS)
  • Input: Any graph
  • Output options: DFS order, dead-end order, spanning tree
  • Applicable when: Problem requires visiting all the things (vertices)
  • Breadth first search (BFS)
  • Input: Any graph
  • Output options: BFS order, spanning tree
  • Applicable when: Problem requires visiting all the things (vertices)
  • Connected components
  • Input: Any graph
  • Output options: Count or Boolean (“is it connected”)
  • Note: Modified DFS/BFS
  • Applicable when: Determining how many “clumps” of vertices there
  are
  • Topological sort
  • Input: Directed acyclic graph (DAG)
  • Output: Linear ordering of the vertices
  • Note: We know two algorithms – modified DFS and dec&conq
  • Applicable when: Need to find an order of the vertices
  • Minimum spanning tree (MST)
  • Input: Weighted graph
  • Output: Tree
  • Note: We know two algorithms – Prim, Kruskal
  • Applicable when: Want to form the cheapest connected network
  • Single-source shortest paths (SSSP)
  • Input: Weighted graph + starting vertex
  • Output options: “Lengths” array, shortest-path tree (aka “prev” array)
  • Note: Dijkstra
  • Applicable when: Looking for shortest path from a particular vertex to all others

- Space-time trade-off
  Augment the algorithm by remembering the results
  you get along the way
- Fibs, top-down
- Fibs, bottom-up

- Dynamic Programming
  • Key point: remembering recursively-defined
  solutions to sub-problems and using them to
  solve the problem
  • Store solutions to sub-problems for possible
  reuse.
  • A good idea if many of the sub-problems are
  repeats
  • DP is not divide-and-conquer
  • Both d&c and dp use recursion
  (at least conceptually)
  • Step 1:
  • Decompose problem into smaller, equivalent
  sub-problems
  • Step 2:
  • Express solution in terms of sub-problems
  • Step 3:
  • Use table to compute optimal value bottom-up
  • Step 4:
  • Find optimal solution based on steps 1-3

  - Examples
    • Fibonacci numbers
    • Robot Coin Collecting
    • Transitive Closure (Warshall)
    • All Pairs Shortest Paths (Floyd)

### Dynamic Programming: Coin-collecting Robot

Several coins are placed in cells of an n×m board. A robot, located in the
upper left cell of the board, needs to collect as many of the coins as
possible and bring them to the bottom right cell. The robot can only move
right or down.

- Solution
  • Let F(i,j) be the largest number of coins the robot can collect
  and bring to cell (i,j) in the ith row and jth column.
  • F(i, j ) = max{F(i-1, j ), F(i, j-1)} + cij
  • F(0, j ) = 0 for 1 ≤ j ≤ m and F(i, 0) = 0 for 1 ≤ i ≤ n.
  Bottom-up calculation
  F(i, j) = max{F(i-1, j), F(i, j-1)} + cij for 1 ≤ i ≤ n, 1 ≤ j ≤ m
  Complexity? Θ(nm) time, Θ(nm) space
  check psudocode

- Dynamic programming TL/DR
  • Understand the problem
  • Make a recursive definition of the problem
  • What are the subproblems?
  • How are the subproblems related?
  • Decide how to store the results of subproblems
  • Algorithm to calculate/fill in the data structure

### Dynamic Programming: Transitive Closure

- Transitive Closure
  • What nodes are reachable from other nodes?
  • Problem:
  • given a directed unweighted graph G with n vertices,
  find all paths that exist from vertices vi to vj,
  for all 1 ≤ (i, j) ≤ n
  • Note: this problem is always solved with an
  adjacency matrix graph representation
   Applications:
  ◦ Testing digital circuits, reachability testing
  • Idea of algorithm:
  • Create a new graph where every edge represents a path
  in the original

- Warshall's algorithm
  • Maybe the best thing about this algorithm is its
  simplicity
  Warshall(R[1..n, 1..n])
  for k ← 1 to n {
  for i ← 1 to n {
  for j ← 1 to n {
  if ( R[i,k] == R[k,j] == 1 ) {
  set R[i,j] ← 1
  }
  }
  }
  }

- Why it is dynamic programming
  • On the k-th iteration:
  • The algorithm determines for every pair of vertices i, j if
  a path exists from i and j with just vertices 1,…,k allowed
  as intermediate
  • So: It finds the paths from simpler subproblems
  • Also produces the result bottom-up from a matrix
  recording as you go

### Dynamic Programming: All-pairs shortest paths

• Problem:
• Given a directed weighted graph G with n vertices, find the
shortest path from any vertex vi to any other vertex vj, for all
1 ≤ (i,j) ≤ n
• Note: this problem is always solved with an adjacency
matrix graph representation
• Applications: This problem occurs in lots of applications
– notably in computer games, where it is useful to find
shortest paths before planning movement.

- Floyd’s algorithm
  • Like Warshall’s algorithm, but different:
  • Add weight (or cost) to each edge in the initial graph
  • When no edge exists the weight is ∞
  • “You can’t get there from here” (yet)
  • Set the weights on the diagonal to be 0
  • The shortest path from a vertex to itself should be 0

  • And the real key change:
  • Warshall’s algorithm says this:
  • if (i,k) == (k,j) == 1 then set (i,j)  1
  • i.e. If you can get from i to k and from k to j, then now you can
  get from i to j
  • …but for Floyd’s we will say this:
  • if (i,k) + (k,j) < (i,j) then set (i,j)  (i,k) + (k,j)
  • i.e. If i-k-j costs less than the (so far) best known path from i to
  j, then update the best known path"
  • The final matrix gives the shortest paths from any i
  to any j.
  • Observations:
  • You can’t get from anywhere to 1
  • The algorithm discovered two-hop paths for
  1 → 3, 2 → 4, 3 → 2, and 4 → 3

  - pseudocode
    Floyd(G[1..n, 1..n])
    for k ← 1 to n {
    for i ← 1 to n {
    for j ← 1 to n {
    cost_thru_k ← G[i,k] + G[k,j]
    if ( cost_thru_k < G[i,j] ) {
    set G[i,j] ← thru_k
    }
    }
    }
    }

- How is this DP?
  • (Like Warshall’s) the “sub-problem” is that it is
  finding shortest paths that use vertices 1..k as
  hopping points
  • One new vertex (k) is added into the picture at each
  step
  • After each step, you have a matrix Dk that gives the
  best (yet) distance through those vertices

# Lecture 11. Backtracking, Branch & Bound

- Golf-tee puzzle
- Backtracking
  • Suppose you have to make a series of decisions,
  among various choices, where
  • You don’t have enough information to know what to
  choose
  • Each decision leads to a new set of choices
  • Some sequence of choices (possibly more than one) may
  be a solution to your problem
  • Backtracking is a systematic way of trying out
  various sequences of decisions, until you find one
  that “works”
- Changing state
- State-space tree
- Backtracking in words
  • IDEA:
  • Construct solutions one component at a time
  • If a partial solution can be developed further without
  violating constraints:
  • Choose first legitimate option for the next component
  • If there is no option for the next component
  • Backtrack to replace the last component of partial solution
  • Think of the solutions as being organized in a tree
  • Each node represents the “state” at one stage of the
  solution
  • The root represents initial state before the search begins
  • Nodes at first level represent first choice
  • Second level ... second choice ... etc.
- Backtracking- abstract example
  • Starting at Root, your options are A and B.
  You choose A.
  • At A, your options are C and D. You choose
  C.
  • C is bad. Go back to A.
  • At A, you have already tried C, and it failed.
  Try D.
  • D is bad. Go back to A.
  • At A, you have no options left to try. Go
  back to Root.
  • At Root, you have already tried A. Try B.
  • At B, your options are E and F. Try E.
  • E is good. Congratulations!
  The tree used to build solutions is called
  the state-space tree
  The nodes are partial solutions
  The edges are choices

- Example: n-Queens Problem
  • Place n queens on an n-by-n chess board so that no
  two are in the same row, column or diagonal
  • i.e. no queens are attacking each other

  • Moving around in a DFS-like way through the State
  Space Tree
  • This is the essence of a backtracking algorithm
  • Proceed to the next possible choice; examine the
  choice; if "promising", we continue; if "non-promising",
  we backtrack (go back up the tree)
  • At each LEVEL of the tree we have partial solutions of
  increasing sizes -- growing towards a complete solution
  • LEAVES of the tree can be dead ends, or (if they get far
  enough down the tree) SOLUTIONS

- Example: Hamiltonian cycles
  • Start at any vertex
  • Successively build a path
  • At each “level”, try adding each
  remaining neighbor
  • Backtrack at dead ends
  • What is the state space?

## Branch and Bound

- • The idea:
  Set up a bounding function, which is used to compute a bound (for the value
  of the objective function) at a node on a state-space tree and determine if it
  is promising
  • Promising (if the bound is better than the value of the best
  solution so far): expand beyond the node.
  • Non-promising (if the bound is no better than the value of
  the best solution so far): do not expand beyond the node
  (pruning the state-space tree).

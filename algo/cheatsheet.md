# Cheat Sheet: Algorithm Analysis (Lecture 1)

#### **Why Learn Algorithms?**

- Core of programming; crucial for:
  - **Problem Types**: Sorting, searching, graphs, optimization, etc.
  - **Techniques**: Divide-and-conquer, dynamic programming, greedy, etc.
- Key Characteristics:
  - **Correctness**: Produces the right result.
  - **Time Efficiency**: Uses minimal time.
  - **Space Efficiency**: Uses minimal memory.

---

#### **Algorithm Definition**

- **Definition**: A sequence of clear instructions to solve a problem for any valid input in finite time.
- Examples:
  - **Inefficient**: Recursive Fibonacci \(O(2^n)\)
  - **Efficient**: Iterative Fibonacci \(O(n)\)

```pseudo
// Inefficient
fib(n):
  if n ≤ 1 return n
  else return fib(n-1) + fib(n-2)

// Efficient
fib2(n):
  F[0] ← 0; F[1] ← 1
  for i ← 2 to n: F[i] ← F[i-1] + F[i-2]
  return F[n]
```

---

#### **Efficiency Analysis**

- **Depends on input size \(n\)**.
- **Basic Operation**: Most executed, deepest loop (e.g., assignments, comparisons).
- **Example**:

```pseudo
Mystery1(n): // n > 0
  S ← 0
  for i ← 1 to n: S ← S + i * i // basic operation
  return S
```

---

#### **Worst, Average, Best Case**

- **Worst Case**: Most steps (focus in this course).
- **Average Case**: Expected steps over all inputs.
- **Best Case**: Fewest steps (lucky input).

---

#### **Asymptotic Notations**

1. **Big-O \(O(g(n))\)**: Upper bound (worst-case).

   - Drop constants/lower-order terms.
   - Example: \(50n^3 + 20n + 4 ∈ O(n^3)\).

2. **Big-Ω \(Ω(g(n))\)**: Lower bound.

   - \(f(n) ≥ c \cdot g(n)\) for \(n \geq n_0\).

3. **Big-Θ \(Θ(g(n))\)**: Tight bound.
   - Both upper and lower bounds.

---

#### **Steps for Algorithm Analysis**

1. **Parameterize Input Size**: \(n\).
2. **Identify Basic Operation**: Main operation in the algorithm.
3. **Set Up Summations**: Count basic operations.
4. **Simplify**: Use summation algebra.
5. **Determine Efficiency Class**: Use asymptotic notations.

---

#### **Order of Growth**

| **Notation**  | **Example**      | **Class**   |
| ------------- | ---------------- | ----------- |
| \(O(1)\)      | 5! + 32          | Constant    |
| \(O(\log n)\) | 3\(\log n\) + 1  | Logarithmic |
| \(O(n)\)      | \(10n\)          | Linear      |
| \(O(n^2)\)    | \(4n^2 + 10\)    | Quadratic   |
| \(O(2^n)\)    | \(10000n + 2^n\) | Exponential |

---

#### **Examples**

1. **Find Max Element**

   - Input: Unsorted list of size \(n\).
   - Basic Operation: Comparison.
   - Efficiency: \(O(n)\).

2. **Matrix Multiplication**

   - Input: Two \(n \times n\) matrices.
   - Basic Operation: Multiplication.
   - Efficiency: \(O(n^3)\).

3. **Element Uniqueness**
   - Input: Array of size \(n\).
   - Basic Operation: Comparison.
   - Efficiency:
     - Brute Force: \(O(n^2)\).
     - Optimized (Sorting): \(O(n \log n)\).

---

#### **Big-O Simplification Examples**

1. \(50n^3 + 20n + 4 \to O(n^3)\)
2. \(4n^2 + 10 \to O(n^2)\)
3. \(3\log n + n \to O(n)\)

---

#### **Common Problem Types**

- **Sum of Numbers**:
  - Basic Operation: Addition.
  - Efficiency: \(O(n)\).
- **Compute \(n!\)**:
  - Basic Operation: Multiplication.
  - Efficiency: \(O(n)\).
- **Check All Unique**:
  - Brute Force: \(O(n^2)\).
  - Optimized: \(O(n \log n)\) with sorting.

---

#### **Summary**

- **Big-O**: At most.
- **Big-Ω**: At least.
- **Big-Θ**: Exactly.

# Cheat Sheet: Brute Force (Lecture 2)

#### **Definition and Characteristics**

- **Brute Force**: Direct and straightforward approach; "just do it" methodology.
  - **Generate and Test**:
    1. Generate all possible solutions.
    2. Test each for validity, breaking when a solution is found (if only one needed).
  - **Strengths**:
    - Easy to understand and implement.
    - Applicable across diverse problems.
  - **Weaknesses**:
    - Often inefficient.
    - Works for small inputs or when lucky.
  - **Examples**: Searching, sorting, \(n!\), TSP, knapsack.

---

#### **Key Brute Force Examples**

1. **Selection Sort**

   - General Idea:
     1. Divide array into sorted and unsorted parts.
     2. Repeatedly find the smallest element from the unsorted part and move it to the sorted part.
   - **Efficiency**: \(O(n^2)\) (due to nested loops).

   ```pseudo
   for i = 0 to n-1:
     find smallest element in A[i...n-1]
     swap with A[i]
   ```

2. **Bubble Sort**

   - General Idea:
     1. Compare adjacent elements.
     2. Swap if they are out of order.
     3. Largest unsorted element "bubbles" to the end.
   - **Efficiency**: \(O(n^2)\).

   ```pseudo
   for i = 0 to n-1:
     for j = 0 to n-i-1:
       if A[j] > A[j+1]:
         swap A[j], A[j+1]
   ```

---

#### **String Matching**

- **Problem**: Find a substring (pattern) in a larger text.
- **Algorithm**:
  1. Align pattern at the start of the text.
  2. Compare characters until:
     - Match found (successful search).
     - Mismatch (realign pattern one position to the right).
  3. Repeat until text is exhausted.
- **Efficiency**: \(O((n-m+1) \cdot m)\) (worst case).

---

#### **Optimization Problems**

1. **Traveling Salesperson Problem (TSP)**

   - **Input**: \(n\) cities, distances between pairs.
   - **Goal**: Find the shortest route visiting all cities exactly once.
   - **Brute Force**: Generate all \((n-1)!/2\) Hamiltonian circuits, calculate their lengths, and pick the shortest.
   - **Efficiency**: \(O(n!)\).

   ```pseudo
   for each permutation P of cities:
     calculate length of route P
     update min length and route
   ```

2. **Knapsack Problem**

   - **Input**: \(n\) items with weights \(w_i\), values \(v_i\), and capacity \(W\).
   - **Goal**: Maximize value without exceeding weight capacity.
   - **Brute Force**: Generate all \(2^n\) subsets, evaluate each for feasibility and value.
   - **Efficiency**: \(O(2^n)\).

   ```pseudo
   for each subset S of items:
     if weight(S) ≤ W:
       calculate value(S)
       update max value
   ```

3. **Assignment Problem**

   - **Input**: \(n\) tasks, \(n\) workers, and cost matrix.
   - **Goal**: Minimize total cost of assignments.
   - **Brute Force**: Check all \(n!\) permutations of assignments.
   - **Efficiency**: \(O(n!)\).

   ```pseudo
   for each permutation P of assignments:
     calculate total cost
     update min cost and assignment
   ```

---

#### **Analysis and Efficiency**

- **Strengths**:
  - Easy to design.
  - Often the starting point for problem-solving.
- **Weaknesses**:
  - Inefficient for large inputs.
  - Rarely the most optimal solution.

---

#### **Practice Problem**

**Row of Discs (Dark/Light)**

- **Problem**: Alternate \(n\) dark and \(n\) light discs. Move all dark to the right and light to the left by swapping adjacent discs.
- **Brute Force Algorithm**:
  1. Identify positions where dark discs are not in the correct half.
  2. Swap adjacent discs to move dark discs to the right.
- **Efficiency**: \(O(n^2)\) (worst case).

---

#### **Key Takeaways**

- Brute force is simple and effective for small inputs but scales poorly.
- Examples like TSP, knapsack, and assignment problems highlight brute force's inefficiency.
- Often serves as a benchmark for more efficient algorithms.

# Cheat Sheet: Decrease and Conquer (Lecture 3)

#### **Overview**

- **Decrease and Conquer**: Solve a smaller instance of the problem and extend the solution to the original problem.
  - **Types**:
    1. **Decrease by a constant** (e.g., \(n - 1\)).
    2. **Decrease by a constant factor** (e.g., \(n / 2\)).
    3. **Variable-size decrease** (e.g., Euclid's algorithm).
  - **Methods**:
    - **Top-down**: Recursive approach.
    - **Bottom-up**: Iterative approach.

---

### **Decrease by a Constant**

1. **Insertion Sort** (Recursive and Iterative)

   - Insert \(A[n-1]\) into the correct position in the sorted subarray \(A[0...n-2]\).
   - **Efficiency**: \(O(n^2)\) worst case.

   ```pseudo
   // Recursive
   InsertionSort(A, n):
     if n > 1:
       InsertionSort(A, n-1)
       Insert A[n-1] into sorted A[0...n-2]
   ```

   ```pseudo
   // Iterative
   for i ← 1 to n-1:
     key ← A[i]
     j ← i-1
     while j ≥ 0 and A[j] > key:
       A[j+1] ← A[j]
       j ← j-1
     A[j+1] ← key
   ```

2. **Generating Permutations**

   - Find all permutations of \(n-1\) elements, then insert the \(n\)-th element into all possible positions.
   - **Efficiency**: \(O(n!)\).

3. **Generating Subsets**
   - Generate subsets of \(n-1\) items, then add the \(n\)-th item to each subset.
   - **Efficiency**: \(O(2^n)\).

---

### **Decrease by a Constant Factor**

1. **Binary Search**

   - Divide sorted array into two halves; discard the half that doesn’t contain the target.
   - **Efficiency**: \(O(\log n)\).

   ```pseudo
   binarySearch(A, k, s, e):
     if e < s:
       return not found
     m ← floor((s+e)/2)
     if A[m] == k:
       return m
     else if k > A[m]:
       return binarySearch(A, k, m+1, e)
     else:
       return binarySearch(A, k, s, m-1)
   ```

2. **Exponentiation by Squaring**

   - Reduce power \(n\) by half on each step.
   - **Efficiency**: \(O(\log n)\).

   ```pseudo
   power(a, n):
     if n == 1:
       return a
     if n % 2 == 0:
       t = power(a, n/2)
       return t * t
     else:
       t = power(a, (n-1)/2)
       return a * t * t
   ```

3. **Fake Coin Problem**

   - Divide \(n\) coins into halves and compare weights.
   - **Best Case**: 1 comparison.
   - **Worst Case**: \(O(\log_2 n)\) comparisons.
   - **3-Pile Solution**: \(O(\log_3 n)\).

   ```pseudo
   FindFakeCoin(C[N]):
     if N == 1:
       return C[0]
     if N is odd:
       set aside C[0]
     divide remaining coins into C1 and C2
     weigh C1 vs. C2
     if equal:
       return C[0]
     else:
       return FindFakeCoin(lighter pile)
   ```

---

### **Efficiency Comparison**

| **Algorithm**              | **Type**                | **Efficiency**  |
| -------------------------- | ----------------------- | --------------- |
| Insertion Sort             | Decrease by 1           | \(O(n^2)\)      |
| Generating Permutations    | Decrease by 1           | \(O(n!)\)       |
| Generating Subsets         | Decrease by 1           | \(O(2^n)\)      |
| Binary Search              | Decrease by factor of 2 | \(O(\log n)\)   |
| Exponentiation by Squaring | Decrease by factor of 2 | \(O(\log n)\)   |
| Fake Coin Problem          | Decrease by factor of 2 | \(O(\log_2 n)\) |
| Fake Coin Problem (3-pile) | Decrease by factor of 3 | \(O(\log_3 n)\) |

---

### **Key Insights**

- **Top-Down vs. Bottom-Up**:

  - Recursive approaches are often more intuitive but can have higher space complexity due to stack usage.
  - Iterative approaches avoid stack overhead.

- **Advantages of Decrease and Conquer**:

  - Simplifies problems by reducing them to manageable sizes.
  - Efficient for problems with divide-and-conquer structures.

- **Limitations**:
  - Requires careful consideration of base cases and recursion depth.
  - Efficiency varies significantly based on the type of reduction (constant vs. factor).

# Cheat Sheet: Divide and Conquer (Lecture 4)

#### **Overview**

- **Divide and Conquer**:
  1. **Divide**: Break problem into smaller subproblems.
  2. **Conquer**: Solve subproblems (often recursively).
  3. **Combine**: Merge subproblem solutions into the solution for the original problem.

---

### **Key Characteristics**

- Unlike Decrease and Conquer, all subproblems must be solved.
- **Master Theorem** helps analyze running time:
  - \( T(n) = aT(n/b) + F(n) \)
  - Compare \( n^{\log_b{a}} \) with \( F(n) \):
    - \( n^{\log_b{a}} > F(n) \): \( O(n^{\log_b{a}}) \).
    - \( n^{\log_b{a}} = F(n) \): \( O(n^{\log_b{a}} \log{n}) \).
    - \( n^{\log_b{a}} < F(n) \): \( O(F(n)) \).

---

### **Examples**

#### **1. Count a Key in an Array**

- Problem: Count occurrences of a key in an array.
- **Algorithm**:
  ```pseudo
  CountKeys(A, Key, L, R):
    if L = R:
      return 1 if A[L] == Key else 0
    mid = floor((L+R)/2)
    leftCount = CountKeys(A, Key, L, mid)
    rightCount = CountKeys(A, Key, mid+1, R)
    return leftCount + rightCount
  ```
- **Efficiency Analysis**:
  - **Divide**: 2 subproblems of size \( n/2 \) (\( b = 2 \), \( a = 2 \)).
  - **Conquer**: Recursive calls.
  - **Combine**: Constant time \( O(1) \).
  - \( T(n) = 2T(n/2) + 1 \) → \( O(n) \).

---

#### **2. Mergesort**

- **Steps**:
  1. Divide array into two halves.
  2. Recursively sort each half.
  3. Merge the sorted halves into one sorted array.
- **Pseudocode**:
  ```pseudo
  MergeSort(A, L, R):
    if L >= R:
      return
    mid = floor((L+R)/2)
    MergeSort(A, L, mid)
    MergeSort(A, mid+1, R)
    Merge(A, L, mid, R)
  ```
- **Efficiency Analysis**:
  - \( T(n) = 2T(n/2) + n \).
  - \( a = 2, b = 2, F(n) = n \).
  - \( n^{\log_b{a}} = n^{\log_2{2}} = n \).
  - Combine step: \( F(n) = n \).
  - \( O(n \log n) \).

---

#### **Master Theorem Examples**

| **Algorithm**     | \( T(n) \)        | **a** | **b** | \( F(n) \) | **Efficiency**    |
| ----------------- | ----------------- | ----- | ----- | ---------- | ----------------- |
| CountKeys         | \( 2T(n/2) + 1 \) | 2     | 2     | \( O(1) \) | \( O(n) \)        |
| Mergesort         | \( 2T(n/2) + n \) | 2     | 2     | \( O(n) \) | \( O(n \log n) \) |
| Fake Coin Problem | \( T(n/2) + 1 \)  | 1     | 2     | \( O(1) \) | \( O(\log n) \)   |

---

### **Key Algorithms**

#### **Binary Search vs. CountKeys**

- **Binary Search**:
  - Only one side is explored (\( a = 1, b = 2 \)).
  - \( T(n) = T(n/2) + O(1) \) → \( O(\log n) \).
- **CountKeys**:
  - Both sides are explored (\( a = 2, b = 2 \)).
  - \( T(n) = 2T(n/2) + O(1) \) → \( O(n) \).

---

### **Combine Step in Mergesort**

- **Merging Two Sorted Arrays**:
  - Example: Merge \( B = \{3, 8, 9\} \) and \( C = \{1, 5, 7\} \).
  - Result: \( \{1, 3, 5, 7, 8, 9\} \).
  - **Efficiency**: \( O(n) \).

---

### **Efficiency Highlights**

- **Divide and Conquer** leverages recursive problem-solving.
- **Advantages**:
  - Works efficiently for large datasets (e.g., sorting, searching).
- **Limitations**:
  - Recursion overhead.
  - Requires combining solutions, which may add extra cost.

# Cheat Sheet: Transform and Conquer (Lecture 5)

---

### **Transform and Conquer**

- **Definition**: Solve problems by transforming:
  1. **Instance Simplification**: Simplify the instance of the same problem.
  2. **Representation Change**: Use a new data structure or representation.

---

### **1. Instance Simplification**

#### **Element Uniqueness**

- **Problem**: Check if all elements in an array are unique.
- **Brute Force**:
  - Compare all pairs.
  - **Efficiency**: \( O(n^2) \).
- **Pre-Sorting Approach**:
  1. **Sort** the array (\( O(n \log n) \)).
  2. Scan for adjacent duplicates (\( O(n) \)).
  - **Efficiency**: \( O(n \log n) \).

---

#### **Computing a Mode**

- **Problem**: Find the value that appears most frequently in an array.
- **Brute Force**:
  - Count frequencies of all elements.
  - **Efficiency**: \( O(n^2) \).
- **Pre-Sorting Approach**:
  1. **Sort** the array (\( O(n \log n) \)).
  2. Scan for the longest run of equal values (\( O(n) \)).
  - **Efficiency**: \( O(n \log n) \).

---

#### **Searching**

- **Problem**: Search for key \( K \) in array \( A[0..n-1] \).
- **Sequential Search**: \( O(n) \).
- **Pre-Sorting + Binary Search**:
  1. Sort array (\( O(n \log n) \)).
  2. Perform binary search (\( O(\log n) \)).
  - **Efficiency**: \( O(n \log n) \).
  - **When Useful**: If you search many times on the same array.

---

### **2. Representation Change**

#### **Heaps and Heapsort**

##### **Heap Definition**

- **Heap**: A nearly complete binary tree with:
  - Parent node ≥ child nodes.
  - Root node contains the maximum value.

##### **Heap Properties**

- **Height**: \( \lfloor \log_2 N \rfloor \).
- **Array Implementation**:
  - Parent(\(i\)) = \( \lfloor i / 2 \rfloor \).
  - Left(\(i\)) = \( 2i \).
  - Right(\(i\)) = \( 2i + 1 \).

---

#### **Heap Operations**

1. **Insert**:

   - Insert at the next available position.
   - Bubble up to maintain heap order.
   - **Efficiency**: \( O(\log n) \).

2. **Delete Max**:
   - Swap root with last leaf.
   - Remove last leaf.
   - Bubble down to maintain heap order.
   - **Efficiency**: \( O(\log n) \).

---

#### **Heap Construction**

- **Given Array**:
  1. Start from the last parent node.
  2. Fix each node by bubbling down.
  - **Efficiency**: \( O(n \log n) \).

---

#### **Heapsort**

- **Algorithm**:

  1. **Build Heap** (\( O(n \log n) \)).
  2. **Sort**: Call `deleteMax` \( n \) times.
     - Swap root with the last element.
     - Reheapify the remaining heap.
     - **Efficiency**: \( O(n \log n) \).

- **Overall Efficiency**: \( O(n \log n) \).

---

### **Comparative Efficiencies**

| **Problem**             | **Approach**         | **Efficiency**    |
| ----------------------- | -------------------- | ----------------- |
| Element Uniqueness      | Brute Force          | \( O(n^2) \)      |
| Element Uniqueness      | Pre-Sorting          | \( O(n \log n) \) |
| Computing a Mode        | Brute Force          | \( O(n^2) \)      |
| Computing a Mode        | Pre-Sorting          | \( O(n \log n) \) |
| Searching               | Sequential Search    | \( O(n) \)        |
| Searching               | Pre-Sorting + Binary | \( O(n \log n) \) |
| Heap Insertion/Deletion | Heap                 | \( O(\log n) \)   |
| Heap Construction       | Transform Array      | \( O(n \log n) \) |
| Heapsort                | Heap                 | \( O(n \log n) \) |

---

### **Key Takeaways**

- **Instance Simplification**: Pre-sorting improves efficiency for repeated tasks.
- **Representation Change**: Heaps enable efficient insertion and deletion.
- **Heapsort**:
  - Combines heap construction and repeated root removal for sorting.
  - Competitive with other \( O(n \log n) \) sorting algorithms (e.g., mergesort).

# Cheat Sheet: Space/Time Trade-offs (Lecture 6)

---

### **1. Space/Time Trade-offs**

- **Space**: Memory consumed during execution.
- **Time**: Execution time of the algorithm.
- **Trade-off**: Improving one may increase the cost of the other.
  - **Space-saving algorithms**: Slower (e.g., Bubble Sort, Selection Sort).
  - **Time-saving algorithms**: Use more memory (e.g., MergeSort).

---

### **2. Types of Space/Time Trade-offs**

#### **1. Input Enhancement**

- Preprocess input to store additional information for faster processing later.
- Examples:
  - **Comparison Counting Sort (CCS)**:
    - Count elements smaller than each and sort.
    - **Efficiency**: \( O(n^2) \).
  - **Distribution Counting Sort**:
    - Count occurrences and compute distributions.
    - **Efficiency**: \( O(n) \) (if range of values is small).

#### **2. Pre-structuring**

- Use additional structures to facilitate faster data access.
- Examples:
  - **Hashing**:
    - Use a hash table to map keys to values for fast insertion, deletion, and search.
    - Operations: **\( O(1) \)** (average case), **\( O(n) \)** (worst case if collisions).

---

### **3. Hashing**

#### **Key Concepts**

- **Hash Table**:
  - Array where a **hash function** maps keys to array indices.
  - For non-numerical keys (e.g., strings), keys are mapped to numbers first.
  - Example: \( h(key) = key \mod m \) (for numerical keys).

#### **Collision Handling**

1. **Separate Chaining**:
   - Each bucket points to a list of entries.
2. **Closed Hashing with Linear Probing**:
   - Linearly scan for the next free bucket in case of collision.
   - Treat the table as circular.
   - **Important**: Table size must ≥ number of keys.

#### **Hash Function Quality**

- Good hash functions:
  - Uniformly distribute keys.
  - Produce distinct hash codes for similar keys.

#### **Hashing Strings**

- **Simple Hash**: \( h = \sum \text{ord}(ci) \mod m \).
  - Example: “dog” and “god” may hash to the same bucket.
- **Improved Hash**: \( h = \sum \text{ord}(ci) \cdot \alpha^i \mod m \).
  - Example:
    - \( \alpha = 128, m = 99 \):
    - "dog" → 89, "god" → 44.

---

### **4. String Matching with Input Enhancement**

#### **Brute Force Algorithm**

1. Align pattern with the start of text.
2. Compare characters until:
   - Match found, or
   - Mismatch (shift pattern by one position and repeat).
3. **Efficiency**: \( O((n-m+1) \cdot m) \).

#### **Improved Algorithm**

- Use a **shift table** to determine how far to shift the pattern upon mismatch.
- **Shift Table Construction**:
  - Calculate shifts for each character in the pattern.
  - Example: Pattern = "IDIGDAB", Alphabet = \{A, B, ..., J\}.
    - \( T(A) = 3, T(B) = 1, T(D) = 2, T(G) = 4, T(I) = 5 \).

---

### **5. Sorting with Space/Time Trade-offs**

#### **Comparison Counting Sort**

- For each element, count how many are smaller.
- **Efficiency**: \( O(n^2) \).

#### **Distribution Counting Sort**

1. Count occurrences of each value.
2. Compute positions based on cumulative counts.
3. Rearrange elements.

- **Efficiency**: \( O(n) \) (if range of values is small).

#### **When to Use Distribution Counting Sort**

- When the range of input values is limited (e.g., [0, 100]).

---

### **6. Hashing Efficiency**

| **Operation** | **Average Case** | **Worst Case** |
| ------------- | ---------------- | -------------- |
| Insert        | \( O(1) \)       | \( O(n) \)     |
| Search        | \( O(1) \)       | \( O(n) \)     |
| Delete        | \( O(1) \)       | \( O(n) \)     |

---

### **7. Practical Applications**

1. **Hash Tables**:

   - Use for fast storage and retrieval of records.
   - Key-Value pairs:
     - Insert: \( O(1) \).
     - Retrieve: \( O(1) \).

2. **String Matching**:

   - Improve efficiency with **input enhancement**:
     - Precompute **shift tables**.
     - Reduce unnecessary comparisons.
   - **Efficiency**: Improved compared to brute force.

3. **Sorting**:
   - Pre-sorting benefits repeated searches with \( O(n \log n) \) preprocessing time.

---

# Cheat Sheet: Data Structures and Graphs (Lecture 7)

---

### **1. Fundamental Data Structures**

#### **Array**

- Fixed-size sequence of elements.
- **Advantages**: Fast access (\( O(1) \)).
- **Disadvantages**: Slow insertion/deletion (\( O(n) \)).

#### **Linked List**

- **Singly**: Node with data + pointer to the next node.
- **Doubly**: Pointers in both directions.
- **Advantages**: Dynamic size, fast insertion/deletion.
- **Disadvantages**: No random access (\( O(n) \)).

#### **Stack** (LIFO)

- Operations:
  - Push (insert).
  - Pop (remove).
  - Peek (view top item).
- **Applications**:
  - Balanced parentheses.
  - Function call tracking (recursion).

#### **Queue** (FIFO)

- Operations:
  - Enqueue (add to the end).
  - Dequeue (remove from the front).
- **Applications**:
  - Breadth-first search.
  - Print job scheduling.

#### **Set**

- Stores unique elements.
- **Operations**:
  - Add, remove, check membership (\( O(1) \) with hash-based sets).
- **Java Implementations**:
  - HashSet (unordered, fast).
  - TreeSet (ordered, slower).

#### **Map (Dictionary)**

- Key-value pair storage.
- **Operations**: Insert, retrieve, delete (\( O(1) \) with hash-based maps).

---

### **2. Graph Basics**

#### **Graph Representation**

1. **Adjacency Matrix**:
   - \( |V| \times |V| \) matrix.
   - Best for dense graphs.
   - Space: \( O(|V|^2) \).
2. **Adjacency List**:
   - List of neighbors for each vertex.
   - Best for sparse graphs.
   - Space: \( O(|V| + |E|) \).

#### **Graph Types**

- **Connected**: Path exists between every pair of vertices.
- **Cyclic/Acyclic**: Presence/absence of cycles.
- **Tree**: Connected, acyclic graph.
- **Weighted Graph**: Edges have weights.

---

### **3. Graph Traversal Algorithms**

#### **Depth-First Search (DFS)**

- **Method**: Explore as far as possible, backtracking at dead-ends.
- **Data Structure**: Stack (explicit or recursion).
- **Efficiency**:
  - Adjacency Matrix: \( O(|V|^2) \).
  - Adjacency List: \( O(|V| + |E|) \).
- **Applications**:
  - Pathfinding (e.g., maze solving).
  - Cycle detection.
  - Connected components.

```pseudo
Algorithm Depth_First_Search(Graph G):
  initialize visited to false for all vertices
  for each vertex v in G.V:
    if v is not visited:
      dfs_helper(v)

function dfs_helper(Vertex v):
  visit v
  for each w in G.adj[v]:
    if w is not visited:
      dfs_helper(w)
```

---

#### **Breadth-First Search (BFS)**

- **Method**: Visit all neighbors first, then their neighbors.
- **Data Structure**: Queue.
- **Efficiency**:
  - Adjacency Matrix: \( O(|V|^2) \).
  - Adjacency List: \( O(|V| + |E|) \).
- **Applications**:
  - Shortest path (unweighted graphs).
  - Spanning trees.

```pseudo
Algorithm Breadth_First_Search(Graph G):
  initialize visited to false for all vertices
  for each vertex v in G.V:
    if v is not visited:
      bfs_helper(v)

function bfs_helper(Vertex v):
  visit v
  initialize Queue Q
  Q.enqueue(v)
  while Q is not empty:
    for each w in G.adj[Q.front]:
      if w is not visited:
        visit w
        Q.enqueue(w)
    Q.dequeue()
```

---

### **4. Tree Traversals**

#### **Traversal Types**

1. **Preorder**:
   - Root → Left → Right.
2. **Inorder**:
   - Left → Root → Right.
3. **Postorder**:
   - Left → Right → Root.

#### **Pseudocode**

```pseudo
Algorithm preOrder(Node N):
  if N != null:
    visit(N)
    preOrder(N.left)
    preOrder(N.right)

Algorithm inOrder(Node N):
  if N != null:
    inOrder(N.left)
    visit(N)
    inOrder(N.right)

Algorithm postOrder(Node N):
  if N != null:
    postOrder(N.left)
    postOrder(N.right)
    visit(N)
```

---

### **5. Graph Problems and Applications**

#### **Problem 1: Spanning Tree**

- Use BFS/DFS to find a spanning tree.
- **BFS Advantage**: Shorter paths between vertices.

#### **Problem 2: Maze Solving**

- **DFS**: Efficient for walking through a maze.
- **BFS**: Finds the shortest path.

#### **Problem 3: Shortest Path**

- Use BFS to find the shortest path in unweighted graphs.
- Spanning tree ensures shortest paths.

#### **Problem 4: Connectivity**

- Check if all vertices are reachable.
- Use BFS/DFS to explore the graph.

---

### **6. Efficiency Summary**

| **Algorithm**   | **Adjacency Matrix** | **Adjacency List** |
| --------------- | -------------------- | ------------------ | ------ | ----- | --- | --- | --- | ---- |
| DFS             | \( O(                | V                  | ^2) \) | \( O( | V   | +   | E   | ) \) |
| BFS             | \( O(                | V                  | ^2) \) | \( O( | V   | +   | E   | ) \) |
| Tree Traversals | \( O(n) \)           | N/A                |

---

# Cheat Sheet: Solving Problems with Graph Algorithms (Lectures 8 and 9)

---

### **1. Two Strategies for Problem Solving**

1. **Modify a Known Graph Algorithm**:
   - Adapt algorithms like BFS or DFS to solve specific problems (e.g., track output, add counters).
2. **Use a Known Graph Algorithm as a Black Box**:
   - Represent the problem as a graph.
   - Feed the graph into a standard algorithm to derive the solution.

---

### **2. Connected Components**

- **Problem**: Count the connected components in a graph \( G \).
- **Approach**: Modify DFS or BFS:
  - Add a counter in the main loop to track how many times the helper function is called.
  - Each call represents a new connected component.
- **Efficiency**:
  - Adjacency Matrix: \( O(|V|^2) \).
  - Adjacency List: \( O(|V| + |E|) \).

---

### **3. Topological Sorting**

#### **Definition**

- **Topological Sort**: Linear ordering of tasks such that if task \( A \) depends on \( B \), \( B \) appears before \( A \).
- Only possible for **Directed Acyclic Graphs (DAGs)**.

#### **Algorithms**

1. **DFS-Based**:

   - Perform DFS on the graph.
   - Record vertices in the reverse order of when they become "dead ends."
   - **Efficiency**: \( O(|V| + |E|) \).

   ```pseudo
   Algorithm TopoSortDFS(Graph G):
     Initialize visited to false for all vertices
     Initialize an empty stack S
     for each vertex v in G.V:
       if v is not visited:
         dfs_helper(v, S)
     Reverse the stack S for the topological order
   ```

2. **Decrease-by-One and Conquer**:

   - Identify vertices with \( \text{in-degree} = 0 \).
   - Add such vertices to the result and remove them from the graph.
   - Repeat until all vertices are processed.
   - **Efficiency**: \( O(|V| + |E|) \).

   ```pseudo
   Algorithm TopoSortDecreaseByOne(Graph G):
     Initialize Candidates (vertices with in-degree 0)
     Initialize ArrayList A for result
     while Candidates is not empty:
       Select vertex v from Candidates
       Add v to A
       Remove v and its edges from G
       Update in-degrees and add new candidates
   ```

---

### **4. Greedy Algorithms**

#### **Overview**

- Always make the "best" local choice at each step.
- Used for optimization problems.
- **Key Properties**:
  - **Feasibility**: Must satisfy constraints.
  - **Local Optimality**: Best choice at each step.
  - **Irrevocability**: Choices cannot be undone.

---

#### **Applications of Greedy Algorithms**

1. **Minimum Spanning Tree (MST)**

   - **Problem**: Connect all vertices in a graph with the minimum total edge weight.

   **Prim’s Algorithm**:

   - Start with any vertex.
   - Add the smallest edge connecting the tree to a new vertex.
   - Repeat until all vertices are included.
   - **Efficiency**: \( O(|E| \log |V|) \) with priority queue.

   ```pseudo
   Algorithm Prim(G):
     Initialize VT = {v0}, ET = ∅
     While |VT| < |V|:
       Find min-weight edge (u, v) where u ∈ VT and v ∉ VT
       Add v to VT and edge (u, v) to ET
     Return MST = (VT, ET)
   ```

   **Kruskal’s Algorithm**:

   - Sort all edges by weight.
   - Add the smallest edge that doesn’t form a cycle.
   - **Efficiency**: \( O(|E| \log |E|) \).

   ```pseudo
   Algorithm Kruskal(G):
     Sort edges by weight
     Initialize empty MST (VT = V, ET = ∅)
     For each edge e in sorted order:
       If adding e does not create a cycle:
         Add e to ET
     Return MST = (VT, ET)
   ```

---

2. **Single-Source Shortest Paths (Dijkstra’s Algorithm)**

   - **Problem**: Find the shortest path from a source vertex to all others.
   - **Key Idea**: Greedily add the closest unprocessed vertex and relax its neighbors.
   - **Efficiency**: \( O((|V| + |E|) \log |V|) \) with priority queue.

   ```pseudo
   Algorithm Dijkstra(G, source):
     Initialize d[v] = ∞ for all vertices except d[source] = 0
     Add all vertices to priority queue PQ with d[v] as key
     While PQ is not empty:
       u = PQ.removeMin()
       For each neighbor v of u:
         If d[u] + weight(u, v) < d[v]:
           d[v] = d[u] + weight(u, v)
           PQ.updateKey(d[v], v)
   ```

---

3. **Graph Coloring**
   - **Problem**: Assign colors to vertices such that no two adjacent vertices share the same color.
   - **Greedy Approach**:
     - Process vertices in a specific order.
     - Assign the smallest available color.
   - **Efficiency**: \( O(|V| + |E|) \) for adjacency list.

---

### **5. Strategy 2: Solving Problems by Representing as Graphs**

#### **Example Problems**

1. **Connected Components**:

   - Use DFS or BFS to count components.
   - Represent problem as a graph where vertices are objects and edges represent relationships.

2. **Hex Tile Regions**:

   - Represent each tile as a vertex.
   - Connect vertices if tiles are adjacent and of the same color.
   - Count connected components.

3. **Shortest Path**:

   - Use Dijkstra’s algorithm for weighted graphs.
   - BFS for unweighted graphs.

4. **Spanning Tree**:

   - Apply Prim’s or Kruskal’s algorithm to find an MST.

5. **Maze Solving**:
   - Represent the maze as a graph.
   - Use BFS for the shortest path or DFS for exploration.

---

### **6. Efficiency Summary**

| **Algorithm**        | **Efficiency (Adj. Matrix)** | **Efficiency (Adj. List)** |
| -------------------- | ---------------------------- | -------------------------- | ------ | ------ | ---- | ----- | --- | ------ | --- | ---- |
| DFS                  | \( O(                        | V                          | ^2) \) | \( O(  | V    | +     | E   | ) \)   |
| BFS                  | \( O(                        | V                          | ^2) \) | \( O(  | V    | +     | E   | ) \)   |
| Prim’s Algorithm     | \( O(                        | V                          | ^2) \) | \( O(  | E    | \log  | V   | ) \)   |
| Kruskal’s Algorithm  | \( O(                        | E                          | \log   | E      | ) \) | \( O( | E   | \log   | E   | ) \) |
| Dijkstra’s Algorithm | \( O(                        | V                          | ^2) \) | \( O(( | V    | +     | E   | ) \log | V   | ) \) |

---

# Cheat Sheet: Dynamic Programming (Lecture 10)

---

### **1. Key Concepts of Dynamic Programming (DP)**

- **Definition**: Use previously solved subproblems to build the solution for the overall problem.
- **Steps**:
  1. Decompose the problem into subproblems.
  2. Define a recursive relation to solve the subproblems.
  3. Store the results of subproblems (memoization).
  4. Use a table (bottom-up) to compute the optimal solution.
- **Applications**: Problems with overlapping subproblems and optimal substructure (e.g., Fibonacci, coin collecting, shortest paths).

---

### **2. Space-Time Trade-off in DP**

- **Idea**: Save results of subproblems to avoid recomputation, trading space for time efficiency.
- **Example**: Fibonacci numbers
  - **Naive Recursive**: \( O(2^n) \) time.
  - **Top-down (Memoization)**: \( O(n) \) time, \( O(n) \) space.
  - **Bottom-up**: \( O(n) \) time, \( O(1) \) space.

---

### **3. Dynamic Programming Examples**

#### **Fibonacci Numbers**

- **Top-down (Memoization)**:
  ```pseudo
  Fib(n):
    if n <= 1: return n
    if memo[n] is not computed:
      memo[n] = Fib(n-1) + Fib(n-2)
    return memo[n]
  ```
- **Bottom-up**:
  ```pseudo
  Fib(n):
    f[0] = 0, f[1] = 1
    for i = 2 to n:
      f[i] = f[i-1] + f[i-2]
    return f[n]
  ```

---

#### **Coin-Collecting Robot**

- **Problem**: Maximize coins collected from top-left to bottom-right on an \( n \times m \) grid.
- **Recursive Relation**:
  \[
  F(i, j) = \max(F(i-1, j), F(i, j-1)) + c\_{ij}
  \]
  - \( c\_{ij} \): coins in cell \( (i, j) \).
- **Boundary Conditions**:
  - \( F(0, j) = 0 \) for \( j \), \( F(i, 0) = 0 \) for \( i \).
- **Bottom-up Approach**:
  - **Time Complexity**: \( O(nm) \).
  - **Space Complexity**: \( O(nm) \).

---

#### **Transitive Closure (Warshall's Algorithm)**

- **Problem**: Determine reachability in a directed graph (\( G = (V, E) \)).
- **Key Idea**:
  - Add edges to represent all reachable paths.
  - Update adjacency matrix \( R \) iteratively.
- **Recursive Relation**:
  \[
  R[i, j] = R[i, j] \lor (R[i, k] \land R[k, j])
  \]
- **Algorithm**:
  ```pseudo
  Warshall(R):
    for k = 1 to n:
      for i = 1 to n:
        for j = 1 to n:
          if R[i, k] and R[k, j]:
            R[i, j] = 1
  ```
- **Complexity**: \( O(n^3) \).

---

#### **All-Pairs Shortest Paths (Floyd's Algorithm)**

- **Problem**: Find shortest paths between all pairs of vertices in a weighted graph.
- **Key Idea**:
  - Update paths by considering one intermediate vertex at a time.
- **Recursive Relation**:
  \[
  G[i, j] = \min(G[i, j], G[i, k] + G[k, j])
  \]
- **Algorithm**:
  ```pseudo
  Floyd(G):
    for k = 1 to n:
      for i = 1 to n:
        for j = 1 to n:
          if G[i, k] + G[k, j] < G[i, j]:
            G[i, j] = G[i, k] + G[k, j]
  ```
- **Complexity**: \( O(n^3) \).

---

### **4. Dynamic Programming: General Process**

1. **Understand the problem**: Identify subproblems and their relationships.
2. **Recursive definition**: Write a relation for solving the subproblems.
3. **Data structure**: Decide how to store results (array, matrix, etc.).
4. **Algorithm**: Calculate and fill the data structure iteratively (bottom-up).

---

### **5. Key Algorithms**

| **Algorithm**         | **Problem**                       | **Complexity**           |
| --------------------- | --------------------------------- | ------------------------ |
| Fibonacci (Bottom-up) | Compute Fibonacci sequence        | \( O(n) \), \( O(1) \)   |
| Coin Collecting Robot | Maximize coins on grid            | \( O(nm) \), \( O(nm) \) |
| Warshall’s Algorithm  | Transitive closure (reachability) | \( O(n^3) \)             |
| Floyd’s Algorithm     | All-pairs shortest paths          | \( O(n^3) \)             |

---

### **6. TL/DR**

- **Dynamic Programming** is solving problems by building solutions to smaller subproblems.
- **Key Features**:
  - Overlapping subproblems.
  - Optimal substructure.
- **Approach**:
  - Define subproblems recursively.
  - Store intermediate results.
  - Compute iteratively or recursively.
- **Applications**: Graph problems, pathfinding, optimization problems, sequence alignment, etc.

# Cheat Sheet: Backtracking & Branch and Bound (Lecture 11)

---

### **1. Backtracking**

#### **Concept**

- **Purpose**: Solve problems by exploring all possible solutions in a systematic way.
- **Approach**:
  - Construct solutions incrementally.
  - Abandon solutions ("backtrack") as soon as they are deemed invalid or non-promising.
- **State-Space Tree**:
  - Root: Represents the initial state.
  - Nodes: Represent partial solutions.
  - Edges: Represent choices or decisions.

#### **Algorithm**

1. Start with the root (initial state).
2. Make a choice and move to the next level in the state-space tree.
3. If the partial solution is promising, continue.
4. If it is not promising, backtrack to the previous level and try the next option.
5. Repeat until a solution is found or all options are exhausted.

---

#### **Example Problems**

##### **1. N-Queens Problem**

- **Goal**: Place \( n \) queens on an \( n \times n \) chessboard such that no two queens attack each other.
- **Constraints**:
  - Only one queen per row, column, or diagonal.
- **Approach**:
  - Place one queen at a time (level of tree = row of the board).
  - If the placement violates constraints, backtrack.
  - If all queens are placed successfully, it is a solution.

**Pseudocode**:

```pseudo
function solveNQueens(board, row):
  if row == n:
    print(board)  // Solution found
    return
  for col in range(n):
    if isSafe(board, row, col):
      placeQueen(board, row, col)
      solveNQueens(board, row + 1)
      removeQueen(board, row, col)  // Backtrack
```

---

##### **2. Hamiltonian Cycle**

- **Goal**: Find a cycle in a graph that visits each vertex exactly once and returns to the starting vertex.
- **Approach**:
  - Build the path vertex by vertex.
  - If adding a vertex violates the constraints, backtrack.
  - If the path includes all vertices and forms a cycle, it is a solution.

---

### **2. Branch and Bound**

#### **Concept**

- **Purpose**: Solve optimization problems more efficiently than brute force.
- **Key Idea**:
  - Use a **bounding function** to eliminate large portions of the search space that cannot lead to an optimal solution.
  - Explore only "promising" nodes in the state-space tree.

#### **Steps**

1. **Bounding Function**:
   - Compute a bound for the objective function at each node.
   - If the bound is worse than the best solution so far, prune the node (do not expand it).
2. **Promising Nodes**:
   - Nodes with bounds better than the current best solution are expanded further.
3. **Optimality**:
   - Repeat until the optimal solution is found or the entire tree is pruned.

---

#### **Example Problems**

##### **1. Traveling Salesperson Problem (TSP)**

- **Goal**: Find the shortest tour visiting all cities exactly once and returning to the start.
- **Bounding Function**:
  - Use the **lower bound of the cost** (e.g., minimum spanning tree + nearest neighbor costs).
- **Approach**:
  - Start from the root (initial city).
  - Add cities to the tour incrementally.
  - Compute bounds for partial solutions.
  - Prune branches where the bound exceeds the current best tour cost.

---

##### **2. Knapsack Problem**

- **Goal**: Maximize the value of items placed in a knapsack without exceeding its weight limit.
- **Bounding Function**:
  - Calculate the maximum possible value of items that can fit, assuming fractional values (relaxation of constraints).
- **Approach**:
  - Start with an empty knapsack.
  - Add items incrementally.
  - Use the bounding function to prune branches where the bound is lower than the current best value.

**Pseudocode**:

```pseudo
function branchAndBoundKnapsack(items, capacity):
  initialize PQ with root node (empty knapsack)
  bestValue = 0
  while PQ is not empty:
    node = PQ.removeHighestPriority()
    if node.bound > bestValue:
      if node.isLeaf():
        bestValue = max(bestValue, node.value)
      else:
        for child in node.children():
          if child.bound > bestValue:
            PQ.add(child)
  return bestValue
```

---

### **3. Key Differences: Backtracking vs Branch & Bound**

| **Aspect**            | **Backtracking**                       | **Branch and Bound**                          |
| --------------------- | -------------------------------------- | --------------------------------------------- |
| **Purpose**           | Systematically explore all solutions.  | Solve optimization problems more efficiently. |
| **Pruning Criterion** | Constraints on valid solutions.        | Bounding function based on optimization goal. |
| **Usage**             | Feasibility problems (e.g., N-Queens). | Optimization problems (e.g., TSP, Knapsack).  |

---

### **4. Efficiency Tips**

- For both techniques, performance depends on:
  1. How quickly you detect unpromising nodes.
  2. How effectively you prune the search space.
- Use heuristics to guide the search and improve runtime.

---

### **5. TL/DR**

- **Backtracking**:

  - Explore all possible solutions in a systematic DFS-like manner.
  - Backtrack when constraints are violated.
  - Examples: N-Queens, Hamiltonian Cycle.

- **Branch and Bound**:
  - Use bounds to prune non-promising nodes in optimization problems.
  - Focus on finding optimal solutions efficiently.
  - Examples: TSP, Knapsack.

Let me know if you'd like expanded explanations or examples!

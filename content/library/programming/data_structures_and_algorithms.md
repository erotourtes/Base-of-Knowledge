---
title: "Data structures and algorithms"
date: 2022-08-22T15:13:19+03:00
draft: true
tags: ["programming", "algorithms", "java"]
summary: Recap algorithms
math: true
---

# [Created with Mosh](https://codewithmosh.com/p/data-structures-algorithms)

## Big O notation
Big O uses to describe the performance of an algorithm  
lim->imfinity
- Constant `O(1)`  
O(1+1+...+n) = O(1)
- Linear `O(n)`  
O(n+n+...+n) = O(n)
- Quadratic `O(n^2)`  
O(n + n^2) = O(n^2)
- Logarithmic `O(log n)`
- Exponential `O(2^n)`
![image of big O](https://miro.medium.com/max/1400/1*5ZLci3SuR0zM_QlZOADv8Q.jpeg)

---
## Arrays
### O
- Lookup 
  - by index `O(1)`
  - by value `O(n)`
- Insert `O(n)`
- Delete `O(n)`
### Implementations
- ArrayList
- Vector

---
## Linked List
### O
- Lookup 
  - by index `O(n)`
  - by value `O(n)`
- Insert 
  - Head `O(1)`
  - Tail `O(1)`
  - Middle `O(n)`
- Delete
  - Head `O(1)`
  - Tail `O(n)`
  - Middle `O(n)`
### Implementations
- LinkedList
### Popular tasks
- Implement
- Find Middle (without size) in one path
- Find kth element from end (without size) in one path
- Check if has loop

---
## Stack
Last in First out (LIFO)
### O 
All operation runs in `O(1)`
### Implementations
- Stack
### Popular tasks
- Implement
- Reversing strings
- Balanced expressions (if has closed brackets -> { [<>] ()} --> true)
- Min Stack

---
## Queues
First in First out (FIFO)
### O 
All operation runs in `O(1)`
### Implementations
- ArrayDeque, LinkedList
### Popular tasks
- Implement
- Reversing a queue (only with add, remove, isEmpty)
- Implement a queue with array (hint: circular array)
- Implement a queue with stack

---
## HashTable
Key and Value pair

Map can store `null` in keys and values in Java  

  Handle Collisions 
- chaining (put items in a list)
- oppen addrasing 
  - linear probing (makes a claster, so with time handling collisions will be slower)  
  `(hash(key) + i) % table_size`
  - quadratic probing (it's slolves cluster problem, but has a chance to fall in an infinitive loop)  
  `(hash(key) + 1^2) % table_size`
  - double hashing  
  ```
  hash2(key) = prime - (key % prime)  // something that works (prime -> prime number smaller than table size)
  (hash1(key) + i * hash2(key)) %  table_size
  ```

### O 
All operation runs in `O(1)`  
Very very very hardly ever `O(n)` because Implemented using Arrays  
`O(n)` almost never happend so speed is `O(1)`  
### Implementations
- HashMap, HashSet
### Popular tasks
- Implement
- Find the first non-repeated character in a string
- Find the first repeated character in a string
- Find most frequent element in array
- Get number of pairs with difference K
- Get indices of the two numbers with sum K

---
## Binary Searched Tree
```goat
           Root 
             o
             |                        
             |
      leaf --+-- leaf
```

### Traversing
```goat
      7
      |      
  .---+---.  
  |       |                   
  4       9
.-+-.   .-+-.
|   |   |   |
1   6   8   10
```
- Breadth First `level order`
  > 7, 4, 9, 1, 6, 8, 10
- Depth First
  - Pre-order`Root, left, right`
  > 7, 4, 1, 6, 9, 8, 10
  - In-order `left, Root, right`
  > 1, 4, 6, 7, 8, 9, 10
  - Post-order `left, right, Root`
  > 1, 6, 4, 8, 10, 9, 7


- Depth
```goat
      7 (0)
      |      
  .---+---.                   
  |       |  
  4 (1)   9 (1)
```

- Height 
```goat
      7 (3)
      |      
  .---+---.                    
  |       |  
  4 (1)   9 (1)
          |
          +-.
            |
            10 (0)
```
  
### O 
- Lookup `O(log n)`
- Insert `O(log n)`
- Delete `O(log n)`
> tree can have `O(n)`  
if not structured properly

> h (height) = `O(log n)` >> `O(h) == O(log n)`
### Implementations
### Popular tasks
- Implement
- Traversing (pre-, in-, post- order, and level order)
- Get Min value (recursion and loop)
- Check if tree is equal to another tree
- Check if is Binary Search tree (every left child is less, and right shild is greater than ancestor)
- Print Nodes at K Distance 
- Calculate size
- Count the number of leaves in a binary tree
- Are elements siblings (3 < 5 > 7 -> 3 and 7 are siblings)
- Get Ancestors of a value (in List)

---
## AVL Trees
Worst case scenario when tree becomes right/left skewed
> 1 > 2 > 10 > 100 -> right skewed tree  

Self-balancing trees
- AVL Trees
- Red-black Trees
- etc.

### Rotations
- left
```goat
0 1 2                 2
  |                   |
  +-.       >       .-+-.                  
    |               |   |
  0 2 1             1   3
    +-.        
      |       
    0 3 0      
```
- right

```goat
    3               2
    |               |
  .-+      >      .-+-.                  
  |               |   |
  2               1   3
.-+        
|       
1      
```
- left-right
```goat
   9               9
  /               / 
 /               /     
5       >       7      >      7                  
 \             /            /   \
  \           /            /     \
   7         5            5       9
```
- right-left

```goat
5         5       
 \         \       
  \         \        
  10  >      7       >      7                  
  /           \           /   \
 /             \         /     \
7               10      5       9
```
[Visualize online](https://www.cs.usfca.edu/~galles/visualization/AVLtree.html)

### O 
- Lookup `O(log n)`
- Insert `O(log n)`
- Delete `O(log n)`
### Implementations
### Popular tasks
- Draw rotation
- Check if balanced (difference of every node's height of left sub-tree and right sub-tree less than 2)
- Is perfect (every leaf is full and leaves depth is the same)
```goat
        40            
       /  \          
      /    \          
    30      50     >  is perfect    
   /  \    /  \                   
  /    \  /    \                  
55    25  35   55       
```

---
## Heaps
Special tipe of tree that is
- complete 
> All levels except the last one should be full of nodes, and  
nodes are inserted from left to right
- all child less than ancestor
> called `heap property`
```goat
     o            o                                
    / \          / \                              
   o   o        o   o                            
  /            /   /                                
 o            o   o                                

(complete)   (not complete)
```

How a MaxHeap will insert [40, 30, 20, 50]
```goat
40    40    40     
     /     /  \                            
    30   30    20  
```
Bubling up
```goat
       40                                 
      /  \  
    30    20
   /       
  50  <   
          
       40   
      /  \  
 >  50    20
   /        
  30        
         
   >  50   
     /  \  
   40    20
  /        
 30        
```
Bubling down
```goat
     50         >  30            40                     
    /  \          /  \          /  \                     
  40    20      40    20   >  30    20                   
 /                                                      
30                                                     
```
> in this example we'll remove 50


### O
- Lookup 
  - max (min) `O(1)` 
- Insert `O(log n)`
- Delete `O(log n)`
### Implementations
### Popular tasks
- Implement
- Heapify regular array
- Get Kth larges item 
> {5, 3, 8} > k = 1 -> 8
- Check if array represents MaxHeap

---
## Tries
Comes from re**trie**val
> Other names: Digital, Radix, Prefix
### O 
- Lookup `O(L)`
- Insert `O(L)`
- Delete `O(L)`
> O(L) stands for Length of word, for word `hello` > 5
### Implementations
### Popular tasks
- Implement 
- Find longest common Prefix
> [care, careful, car] -> car


---
## Graphs
Node - vertex  
Two directrly connected nodes - neighbours / adjacents  
Can be directed or undirected Graphs  
### O 
#### Implementations By 
- Adjacency matrix  

|        	| Clara 	| Sophie 	| John 	|
|--------	|-------	|--------	|------	|
| Clara  	| 0     	| 0      	| 1    	|
| Sophie 	| 1     	| 0      	| 0    	|
| John   	| 1     	| 1      	| 0    	|

- Adjacency list

> V stands for Vertixes  

>E stands for Edges  
E = V * (V - 1) \\(\approx\\) \\(V^{2}\\) in the worst case scenario

>K stands for Edges current node has  
K = V in the worst case scenario

|  | Matrix                      	| List                        	| List (worst case scenario) |
|--|-----------------------------	|-----------------------------	|--------------------------- |
| Space   | **O( \\(V^{2}\\) )** 	| **O(V+E)**    	              | **O( \\(V^{2}\\) )**       |
| Add Edge | **O(1)**            	| **O(K)**           	          | **O(V)**           	       |
| Remove Edge |  **O(1)**        	| **O(K)**                      | **O(V)**                   |
| Query Edge | **O(1)**          	| **O(K)**         	            | **O(V)**         	         |
| Find neighbours | **O(V)**     	| **O(K)**                     	| **O(V)**                   |
| Add node | **O(V)**            	| **O(1)**                     	| **O(1)**                   |
| Remove node | **O( \\(V^{2}\\) )** | **O( \\(V^{2}\\) )**       | **O( \\(V^{2}\\) )**       |

### Popular tasks
- Check if has a cycle (all visiting visited)
- Topological sorting
```goat
    A
X >    > P  > result [X, A, B, P] or [X, B, A, P]
    B
```

---
## Undirected Graphs
### Popular tasks
- Find the shortest distance (Dijkstra’s Shortest Path Algorithm)
- Check if has a cycle
- Minimum Spanning tree (Prim's Algorithm)
```goat
     2                2   
   A---B            A---B 
   |1 /|             1 /  
 3 | / | 4    >       /   
   C---D            C---D 
     5                5   
```

## Sorting
### Bubble sort
|  | Best | Worst |
|--|------|-------|
|Passes| O(n) | O(n) |
|Comparisons| O(n) | O(n) |
|Total | O(n) | O( \\(n^{2}\\) ) |

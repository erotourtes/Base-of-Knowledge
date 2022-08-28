---
title: "Data structures and algorithms"
date: 2022-08-22T15:13:19+03:00
draft: true
tags: ["programming", "algorithms", "java"]
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
- Reversing strings
- Balanced expressions
- Min Stack

---
## Queues
First in First out (FIFO)
### O 
All operation runs in `O(1)`
### Implementations
- ArrayDeque, LinkedList
### Popular tasks
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
### Popular tasks for HashTable 
- Find the first non-repeated character in a string
- Find the first repeated character in a string
- Find most frequent element in array
- Get number of pairs with difference K
- Get indices of the two numbers with sum K


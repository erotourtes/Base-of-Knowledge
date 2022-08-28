---
title: "Java basics"
date: 2022-08-21T09:53:28+03:00
draft: true
tags: ["java", "programming"]
---

# [Created with Mosh](https://codewithmosh.com/p/data-structures-algorithms)

## Theory

### JVM
`Java code` compiled to `Bytecode` than `jvm` convertes it to `native code` for platform  

---
- ### Boxing
When Primitive types convertes to Reference
```java
public static void method(Integer value) {} 

public static void main(String[] args) {
  method(1); //boxed int into Integer
}
```
- ### Unboxing
When Reference types convertes to Primitive 
```java
public static void method(int value) {} 

public static void main(String[] args) {
  method(Integer.valueOf(1)); //unboxed Integer into int
}
```

---
### Casting
#### Implicit casting
```java
short a = 1;
int b = a + 1;
```

#### Explicit casting
```java
double a2 = 1.2;
int b2 = 1 + (int) a2;
```

---
### Types of Errors
- Compile time
- Run time  
[For more info](#errors)
    

---
### Coupling
- We use interfaces to build loosely-coupled, extensible and testable
applications.

- Tightly-coupled code is code that is hard to change because there is a strong dependency between the entities (eg classes) in the code.  
Changing one class may result in several cascading, breaking changes in the code.


---
### Method Overloading and overwriting


---
### Principals of OOP
- _Encapsulation_: bundling the data and operations on the data inside
a single unit (class).
- _Abstraction_: reducing complexity by hiding unnecessary details
(metaphor: the implementation detail of a remote control is hidden
from us. We only work with its public interface.)
- _Inheritance_: a mechanism for reusing code.
- _Polymorphism_: a mechanism that allows an object to take many
forms and behave differently. This will help us build extensible
applications.

### Diamond problem 
Comes with `Multiple inheritance`  
If parents of class have same method which one should be using?


### Dependencies
Dependency injection refers to passing or injecting dependencies of a
class.

We can inject dependencies via
- constructors
- setters
- regular methods


---
## Math operations
```java
int resultInt = 10 / 3;
double resultDouble = (double) 10 / 3;
//int result = (double)10 / 3; //error

System.out.println(resultInt);
System.out.println(resultDouble);
```

---
## Fixed arrays
```java
public static void main(String[] args) {
  int[] numbers = new int[5];
  int[] numbersSecond = {1, 2, 3};

  System.out.println(numbersSecond[0]);
  System.out.println(Arrays.toString(numbers));
}
```

---
## Reading from user
```java
Scanner scanner = new Scanner(System.in);
b = scanner.nextInt();
System.out.println(b);
```

---
## Switch statement
```java
switch (2) {
  case 1:
    System.out.println("1");
    break;
  case 2:
    System.out.println("2");
    break;
  default:
    System.out.printf("None");
}
```

---
## Errors
- checked
- checked in compiled time
- unchecked
  
- Exception (e.g. null pointer exception)
- Error (e.g. out of memory (external to app))


```goat
         throwable
             |
             |
exception ---+--- error
(checked)
    |
    |
runtimeException 
(unchecked)

```

```java
try {}
catch ( exception1 | exception2 ex) {}
finally { close some resources }
```

or

```java
// try / resources statement
try(resource) {}
catch() {}
```

```java
method() throws IOException { throw IOException }
```

```java
class SomeException extends Exception {
  public SomeException(String message) {
    super(message);
  }
}
```

Chaining exceptions

```java
SomeException.initCause(new AnotherException());
```


---
## Generics
### Example
```java
class List<T, E> {
  private T[] array = new (T[])Object[10];
}


class ClassName {
  public <K, V > T method (K param1, V param2) {}
}

```

### Constraints 
`(T extends Number & Comparable)`

### Under the hood
`class ClassName<T extends Number & Comparable>() {}`
In bytecode T will be changed on Number and Comparable will be erased (type erasure)
### Wildcards
```java
//class CAP#1
public void method(List<?> list) {

  method1(new ArrayList<Integer>());
  //method2(new ArrayList<Integer>()); // Error

  //method1(new ArrayList<Object>()); // Error
  method2(new ArrayList<Object>());
}

//only for reading
// Number and its childs (Integer, Float e.c.)
public static void method1(List<? extends Number> list) {
  //list.add(10); // Error
  var a =list.get(0); // Number
}

//only for writing
// Number and its parents (Objects) 
public static void method2(List<? super Number> list) {
    list.add(12);
    var a = list.get(10); // Object
}
```


---
## Lambda expression
### Anonymous class
```java
// Printer is and interface with single abstract method -> functional interface
Printer printer = new Printer() {
  @Override
    public void print(String message) {
      System.out.println("message form class:\t" + message);
    }
};

// somwhere in code
printer.print("Hello world");
```

### Lambda, method reference 
```java
Printer printer1 = message -> System.out.println("message form lambda:\t" + message);
printer1.print("Hello world");


Printer printer2 = System.out::println;
printer2.print("hello world");
```

`This` and state different in classes and lambda functions

### Build in interfaces
- consumers (takes a value and doesn't return)
- supplier (no input returns value)
- function (map value to different value)
- predicate (filtering data)
```java
List<Integer> list = List.of(1, 2, 3);
Consumer<Integer> print = System.out::println;
Consumer<Integer> print_another = item -> System.out.println("second time" + Integer.toString(item));
list.forEach(print.andThen(print_another));

//Lazy evaluation
Supplier<Double> getRandom = Math::random;
System.out.println(getRandom.get());

Function<String, Integer> map = str -> str.length();
System.out.println(map.apply("hello"));

Predicate<String> isLongerThan5 = str -> str.length() > 5;
System.out.println(isLongerThan5.test("hello"));
```

---
## Streams
Streams has `Terminal operations` and `Intermediate`
```java
int[] numbers = {1, 2, 3};
Arrays.stream(numbers)
  .forEach(System.out::println);

Stream.of(1, 2, 3, 4, 5)
  .map()
```

### Infinitive streams
```java
// lazy evaluation
var stream = Stream.generate(Math::random);
stream
  .limit(3)
  .forEach(System.out::print);

Stream
  .iterate(1.5, n -> n+1)
  .limit(3)
  .forEach(System.out::print);
```

### Map
```java
var list = List.of(new Point(1, 0), new Point(2, 0));

list.stream()
  .map(point -> point.getX())
  .forEach(System.out::println);
```

### FlatMap
Converts String<List<Integer>> to Stream<Integer>

```java
Stream.of(List.of(1,2,3), List.of(4,5,6))
  .flatMap(currentList -> currentList.stream())
  .forEach(System.out::println);
  // --- 1,2,3,4,5,6
```


### Reduce
  ```java
  Stream.of(1, 2, 3, 4, 1, 2, 3)
.reduce(Integer::sum)
  .orElse(0);
  ```

### Collectors
  ```java
  var list = List.of(new Point(1, 0), new Point(2, 0));

var mapOf = list.stream()
  .collect(Collectors.toMap(Point::getX, Function.identity()));

  // Group pointers by value X
Map<Double, Set<Point>> set = list.stream()
  .collect(Collectors.groupingBy(Point::getX, Collectors.toSet()));

list.stream()
  .collect(Collectors.groupingBy(Point::getX,
        Collectors.mapping(Point::getX, Collectors.toSet())));
// {2.0=[2.0], 1.0=[1.0]}
```

### Other operations
```java
Stream.of(1, 2, 3, 4, 4, 4, 4)
  .distinct()
  .sorted(Comparator.comparingInt(a -> a))
  .filter(x -> x > 1)
  .takeWhile(x -> x < 4)
  .peek(n -> System.out.println("n:" + n))
  .forEach(System.out::println);
  // --- 2, 3
```
```java
Stream.of(1, 4)
  .anyMatch(num -> num > 1);
```


### Primitive streams e.g. 
`IntStream.range().foreach();`


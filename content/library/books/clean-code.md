---
title: "Clean code"
date: 2024-04-10T16:58:21+03:00
draft: false
---


Knowledge is power, but you must watch yourself fail in order to leanrn.

# There will be code
Specifying requirements in such detail that a machine can execute is programming.
Not event a human can is able to do what a customer wants, and not what they say.
Wading - impeded by the bad code.
We all lock at the mess we've done, and leave it for another day.
> LeBlankc's law: Later equals never.

## The total cost of owning a mess

The fault is not only the manager's, but the major part is the developer's.
It's unprofessional for programmers to bend to the will of managers, who don't understand the rists of making messes.

### Clean code
Code should be elegant and efficient, not to tempt people to make the code messy.
Thus it should be full of crisp lines of control and without duplications to make it easy for other people to enchance, 
and has unit tests. It is a code that has been taken care of. 

Don't believe in all you read, behoove to learn.

## Meaningful Names
Names should reveal intent without a context.
### Avoid disinformation
### Make meaningful distinctions
ProductData, ProdactInfo - non-informative meaningless distinction
`getActiveAccount()`, getActiveAccounts() and `getActiveAccountsInfo()`
### Avoid encodings
NameString
### Avoid mental mapping
a, b, c - apples, bananas, cherries
### 1 word per concept
fetch, retrieve, get
### Problem domain names
Separate solution domain names from problem domain names

## Functions
Small, do one thing, do it well, do it only.
Function that is doing 1 thing can't be reasonably divided into smaller functions.
### One level of abstraction per function
It should describe the current level, and refference to the next one.
### Name
Long descriptive name is better than a long descriptive comment.
### Commoon monadic forms
Don't mix input arguments with output arguments.
### Flag arguments
Are ugly, as it implies that the function does more than one thing.
### Dyadic functions
assert(expected, actual)
### No side effects
as they are lies.
### Command query separation
Either do or answer
### DRY (Don't repeat yourself)

## Comments
// skip this section

## Data Abstraction
Procedural code makes it hard to add new data structures because all the functions must change.
OO code makes it hard to add new functions because all the classes must change.
### The law of Demeter
A module should not know about the innards of the objects it manipulates.
```java
// Appears to violate the Law of Demeter if they are not data structures, but have behavior.
final String outputDir = ctxt.getOptions().getScratchDir().getAbsolutePath();
```
It is better to ask to do smth
```java
final BufferdOutputStream bos = ctxt.createScratchFileStream(classFileName);
```
### DTOs, Bean, Active Record
```java
class Dto { // Pure data structure
  public String name;
}

class Bean { // Bean
  private String name;
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
}
```
Objects should expose behaviour and hide data.
> Easier to add kinds of objects wihtout changing existing behaviors.
Data structures expose data and hove no significant behaviour.
> Easier to add new behaviors without changing existing data structures.

## Error Handling
Use exceptions rather than return codes.
```java
try {
  tryToShutDown(); // I like the function name
}
```
### Define normal flow
### Null
When we return null, we are foisting problems upon callers.

## Boundarie
Wrapping third-party API minimizes the dependency on it.

## Unit Tests
Test code is just as important as production code.
Good architecture gives the posibillity to make changes, tests allow to make changes.
### A dual standard
It is perfectly fine to have uneficient tests, as long as they are clear.

## Classes
### SPR
Class should have one reason to change.
### Cohesion & Coupling
### OCP
### DPI
Classes should depend on abstraction, not on concrete details.

## Systems
```java
class System {
  public Service getService() {
    if (service == null)
      service = new MyService(); // tied to dependency
    return service;
  }
}
```
### Startup code is different from runtime code
Main -> LineItemFactory -creates LineItem-> <- OrderProcessing  
Implement only today's stories, then refactor and exapdn as the system grows to implement new stories.
### Cross-cutting concerns
Logging, transaction management, security, performance monitoring, etc.
In AOP (Aspect-Oriented Programming) these concerns are called aspects and are separated from the main business logic.
```java
class Bank {
  public void makeDeposit(int amount) {}
}

class PersistentBankProxy {
  private Bank bank;
  private TransactionLog transactionLog;
  public void makeDeposit(int amount) {
    bank.makeDeposit(amount);
    transactionLog.logDeposit(amount);
  }
}
```

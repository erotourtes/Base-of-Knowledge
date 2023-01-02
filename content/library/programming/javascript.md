---
title: "Javascript"
date: 2022-09-27T12:55:16+03:00
draft: true
---

# Basics

[Dictionary](https://github.com/HowProgrammingWorks/Dictionary#%D0%91%D0%B0%D0%B7%D0%BE%D0%B2%D1%8B%D0%B5-%D0%BF%D0%BE%D0%BD%D1%8F%D1%82%D0%B8%D1%8F)

- Statements
> = + / % ** () return
- Syntax
- Expression
- Value
- Type
- Literal
> Literal for string -> let a = '**hello**'  
Literal for number -> const b = **1234**
Null, underfined etc.

- Scalar (Primitive or Atmoic value)
- Reference
> Object, Function, Array etc.

- Identifier (імена змінних, констант, аргумент тощо)
- Variable
> **let** newVaribale = "hello"
- Assignment
> let newVaribale **=** "hello"
- Constant
> **const** NEW_CONSTANT = "hello"
- Composed types (mb collection)
> array, map
- Flag

---
- Algorithm (послідовність дій)
- Program (алгоритм на певній мові програмування (програмний код + дані))
- Engineering (отримання користі)
- Software engineering (engineering + program)
- Coding (writing code :))
- Programming
- Software development (зєднання всіх етапів цикла ПО: проектуванняб тестування і тд.)

---
- Block of code 
> {}, (), begin end
- Procedure or Subroutine
> Абстракція для повторення коду (зазвичай нічого не повертає, а змінює певні процеси)  

- Function 
> Абстракція вхідні - вихідні дані

- Function signature
> name  
number of arguments and their types  
function return type  

> Method
> Процедура повязана з обєктом

- Iteration
  - Loop
  - Recursion
- Condition statements
> if or ternar operator

- Programming Paradigm
> комплекс ідей (концепцій, принципів, постулатів), які пропонують модель рішення, стиль

---
- Call Stack
> Зберігає адресу повернення до елементу

- Stack 
> saves primiteve types

- Heap
> saves reference types

- Component (module, also can be class or function)
- Modularity 
  - can be tested
  - don't use, change or know about global varibales
  - low coupled code
- Library
> can be a synonym to module, or smth larger (several modules)
- Import and Export Identifiers
```Javascript
const y = Math.cos(0);

const fs = require('fs');

const lib1 = require('./file.js');

module.exports = identifier
// or 
module.exports = {identifier1, identifier2}
```

```Javascript
import identifier from 'moduleName';
import * as name from 'moduleName';
import { identifier } from 'moduleName';
import { identifier as newName } from 'moduleName';
import { name1, name2 } from 'moduleName';
import 'moduleName';

export default identifier;
export { name1, name2 }
export { varibale1 as name1 };
export const object1 = {};
```

- Object / Instance
> literal {} or new ClassName() or new Constructor()

- Class
- Instantiation (інстаніювання (створення обєкта) і ініціалізація значинь (призначення значення для ідентифікатора))
- Scope (usually used for varibale)
  - block scope (let, const)
  - function scope (var)
- Lexical environment (блок кода з якого видно ідентифікатори)
- Object context: this (привязка до контексту обєкта)
- Global context (global, window, sandbox)


# Types 
- int 
> bitwise operations

- bigint
> 1234n -> convert to bigint
- Underfined
> with scalars  

let empty;
- Null
> with references  

const emptyObject;
- NaN
> Number  

const nan = underfined + 1;
- Empty element

## Parsing
```Javascript
parseint("11", 2); // 3  
parseint("11", 8); // 9 Системи числення

console.log(parseInt(5 * 1e30)); // 5
console.log(parseInt(0.00000000000005)); // 5
console.log(parseInt(0.000005)); // 0
```

## Delete
In strict mode cann't delete `const`, but can `var` or `object.filed`  
delete object.filed

## Check existance
```Javascript
const arr = ["hello"];
(1 in arr) // false
```

# Functions
Чисті - завжди однаковий результат (log, sin, y = x + 10)  
З побічним ефектом (дані ззовні)

```Javascript
const foo = (...args) => {}
```
Обєктний контекст, функціональний контекст

```Javascript
function foo (a, b) {
    return a + b;
}

foo(1, 2);
foo.call(null, 1, 2); // null as a object context

const arr = [1, 2];
foo(...arr); // spread operator
foo.apply(null, 1, 2); // null as a object context
```
[Замикання](https://youtu.be/pn5myCmpV2U?t=3865)


```Javascript
const add = x => {
  let variable = 0;

  return (y => {
    variable = x + y;
    console.log(variable);
    return add(variable);
  });
};

console.log(add(1)(2)(3));
```

# Objects
```Javascript
const obj = {} or new Object()
{
  get some() {}
  set some() {}
}
```

# Prototypes

```Javascript
function Point(x, y) {
  this.x = x;
  this.y = y;
}

Point.greet = ()=>console.log(`Greetings ${this.x} and ${this}`)
Point.prototype.toString = ()=>console.log(`${this.x} and ${this}`);

console.log(Point);

const a = new Point(1, 2);
console.log(a);

const b = Point(1, 2);
console.log(b);

a.toString();
// a.greet();
Point.greet();
Point.toString();
```

# Antipatterns

- names
- magic numbers
- hardcodes

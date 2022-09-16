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

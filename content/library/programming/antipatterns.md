---
title: "Antipatterns"
date: 2023-01-02T10:17:10+02:00
draft: true
---


## Bad Names
```js 
const n = "Mario";
const nameOfMyDearFriend = "Mario";

```

## Magic Values
```js
const res = name.padStart(21);
```

## Hard Codes
```js
generateMap(10, 10);

// Solution
const rows = 10;
const colums = 10
generateMap(rows, colums);
```

## Duplicated Code
Extract duplicated code into the function.

## Cryptic Code
```js
(![] + {})[+!![] + [+[]]] +                 
  (!![] + [])[+!![]] +                      
  (+{} + [] + +!![] / +![])[+!![] + [+[]]] +
  'p' +                                     
  (!![] + [])[+[]] +                        
  (![] + [] + [][[]])[+!![] + [+[]]] +      
  (![] + {})[+!![] + [+[]]]                 
// -> 'Cryptic'
```

## Copy Paste

## Improbability
```js
fs.read('./dontExists.js', 'utf-8', (err, data) => {
    console.log(JSON.parse(data));
  })
);
```

## Fool Proof Code
```js 
const sumNumbers = (a, b) => {
  if (typeof a !== 'number' && typeof b !== 'number')
    throw new Error('Number expected');
  return a + b;
}

// Solution
const sum => (a, b) => a + b;
```

## Spaghetti Code
GOTO, callbacks, event emitters

## Comments
Extract obscure code to a function of variable with a proper name

## Silver Bullet
There is no uniqe perfect solution for all problems

## Not Invented Here
Someone made a solution to your problem. Example: BlueBird library when you have promises build in.

## Accidental Complexity
Boilerplate, redundant code  
Best way is to move abstraction higher

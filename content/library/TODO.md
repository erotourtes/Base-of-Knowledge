---
title: "TODO"
draft: false
tags: ["TODO"]
summary: List of to-do
math: true
---

- Brainstorm O(log n) conception

- Object.DefineProperty

class Point {
  constructor(x,y) {
    this.x = x;
  }

  toString() {
    console.log(`${this.x} and ${this}`);
  }
}

const a = new Point(1, 2);
a.toString();

- new Function -> what is this

- function with bind argument -> new function in memory?

- const a = []; typeof a === "null";

- setImmediate setTimeout(0) process.nextTick

- 
const obj = {
  Fabric() {
    class Test {
      constructor() {
        console.log("hello");
      }
    }

    return Test;
  },
  Fabric1() {
    return (
      class Test {
        constructor() {
          console.log("hello");
        }
      }
    );
  },
  FabricField:
    (class Test {
      constructor() {
        console.log("hello");
      }
    }),
  FabricLambda: () =>
  (class Test {
    constructor() {
      console.log("hello");
    }
  }),
};

// new obj.Fabric();
// new obj.Fabric1();
new obj.FabricField();
// new obj.FabricLambda();
// emmiter = new events.EventEmitter();

- functor and monad

- differance of 
  TypeError();
  new TypeError();

- Polyfill

- Prototypes

// const str = "www.some-text)((copy).ua";
// const regex = /\([\w+\s]+\)/g;
// const index = regex.exec(str).index;
// console.log(str.slice(index, regex.lastIndex));

- iterator interface

---
const printError = (err) =>
  console.log("\n" + err.message + "\n" + "-".repeat(err.message.length));

const errorCatcher = (err) => {
  try {
    throw err;
  } catch (e) {
    printError(e);
  }
};

errorCatcher(new Error("error with new"));
errorCatcher(Error("error without new"));
errorCatcher(new TypeError("type error with new"));
errorCatcher(TypeError("type error without new"));

---
const reduce = ([c, ...others]) => {
  console.log(c, others);
};

reduce([3, 4, 5, 6, 7]);

// git branch * if change alternative would chnage the parent *

---
const node = (data) => {
  const element = (data) => {
    const next = node(data);
    next.prev = element;
    return next;
  };
  element.data = data;
  return element;
};

const list = node({ name: 'first' })({ name: 'second'})({ name: 'third'});

// підняти handling error up
// antipattern reassign function argument
// Proxy - add opportunity to change deffault behaviour of getters, setters, deletion etc.
// Proto

//! wrap 3 -> function callback never called;

---

// TODO write wraped function with same number of arguments

//! why wrapped function called when we need it ?
<!-- 'use strict';

// Function throttling, executed once per interval

const throttle = (timeout, f, ...args) => {
  let waiting = false;
  let called = false;
  const wrapped = (...par) => {
    if (waiting) {
      called = true;
      return;
    }

    setTimeout((...par) => {
      waiting = false;
      if (called) {
        called = false;
        wrapped(...par);
        // f(...args.concat(par));
      }
    }, timeout, ...par);

    waiting = true;

    return f(...args.concat(par));
  };

  return wrapped;
};

// Usage

const fn = (...args) => {
  console.log('Function called, args:', args);
};

const ft = throttle(200, fn, 'value1');

const timer = setInterval(() => {
  fn('value2');
  ft('value3');
}, 50);

setTimeout(() => {
  clearInterval(timer);
}, 1000); -->

// TOASK

class A {
  constructor(cb) {
    this.data = "data";
    // cb(this.getData.bind(this));
    cb(this.getData);
  }

  getData() {
    return this.data;
  }
}

const a = new A((getData) => console.log(getData()));

// TODO refactor C lab 1.6


Semyon Sobolev
rocketsam
Jun 28

I had a very irritating freezes and lags on Latitude 7430 on Fedora 37, and what helped me is blacklisting a module intel_rapl_msr.

You may give it a try with no changes to your system with rmmod intel_rapl_msr
In case it helps just create a file /etc/modprobe.d/intel_rapl_msr-blacklist.conf with following contents:
blacklist intel_rapl_msr


so 
echo blacklist intel_rapl_msr >> /etc/modprobe.d/intel_rapl_msr-blacklist.conf

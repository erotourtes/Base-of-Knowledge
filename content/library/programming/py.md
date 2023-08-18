---
title: "Py"
date: 2023-09-26T10:24:00+03:00
draft: true
---

#### Types
```py
var: int | float | str | List | Dict | bool

type(var)
```

#### Spread operator & Destructuring assignment
```py
def fn(*args):
    pass

list = [1, 2, 3]
fn(*list)
```

#### Conditions
```py
if a < x < b:
    ...
elif False:
    ...
else
    ...

val = "Even" if n % 2 == 0 else "Odd"


match val:
    case "Value" | "Another value":
      ...
    case _: # finally
      ...

if ok:= re.match(...):
    ...
```

#### Loops
```py
while True:
    ...

for i in [0, 1, 2]:
    ...

for i in range(3): # 0 1 2
    # break
    # continue
    ...

print("hello\n" * 3, end="") # prints hello 3 times
```

##### Wut
```py
def func():
    for _ in range(3):
        new_val = 10
    print(new_val) # works
```

#### Dict
```py
d = {
  "a": 1,
  "b": 2,
}

d["a"] # 1

b["a"] = None

for key in d:
    ...
```

##### Tuple
```py

def get_vals():
    x, y = 0, 0
    return x, y # implicit (x, y)

```

#### Exceptions & Errors
```py
try:
    x = int(input("X is: "))
except ValueError:
    print("x is not an integer")
else:
    print("success")

# or 

while True:
    try:
        x = int(input("X is: "))
    except ValueError:
        pass
    else:
        break
print(f"x is {x}")

raise ValueError("woops!")
```

```py

if True:
    raise Exception("wut?")
```

#### IO
```py
name = input("What is your name? ")
# name = "Maxwell"
print("hello world", name, end="!\n")
print(f"hello {name}")
```

```py
with open("file.txt", "r") as file:
    lines = file.readlines()
    # closes file automatically
```

#### Multiple assignment
first, second = "hello world".split(" ")

#### Comments
```py
# one

"""
more
"""
```

#### Modules
```py
import random
choice = random.choice(["hello", "world"])
print(choice)

from random import choice, randint, shuffle
```

#### Unit testing
```py
#__test_fun.py__#
from module import fun

def test_fun():
  # if fun(10) != 4:
    assert fun(10) == 4
```

```
__init__.py
```

#### Sqlite
```py
import sqlite3

# Connect to database
conn = sqlite3.connect("restaurant.db")
c = conn.cursor()

# Query the database
c.execute("SELECT *, name FROM restaurant")
for row in c:
    print(row)

# Save (commit) the changes
conn.commit()

# show schema of table
c.execute("PRAGMA table_info(restaurant)")
for row in c:
    print(row)

conn.close()
```

#### Regex
```py
import re

# wrong
isValid = re.search("@\.", email) # error cause py mislead \

# right
isValid = re.search(r"@\.", email) # treat like a rawstring
```

#### Classes
```py
class Student:
  ...

class Student:
  def __init__(self, *args):

class Student:
  @property # getter
  def age(self):
      return self._age
  
  @age.setter # setter
  def age(self,val):
      self._age = val

  @classmethod # static method
  def staticMethod(cls):
      pass
```

##### Inheritance
```py

class Person:
    ...

class Student(Person):
    def __init__():
        super().__init__()
    ...
```

#### Operator overloading:
```py
class Me:
    __init__(self, name):
        self.name = name

    __add__(self, other):
        newName = self.name + other.name
        return Me(newName)
```


#### One liners
```py
list = [i for i in range(10)]

dict = [ {name: "Harry"}, ... ]

newList = [ student for student in dict if student["name"] = "Hermione" ]]
```

---
title: "Javascript"
date: 2023-09-05T08:54:35+03:00
draft: true
---


## types
bool 
string
int 
byte rune
float 
complex

```go
var variables string
var := ""
first, second := 1, 2
const f = 1 // compile time thing
```

```go

if height > 4 {

} else if ...
else ...


if len := getLength(str); len < 1 {
  // only scope limited len
}
```

```go
func sum(x int, y int) int {
  return x + y
}

func sum(x, y int) int {
  return x + y
}

func sum(x, y int) (int, int) {
  return x + y, y
}

func sum(x, y int) (x, y int) {
  return  // automatically returns x and y
}

```

```go
a int
b *int
c [3]int
f func(int, int) float64

```

## Guard clauses
return early

## Structs
```go
type car struct {
  Make string
  Model string
}

myCar := car{}
myCar.Model.name
```

### anonymous struct
```go
myCar := struct {
  Make string
  Model string
} {
  Make: "tesla"
  Model: "3"
}

type car struct {
  Make string
  Model string
  Wheel struct {
    ...
  }
}
```

### embeded struct
```go
type car struct {
  make string
}

type truck struct {
  car
  bedSize int
}

myTruck := truck{
  bedSize: 10,
  car: car {
    make: "tesla"
  }
}

myTruck.make
```

### struct functions
```go
func (r rect) area() int {
  return r.width * r.height
}
```

## interfaces
implicit assgnment (unlike java)
```go
type shape interface {
  area() float64
  perimeter() float64
}

type Saver interface {
  Save(file string, dest string) (err int)
}
```

### Casting
```go
c, ok := s.(circle)

// or 

switch v:= num.(type) {
  case int:
    ...
  case string:
    ...
}
```


## Error
```go

val, err := throwsAnError()

type myerror struct {
  someData string
}

func (e myerror) Error() {
  return e.somedata
}
```


## Loops
```go
// for loop
for i := 1; i < 10; i++ {
  ...
}

// while loop

for true {
  ...
}
```

## Arrays
```go
var arr [3]arr
arr := [3]arr{1, 2, 3}
```


### slices
```go 
b := arr[1:n]
c := arr[lowindex:]
c := arr[:higherIndex]
d := arr[:] //all

slice := make([]int, len, cap)
slice := []int{1, 2, 3}

len(slice)
cap(slice)
```

### append to slice
```go
slice = append(slice, one, two, three)
```

### For of
```go
for INDEX, ELEMENT := range SLICE {
  ...
}
```

## Variadic functions

```go

func print(str ...string) {...}

names := []string{"hello", "world"}
print(names...)
```


## Maps
```go
map := make(map[string]int)
map["hello"] = 1

map1 = map[string]int{
  "hello": 1,
}

delete(m, key)
get := m[key]
check, ok := m[key]

```

## Defer
calls a function until the end
```go
user, _ = users[name]
defer delet(users, name)
```

## Packages
packages is based on directories
```go
// exporting functions from a pacakage (use uppercase)
func Exported() {}

func notExported() {}
```
inside go.mod
```go

...
go 1.20

replace github.com/username/name v0.0.0 => ../path // replace this with a local path

require {
  github.com/username/name v0.0.0
}

```

## Go
```shell
go build package|file
go run package|file
go install package|file
go mod init github.com/username/name
go get github.com/username/name # install a package
```

## Goroutine
```go

go func() {
  ...
}
```

### Channels
receiving from a nil channel blocks  
sending to a nil channel blocks  

send to a close channel panic  

receiving from a close panic returns default

```go
ch := make(chan int)
ch <- 69 // blocks
v := <-ch // blocks

close(ch)

v, ok:= <-ch
```

#### read-only
```go
func useCh(ch chan int) { }
func readCh(ch <-chan int) { }
func writeCh(ch chan<- int) { }
```

### Tokens
unary value => when and if it comes to the channel
```go
token := make(chan struct{})
```

### Buffered channels
```go
ch := make(chan int, 100)
```

### Range
```go
for value := range channel {

}
```

### Select
```go
select {
  case i, ok := <-channel:
    ...
  case ...

  default: //fires if all chanlles is waiting to a message to come
}
```

## Mutexes
```go
func doSmth(mutex, mymap map[string] int, key string) {
  mutex.Lock()
  defer mutex.Unlock()

  value := mymap[key]
  mymap[key] = value + 1
}
```
### RWMutex
allows to have multiple readers


## Generitcs
```go
func getDef[T any]() T { 
  var zeroVal T
  return zeroVal
}
```

### Constraints
```go

type myInterface interface {
  ...
}

func do[T myInterface](slice []T) {
 ...
}
```

### Interface type lists
```go
type Comparable interface {
  ~int | ~int8 | ~int16 | ~int32 | ~int64
}
```

### Parametric constraints
```go
type store[P product] interface {
  Sell(P)
}
```

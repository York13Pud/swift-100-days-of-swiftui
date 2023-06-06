# Day Two

## Booleans

A simple boolean constant:

``` swift
let tooHot = true
```

Another example, this time using isMultiple to return true or false:

``` swift
let multipleOfThree = 120.isMultiple(of: 3)
```

Another example, this time using boolean logic to change a variable:

``` swift
var allowedIn = false
print(allowedIn)
```

Set allowed in to opposite of what it currently is:

``` swift
allowedIn = !allowedIn
print(allowedIn)
```

Set allowed in to opposite of what it currently is:

``` swift
allowedIn = !allowedIn
print(allowedIn)
```

## Joining Strings Together

### Method One: Plus Method

Use the `+` symbol to join text strings together. For example:

``` swift
let a = "Hello, "
let b = "world!"
print(a + b)
```

### Method Two: \() Method

This is called string interpolation.

Use `\` in a string to escape a variable/constant. Similar to Python f-strings. For example:

``` swift
let c = "Hello,"
let d = "world!"
print("\(c) \(d)")
```

It also works with other data tupes. For example:

``` swift
let e = 1
let f = 2.1
print("e is \(e) and f is \(f)")
```

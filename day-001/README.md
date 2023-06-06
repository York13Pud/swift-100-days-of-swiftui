# Day One

## Why Swift?

* Hard to write unsafe code
* Makes it easy to write code that is clear to understand
* Supports all the worlds languages out of the box

## Creating Constants And Variables

### Variables

Example of a variable in Swift:

``` swift
var name = "Ted"
```

To assign a new value to the name variable:

``` swift
name = "Fred"
```

`var` is only used when you create the variable. It is not needed when assigning a new value.

### Constants

Constants are used when the value will not change. To create a constant:

``` swift
let drink = "Tea"
```

Attempting to assign a new value to a constant will result in an error.

Where possible, try to use constants over variables. This is due to the way memory is managed and also helps prevent errors in the event of a variable being changed that should not have.

Note: Variables and constants should use camel case for their names. For example, `playerName`.

### Creating Strings

To use `"` inside of a string, use the `\` escape character as normal. For example:

``` swift
let text = "This is called \"text\"." 
```

To do a multi-line string, use `"""` instead of `"` at each end of the string. For example:

``` swift
let textTwo = """
This is a
Test
"""
```

To get the length of a string, use the .count method. For example:

``` swift
print(textTwo.count)
```

To change the case of a string, you can use one of these methods:

``` swift
print(text.uppercased()) // All uppercase.
print(text.lowercased()) // All lowercase.
print(text.capitalized)  // All first letters of a word are capitals.
```

To check if a string starts with particular characters or words:

``` swift
print(text.hasPrefix("Thi")) // Returns true or false
```

To check if a string ends with particular characters or words:

``` swift
print(text.hasSuffix(".")) // Returns true or false
```

### Working With Whole Numbers

``` swift
let score = 10
```

For big numbers, use an `_` to split up the 1,000's instead of a `,`:

``` swift
let bigNumber = 100_000_000
```

To add to a number:

``` swift
var total = 5
total += 6
```

Subtract will be the same but using an `-` in place of the `+`.

### Working With Decimals (a.k.a Floats or Doubles)

``` swift
let a = 1.0
let b = 2.0
let c = a + b
```

You cannot mix doubles and integers. This is called type safety. For example:

``` swift
let a = 1
let b = 2.0
let c = a + b
```

The above will error. The fix is to make a and b the same data type. For example, keep a as an int but add it to a double by converting it one time to a double:

``` swift
let a = 1
let b = 2.0
let c = Double(a) + b
```

Note: One a variable has been created, you cannot change its data type. For example: if it was a string at creation, it cannot be changed to an Int.
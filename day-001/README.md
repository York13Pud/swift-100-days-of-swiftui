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
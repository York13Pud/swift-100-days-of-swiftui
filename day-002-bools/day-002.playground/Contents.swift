import Cocoa

// A simple boolean constant:
let tooHot = true
print(tooHot)

// Another example, this time using isMultiple to return true or false:
let multipleOfThree = 120.isMultiple(of: 3)
print(multipleOfThree)

// Another example, this time using boolean logic to change a variable:
var allowedIn = false
print(allowedIn)

// Set allowed in to opposite of what it currently is:
allowedIn = !allowedIn
print(allowedIn)

// Set allowed in to opposite of what it currently is:
allowedIn = !allowedIn
print(allowedIn)

// Use the `+` symbol to join text strings together. For example:
let a = "Hello, "
let b = "world!"
print(a + b)

// Use `\` in a string to escape a variable/constant. Similar to Python f-strings. For example:
let c = "Hello,"
let d = "world!"
print("\(c) \(d)")

// It also works with other data tupes. For example:
let e = 1
let f = 2.1
print("e is \(e) and f is \(f)")

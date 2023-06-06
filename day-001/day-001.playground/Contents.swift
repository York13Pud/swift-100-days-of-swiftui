import Cocoa

// Variables
var name = "Ted"
print(name)

name = "Fred"
print(name)

// Constants
let drink = "Tea"
print(drink)

// Using "" inside a string:
let text = "This is called \"text\"."
print(text)

// Using a multi-line string that has line breaks:
let textTwo = """
This is a
Test
"""
print(textTwo)

// To get the length of a string, use the .count method. For example:
print(textTwo.count)

// To change the case of a string, you can use one of these methods:
print(text.uppercased()) // All uppercase.
print(text.lowercased()) // All lowercase.
print(text.capitalized)  // All first letters of a word are capitals.

// Check if a string starts with particular characters or words:
print(text.hasPrefix("Thi")) // Returns true or false

// Check if a string ends with particular characters or words:
print(text.hasSuffix(".")) // Returns true or false

// Working with integers:
let score = 10

// For big numbers, use an `_` to split up the 1,000's instead of a `,`:

let bigNumber = 100_000_000

// To add to a number:
var total = 5
total += 6
print(total)

// To perform multiplication and division:
let totalMultiply = total * 5
let totalDivide = total / 5

// Add doubles:
let a = 1.0
let b = 2.0
let c = a + b
print(c)

// Add an int to a double with a one time type coversion:
let d = 1
let e = 2.0
let f = Double(d) + e
print(f)

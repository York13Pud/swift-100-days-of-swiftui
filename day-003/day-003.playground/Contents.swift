import Cocoa

// Arrays

// Creating arrays:
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]
var scores = Array<Int>() // Creates an empty array. You could instead use: var scores [String]()

// View items in an array:
print(beatles[0])
print(numbers[1])
print(temperatures[2])

// Add items to an array. This is the same for a blank or populated array:
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])
scores.remove(at: 2)
print(scores)

// Show the number of items in an array:
print(scores.count)

// Put items in a list into aplha / numeric order:
let beatlesSorted = beatles.sorted()
print(beatlesSorted)

// Check if a value exists in an array (case specific):
print(beatles.contains("Paul")) // Returns true

// Reverse an array:
let beatlesSortedReversed = beatlesSorted.reversed()
print(beatlesSortedReversed)

// Remove everything from an array:
scores.removeAll()
print(scores) // Returns []

// Dictionaries

// A simple dictionary:
let employee = ["name": "John Smith", "job": "Cleaner", "location": "Doncaster"]
print(employee["name"])

// To get around the optional warning and remove "Optional" from the output, pass a default:
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

// To create an empty dictionary:
var heights = [String: Int]()

// To add data to a dictionary:
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

// To update a key in a dictionary:
heights["LeBron James"] = 207

// Note: count and RemoveAll() exist for dictionaries
var employee2 = ["name": "John Smith", "job": "Cleaner", "location": "Doncaster"]
print(employee2["name", default: "Unknown"])
employee2

let books = ["Austen": "Pride and Prejudice"]
let dickens = books["Dickens", default: "Unknown"]
print(dickens) // returns Unknown


// Sets

// A simple set:
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])

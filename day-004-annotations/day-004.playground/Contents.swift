import Cocoa

// Specify data types when creating a var or const:
let surname: String = "Lasso"
var score: Int = 0
var scoreStart: Double = 0 // Even though it is an int, it will be set to 0.00
var isAuthenticated: Bool = true

// An array:
var albums: [String] = ["Red", "Fearless"]
var teams: [String] = [String]() // An empty array

// A dictionary:
var user: [String: String] = ["id": "@twostraws"]

// A set:
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

// A constant can be defined without an initial value so it can be set later on. For example:
let username: String
username = "@fred"

print(username)

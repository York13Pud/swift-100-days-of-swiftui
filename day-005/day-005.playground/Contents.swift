import Cocoa

// If statement
let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

// An example of a nested if:
let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}

// Or logic operation example:
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}

//And logic operation example:
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

// Switch examples:
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
    case .sun:
        print("It should be a nice day.")
    case .rain:
        print("Pack an umbrella.")
    case .wind:
        print("Wear something warm")
    case .snow:
        print("School is cancelled.")
    case .unknown:
        print("Our forecast generator is broken!")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// Ternary Operator

// A simple check to see if a person is elligable to vote:
let age = 17

let canVote = age >= 18 ? "Yes" : "No"
print(canVote) // Should be No (false)

// An example with a bool checking for true without writing a comparison operator:
let strongMagnets = true
print(strongMagnets ? "Success" : "Failure")


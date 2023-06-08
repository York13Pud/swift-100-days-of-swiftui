import Cocoa

// For loops

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

// A range for loop:
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

// Using an _ for the loop variable as one is not used in the loop:
var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

// Side note. Using a range to print something in an array atarting at one index and ending at another:
let names = ["Piper", "Alex", "Suzanne", "Gloria"]

print(names[1...3])


// While loops

// A simple while loop
var countdown = 10

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

// Create a random number between two ranges:
let id = Int.random(in: 1...1000)

let amount = Double.random(in: 0...1)

// Another example:

// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")


// Continue and Break


// If you call continue inside that loop body, Swift will immediately
// stop executing the current loop iteration and jump to the next item
// in the loop, where it will carry on as normal.

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

// That creates an array of filename strings, then loops over each one
// and checks to make sure it has the suffix “.jpg” – that it’s a picture.
// continue is used with all the filenames failing that test, so that the rest of the loop body is skipped.

// Break stops a loop and moves onto the next thing outside the loop. For example:
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// The above example did:
//
// 1. Create two constants to hold two numbers.
// 2. Create an integer array variable that will store common multiples of our two numbers.
// 3. Count from 1 through 100,000, assigning each loop variable to i.
// 4. If i is a multiple of both the first and second numbers, append it to the integer array.
// 5. Once we hit 10 multiples, call break to exit the loop.
// 6. Print out the resulting array.


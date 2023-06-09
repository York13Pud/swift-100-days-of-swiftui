import Cocoa

// A basic function with a single argument passed to it:
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func printTimesTablesAgain(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTablesAgain(number: 5, end: 20)

// A function can also be left empty:
func doNothing() {
    
}

doNothing()

// A function with a return:
// The -> Int is required as if a return is part of the function, the data type MUST be declared.
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

// Another example, this time with parameters that get sorted and compared to return a bool:
func areLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

print(areLettersIdentical(string1: "bca", string2: "cba"))


// Returning multiple values:


// Return an array:
func getUser() -> [String] {
    return ["John", "Smith"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")


// Return a dictionary:
func getUserTwo() -> [String: String] {
    return [
        "firstName": "Jane",
        "lastName": "Smith"
    ]
}

let userTwo = getUserTwo()
print("Name: \(userTwo["firstName", default: "Anonymous"]) \(userTwo["lastName", default: "Anonymous"])")


// Return a tuple (better option sometimes as no defaults need in print statement (as above)):
func getUserThree() -> (firstName: String, lastName: String) {
    (firstName: "David", lastName: "Jones")
}

let userThree = getUserThree()
print("Name: \(userThree.firstName) \(userThree.lastName)")
// Or, you can use numerical positions instead:
print("Name: \(userThree.0) \(userThree.1)")

// Why tuples?:


// 1. When you access values in a dictionary, Swift can’t know ahead of time whether they are present or not. Yes, we knew that user["firstName"] was going to be there, but Swift can’t be sure and so we need to provide a default value.
// 2. When you access values in a tuple, Swift does know ahead of time that it is available because the tuple says it will be available.
// 3. We access values using userThree.firstName: it’s not a string, so there’s also no chance of typos.
// 4. Our dictionary might contain hundreds of other values alongside "firstName", but our tuple can’t – we must list all the values it will contain, and as a result it’s guaranteed to contain them all and nothing else.

// Another way to set multiple constants or vars on one line is to pass them as a tuple that uses the return from a function to set each:
let (firstName1, lastName1) = getUserThree()
print("Name: \(firstName1) \(lastName1)")

// Parameter labels allow the caller to use a different name to pass an argument for a parameter. Sometimes it makes sense to
// but I don't see the point. Just name your parameters better.

func printTimesTables(multiplier number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(multiplier: 5)

// A label is only accessible outside of the function. Inside the function, you use the name of the parameter.
// If a label is not set, the caller will use the name of the parameter as by default, swift will create a label
// that has the name of the parameter if it is not set. You can also use `_` to force it to use the parameter name
// for the label.

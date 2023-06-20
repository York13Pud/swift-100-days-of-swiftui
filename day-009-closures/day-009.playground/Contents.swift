import Cocoa

// Copy a function to a variable:

// To copy a functions code to a variable, use the name of the function without the `()`. For example:

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()


// Every function’s type depends on the data it receives and sends back. That might sound simple, but it hides an
// important catch: the names of the data it receives are not part of the function’s type.

// We can demonstrate this with some more code:

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)


// Accepting functions as parameters:
func doImportantWork(first: () -> Void,
                     second: () -> Void,
                     third: () -> Void) {
    
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
    }
    second: {
        print("This is the second work")
    }
    third: {
        print("This is the third work")
    }

// Passing a function as a parameter that will call another function:
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

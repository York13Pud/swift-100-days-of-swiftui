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
let user = data(1986)
print(user)

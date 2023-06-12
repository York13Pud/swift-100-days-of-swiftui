import Cocoa

// Set a default for a parameter:

func printTimesTables(for number: Int, end: Int = 12) { // end has a default of 12.
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

// Error handling

// Create an enum to show an error of too short or obvious for a password:
enum PasswordError: Error {
    case short, obvious
}

// Create a function to do some checks on a password that was sent to it:
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}


// 1. If a function is able to throw errors without handling them itself, you must mark the function as throws before the return type.
// 2. We don’t specify exactly what kind of error is thrown by the function, just that it can throw errors.
// 3. Being marked with throws does not mean the function must throw errors, only that it might.
// 4. When it comes time to throw an error, we write throw followed by one of our PasswordError cases. This immediately exits the function, meaning that it won’t return a string.
// 5. If no errors are thrown, the function must behave like normal – it needs to return a string.

// Use do, try and catch to "do" something, which in this case is to "try" a function and if there are any errors, "catch" them
// and print "There was an error".

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

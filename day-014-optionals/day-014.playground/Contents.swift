import Cocoa

let opposites = [
    "Marion": "Wario",
    "Luigi": "Waluigi"
]

// if let will check if the key "Mario" exists. If not, do nothing. If so, print:
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// Guard:

func printSquare(of number: Int? = nil) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

printSquare() // Returns "missing input"
printSquare(of: 8) // Returns result

// Error handling

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

// Or:

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

import Cocoa

let opposites = [
    "Mario": "Wario",
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

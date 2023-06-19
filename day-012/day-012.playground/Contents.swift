import Cocoa

// A simple class:
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// Class inheritance:

// First, create the top-level class:
class Employee {
    let hours: Int
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
    
    init(hours: Int) {
        self.hours = hours
    }
}

// Next, create two classes that inherit from the Employee class:

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    // Adding override to the begining will allow printSummary to override the one that was inherited from the Employee class.
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

// Adding final before class will indicate that this class cannot be inherited from. It will still inherit from
// the Emplyee class but nothing can inherit from the Manager class:
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

// Class Initialisers:

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// Copying Classes:

class User {
    var username = "Anonymous"
}

var user1 = User()

var user2 = user1
user2.username = "Taylor"

// The output for both will be Taylor as the data is shared between both:
print(user1.username)
print(user2.username)


// Using deinitialisers:

class Users {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [Users]()

for i in 1...3 {
    let user = Users(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

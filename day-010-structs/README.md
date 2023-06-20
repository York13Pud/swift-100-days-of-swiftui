# Day Ten

## Structs

Swift’s `structs` let us create our own custom, complex data types, complete with their own variables and their own functions.

A simple `struct` looks like this:

``` swift
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)

print(red.title)
red.printSummary()
print(red.self)
```

Oddly, these look a lot like classes / objects.

Note: Always name the struct with a capital letter for the name. Everything inside the struct uses camel case for names.

Another example:

``` swift
struct Employee {
    let name: String
    var vacationRemaining: Int

    func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}
```

This example will not work. The reason is that the function will alter the vacationRemaining variable which is not permitted by default. To get around it, change `func takeVacation(days: Int)` to `mutating func takeVacation(days: Int)`. It will now update.

One other problem. If you are updating a constant, you cannot do it, both inside and outside the struct as updating constants is not permitted in Swift.

Some terminology:

- Properties: These are vars and lets inside of a struct. Note: Only vars can have a default value that can be changed. Adding a default value to a let will result in an error when passing a value for that property.
- Methods: Functions inside a struct.
- Instance: The name of the var or constant that calls the struct.
- Initialiser: The actual call to the struct, along with any required arguments. There is a hidden part to a struct called init.

These are sounding more and more like classes!

## Computed Struct Properties

Best option is to read [this link]("https://www.hackingwithswift.com/quick-start/beginners/how-to-compute-property-values-dynamically") to cover it.

## Observers

These are used to check when a property changes and perform an action. For example, change the score three times and print out the new score. This is done with the `didSet` observer:

``` swift
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1
```

This will save us using print on another line when the score changes but it will not print out the score if the score is not changed.

Another observer is the `willSet` observer. This can be used to show what the current value is and what the change will be. For example:

``` swift
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
```

`oldValue` and `newValue` are magic functions that are built-in to Swift that do what they say on the tin.

## Creating Custom Initialisers

Initialisers in swift work much the same as they do in Python. For example:

``` swift
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
```

Just remember the golden rule: all properties must have a value by the time the initializer ends. If we had not provided a value for number inside the initializer, Swift would refuse to build our code.

Important: Although you can call other methods of your struct inside your initializer, you can’t do so before assigning values to all your properties – Swift needs to be sure everything is safe before doing anything else.
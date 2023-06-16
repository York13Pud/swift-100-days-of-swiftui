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


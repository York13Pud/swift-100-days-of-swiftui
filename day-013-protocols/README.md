# Day Thirteen

## Protocols

Think of protocols as a blueprint that is comprised of methods and properties that must be present in a struct or class.

For example:

``` swift
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
```

This example protocol states that two variable properties must be defined, along with two methods, with `estimateTime` having a return.

The `get` and `set` attributes imply that they are either read-only (`get`) or write (`set`). Both can be used together or on their own.

To use a protocol in a struct or a class, you pass the name of the protocol after the name of the struct or class. For example:

``` swift
struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}
```

The struct `Car` must conform to what is outlined in the `Vehicle` protocol. There is a method called `openSunroof` in the `Car` struct that isn't in the `Vehicle` protocol. This is fine as you can add additional methods and properties. The protocol is just the bare minimum that is required.

You can also use multiple protocols in a class or struct using comma-separated values.

Note: If you need to sub-class a class, put the name of the class before any protocols.

## Extensions

Extensions allow swift to add additional functionality to existing types, such as strings.

For example, add an extension to the String data type to remove leading and trailing whitespace:

``` swift
var quote = "   The truth is rarely pure and never simple   "
print("Quote: \(quote)")

// Remove the whitespaces at the start and end:
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print("One: \(trimmed)")

// Do the same again but this time extend the String data type:
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

let trimmedTwo = quote.trimmed()
print("Two: \(trimmedTwo)")
```

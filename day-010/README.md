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

Note: Always name the struct with a capital letter for the name.
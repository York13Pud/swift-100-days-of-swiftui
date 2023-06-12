import Cocoa

// Set a default for a parameter:

func printTimesTables(for number: Int, end: Int = 12) { // end has a default of 12.
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

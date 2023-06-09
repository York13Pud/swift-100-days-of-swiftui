import Cocoa

// A basic function with a single argument passed to it:
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func printTimesTablesAgain(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTablesAgain(number: 5, end: 20)

// A function can also be left empty:
func doNothing() {
    
}

doNothing()

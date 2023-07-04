# Project 4

## Entering numbers with Stepper

Stepper is a view to allow a user to enter numbers by pressing a + or - button. For example:

``` swift
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}
```

To break that code block down:
- `@State private var sleepAmount = 8.0` = Create a var called sleepAmount that can be used to bind to.
- `Stepper` = Use the `Stepper` view.
- `\(sleepAmount.formatted())` = Show the value of sleepAmount and use `formatted()` to show the text in a better formatted way.
- `value: $sleepAmount` = Bind to the `sleepAmount` variable for the value to assign to it.
- `in: 4...12` = Allows the stepper to only go between the values of 4 and 12. No higher, no lower.
- `step: 0.25` = Increase or decrease the value by increments of 0.25.

There is also a slider view to enter numbers but steppers are more precise.

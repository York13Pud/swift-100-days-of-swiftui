# Project 6

## Implicit Animations

In SwiftUI, the simplest type of animation is an implicit one: we tell our views ahead of time “if someone wants to animate you, here’s how you should respond”, and nothing more.

The following example will increase the size of a button each time it is pressed:

``` swift
import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount) // Adds a scale factor to increase the size of the button
        .animation(.default, value: animationAmount) // Animates the size increase
    }
}
```

## Customising Animations In SwiftUI


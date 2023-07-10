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

Note: Implicit animations always need to watch a particular value otherwise animations would be triggered for every small change – even rotating the device from portrait to landscape would trigger the animation, which would look strange.

## Customising Animations In SwiftUI

For more precise control, we can customize the animation with a duration specified as a number of seconds. So, we could get an ease-in-out animation that lasts for two seconds like this:

``` swift
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
        .scaleEffect(animationAmount)
        .animation(.easeInOut(duration: 2), value: animationAmount)
    }
}
```

There are lots of animation options to chose from, which will not be possible to show them all here. Work out what you want to do and then find a suitable animation modifier.

## Animating Bindings


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

You can, for example, animate a buttons based on a value that bound to a stepper. For example:

``` swift
struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)

            Spacer()

            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}
```

This wil increase or decrease the size of the button when the stepper is invoked. It will increase up to a value of 10x the original size (`1...10`).

## Creating Explicit Animations

This method tells SwiftUI that we are explicitly asking it to animate changes occurring as the result of a state change. For example, rotate a button 360 degrees along its y and z axis:

``` swift
struct ContentView: View {
    @State private var animationAmount5 = 0.0
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation(.interpolatingSpring(stiffness: 3, damping: 1)) {
                    animationAmount5 += 360
                }
            }
            .padding(50)
            .background(.black)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount5), axis: (x: 0, y: 1, z: 1))
        }
    }
}
```

## Controlling The Animation Stack

Modifier order matters, because SwiftUI wraps views with modifiers in the order they are applied.

We can apply an `animation()` modifier to a view in order to have it implicitly animate changes.

You can have as many `animation()` modifiers as you need to construct your design, which lets us split one state change into as many segments as we need.

For even more control, it’s possible to disable animations entirely by passing nil to the modifier. For example, you might want the color change to happen immediately but the clip shape to retain its animation, in which case you’d write this:

``` swift
Button("Tap Me") {
    enabled.toggle()
}
.frame(width: 200, height: 200)
.background(enabled ? .blue : .red)
.animation(nil, value: enabled)
.foregroundColor(.white)
.clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
.animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
```
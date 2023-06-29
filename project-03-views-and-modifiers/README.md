# Project 3

## Views And Modifiers

Why does SwiftUI use structs for views? Mostly because structs are faster than classes but also because they are better at isolating state.

## What Is Behind The Main SwiftUI View?

Why does the below code not make the entire screen go red, instead of just around the text?

``` swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
            .background(.red)
    }
} 
```

The answer is that there is nothing behind the text view. It's that simple.

To get the entire screen to go red, you need to increase the size of the text box, which is done using the `.frame` modifier.. For example:

``` swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
    }
} 
```

Using `maxWidth: .infinity` and `maxHeight: .infinity` will take up the entire screen dynamically, meaning it will fill up the screen no matter it's size. That is what `.infinity` is for.

## Why Modifier Order Matters

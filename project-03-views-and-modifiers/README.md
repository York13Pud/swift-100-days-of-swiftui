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

Modifier order maters because each time you add a modifier, SwiftUI makes a copy of that view with the new modifier added.

A simple example is to create a text box, with the background being red and the frame size taking up the full screen:

``` swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
            .background(.red)
            .frame(maxWidth: .infinity, maxHeight: .infinity) 
    }
}
```

The result, the "hello" text will be red but the rest of the screen will be white (or black). This is because the `background` modifier was applied first and the copy of it at the time had the background set to red for the space that the text took up. It then applied the `.frame` modifier but that only filled the screen up with white (or black).

The fix for this is to change the order of the modifiers so that `.frame` is done first and then `.background`. For example:

``` swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
    }
}
```

Now the full screen will be red.

To see the order of when the modifiers were applied to the struct, you can use the `type` method. For example:

``` swift
print(type(of: self.body))
```

The output may look something like this in the debug pane in Xcode:

``` swift
ModifiedContent<ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>>, _FrameLayout>
```

As you can see the modifiers stack up as you add them.

One last example is to show this graphically:

``` swift
Text("Hello, world!")
    .padding()
    .background(.red)
    .padding()
    .background(.blue)
    .padding()
    .background(.green)
    .padding()
    .background(.yellow)
```

This code will start with a red padded box for the "Hello, world!" text and then add another padded blue box around, then green and lastly yellow.
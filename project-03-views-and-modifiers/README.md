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

## WTF Does SwiftUI Use “some View” For Its View Type?

TL:DR: `some View` allows the View to return any type (`some`) that conforms to the `View` protocol. These are opaque return types.

SwiftUI relies very heavily on a Swift power feature called “opaque return types”, which you can see in action every time you write `some View`. This means “one object that conforms to the `View` protocol, but we don’t want to say what.”

Returning some View means even though we don’t know what view type is going back, the compiler does. That might sound small, but it has important implications.

Side Note: The reason we can only have 10 elements at a time is because SwiftUI wraps them in a method called `TupleView`, which is hard coded to allow only 10 `buildBlocks`.

## Conditional Modifiers

Conditional modifiers allow SwiftUI to change a modifier based on a condition occurring. For example, change the text of a button from blue to red:

First, how to do it without a modifier:

``` swift
struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        if useRedText {
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundColor(.red)
        } else {
            Button("Hello World") {
                useRedText.toggle()
            }
            .foregroundColor(.blue)
        }
    }
}
```

Whilst that does work, there is a cleaner way by using a condition modifier:

``` swift
// An example of a conditional modifier:

struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        Button("Hello World") {
            useRedText.toggle() // flip the Boolean between true and false            
        }
        .foregroundColor(useRedText ? .red : .blue) // .blue is for false, .red is for true
    }
}
```

## Environment Modifiers

An environment modifier is a modifier that will be applied to a container of elements. For example, apply a font size to a VStack:

``` swift
VStack {
    Text("Gryffindor")
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.font(.title) // This is an environment modifier.
```

Now, you can override an environment modifier within the container. For example, change one of the Text boxes font to be bigger than the rest:

``` swift
VStack {
    Text("Gryffindor")
        .font(.largeTitle)
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.font(.title) // This is an environment modifier.
```

## Views As Properties

You can store views as properties. For example:

``` swift
struct ContentView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")

    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
}
```

You can also create computed properties if you want, like this:

``` swift
var motto1: some View {
    Text("Draco dormiens")
}
```

Or like this (you can also change `VStack` to `Group`):

``` swift
var spells: some View {
    VStack {
        Text("Lumos")
        Text("Obliviate")
    }
}
```

## View Composition

You can split up your code into smaller chunks to make it easier and reduce repetition in your code by using custom view composition. For example, create a custom struct called CapsuleText that will format some text that is passed to it with some modifiers:

``` swift
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
        }
    }
}
```

A good use case for this would be putting a custom frame around photos to show various attributes or a menu.

## Custom Modifiers

You can create a custom modifier that can be applied to a view element(s). For example, create a custom modifier to be applied to a text box view:

``` swift
// An example of a custom modifier:
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// Create an extension for view to add titleStyle that uses the above custom modifier.
// This will make it easier to call:
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    @State private var useRedText = false
    var body: some View {
        VStack {
            // Example 1 of using a custom modifier:
            Text("Hello World")
                .modifier(Title())
            
            // Example 1 of using a custom modifier - Use the titleStyle extension:
            Text("Hello World")
                .titleStyle() // Both results are the same.
        }
    }
}
```

As you can see, there are two ways to call the custom modifier. The first is with the `.modifier` method (example 1), which calls the custom modifier directly or create an extension to `view` and call that (example 2).

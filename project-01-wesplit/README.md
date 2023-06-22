# Project One - WeSplit

## SwiftUI Project Structure

Default files created when starting a new app:

- WeSplitApp.swift - Stores code for launching the app.
- ContentView.swift - Stores the UI code for the app.
- Assets.xcassets is an asset catalogue to store things such as images.

Basics of the ContentView.swift file:

``` swift
import SwiftUI // Import the SwiftUI framework.

struct ContentView: View { // Create a struct called ContentView that conforms to the View protocol.
    var body: some View { // Create a var called body that is required in the View protocol.
                          // some View is used to indicate that a type conforms with a protocol, but the exact conformance is not specified
        VStack { // A vertical stack to stack items inside it vertically.
            Image(systemName: "globe") // Show an image called globe.
                .imageScale(.large) // Make it a large image.
                .foregroundColor(.accentColor) // Set the colour.
            Text("Hello, world!") // A text area that says Hello, world!
        }
        .padding() // Add some padding to the VStack. This is called a modifier.
    }
}

// This section is used to render a preview in the preview area (canvas) next to the code editor.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

Note: opt+cmd+p to refresh the canvas area.

## Creating Forms

SwiftUI has a view type called Form to create forms.

You can add a maximum of ten (10) items to a form. More that that requires them to be put into groups or sections. This is a limitation of SwiftUI.

Groups does not modify the layout of the elements on the screen.
Sections does split things up, similar to the way a settings or preferences window would have.

## NavigationView

Use the NavigationView to add a title area to a form to stop it from scrolling into the safe area at the top of the screen. For example:

``` swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
            NavigationView {
                Form {                    
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                    } header: {
                        Text("This is another header")
                    } footer: {
                        Text("Here is a footer of text")
                    }
                }
                .navigationTitle("SwiftUI")
            }
        }
        .padding()
    }
}
```

Note: The `.navigationTitle` modifier has to be attached to the `Form`, not the `NavigationView`.
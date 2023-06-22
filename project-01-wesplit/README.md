# Project One - WeSplit

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
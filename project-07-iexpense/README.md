# Project 7

## Why @State Only Works With Structs

`@State` is designed to store simple state data that is local to the current view.

`@State` does not work when it is referencing a class. It will not update, for example, a text box when the value of a class property is updated via a `TextField` for example. A different method is needed. For that we use `@StateObject`

For example, the bellow will work just fine and when the text is updated, it will show immediately:

``` swift
struct User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}
```

However, if you change `struct user` to `class user`, the text will not update in the text boxes but the data in the class properties will be updated.

## @StateObject

For a variable to be updated with with updates from a property in a class, the `@StateObject` wrapper is used instead of `@State`.

Now, this is only half the battle. Changing only that will not work on its own. In addition, the property (or properties) in the class that need to provide updates to the variable calling the class need to publish those updates. This is done using the `@Published` wrapper in front of the property. In addition, the class needs to use the `ObservableObject` protocol so that the published changes can be made visible. For example:

``` swift
class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}
```

Now, if you take `@Published` away from `lastName`, it would not update in the UI but updating `firstName` will show the updates in the UI.

Note: `@StateObject` is used when creating the object. If you are just referencing that variable later on, use `@ObservedObject` which is used for using an existing objects state, rather than rebuilding the same thing.

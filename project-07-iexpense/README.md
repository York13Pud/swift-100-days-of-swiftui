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


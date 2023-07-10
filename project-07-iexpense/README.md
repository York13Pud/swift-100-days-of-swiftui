# Project 7

## Why @State Only Works With Structs

`@State` is designed to store simple state data that is local to the current view.

`@State` does not work when it is referencing a class. It will not update say a text box when the value of a class property is updated via a `TextField` for example. A different method is needed. For that we use `@StateObject`

## @StateObject


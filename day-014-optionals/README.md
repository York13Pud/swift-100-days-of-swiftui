# Day Fourteen

## Optionals

An optional in Swift is a type that can either hold a value or no value.

The question mark (?) after the type declaration indicates that the variable is an optional. For example, the following code declares an optional string:
Code snippet

``` swift
var name: String?
```

This variable can either hold a string value, or it can be nil, which means that it has no value.

Optionals are a powerful tool in Swift that allow you to handle the absence of a value in a safe and type-safe way.

For example:

``` swift
var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}
```

Another way to use optional is with the `if let / var` method. For example:

``` swift
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}
```

This if let syntax is very common in Swift, and combines creating a condition (if) with creating a constant (let). Together, it does three things:

- It reads the optional value from the dictionary.
- If the optional has a string inside, it gets unwrapped – that means the string inside gets placed into the marioOpposite constant.
- The condition has succeeded – we were able to unwrap the optional – so the condition’s body is run. If it is not met, the body will not run, unless there is an `else` clause. For example:

``` swift
var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}
```

The above will be nil as the `username` is not changed so the output will be the `else` clause.
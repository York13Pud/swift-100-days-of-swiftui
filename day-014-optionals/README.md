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

## Guard

Guard works similar to `if let / var` except it does the opposite. If a value is not present, the code will run, unlike an `if let / var`.

Note:
- If you use guard to check a function’s inputs are valid, Swift will always require you to use return if the check fails.
- If the check passes and the optional you’re unwrapping has a value inside, you can use it after the guard code finishes.

For example:

``` swift
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}
```

## Handling Errors

``` swift
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
```

The getUser() function will always throw a networkFailed error, which is fine for our testing purposes, but we don’t actually care what error was thrown – all we care about is whether the call sent back a user or not.

This is where try? helps: it makes getUser() return an optional string, which will be nil if any errors are thrown. If you want to know exactly what error happened then this approach won’t be useful, but a lot of the time we just don’t care.

If you want, you can combine try? with nil coalescing, which means “attempt to get the return value from this function, but if it fails use this default value instead.”

Be careful, though: you need to add some parentheses before nil coalescing so that Swift understands exactly what you mean. For example, you’d write this:

``` swift
let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)
```

You’ll find try? is mainly used in three places:

    In combination with guard let to exit the current function if the try? call returns nil.
    In combination with nil coalescing to attempt something or provide a default value on failure.
    When calling any throwing function without a return value, when you genuinely don’t care if it succeeded or not – maybe you’re writing to a log file or sending analytics to a server, for example.

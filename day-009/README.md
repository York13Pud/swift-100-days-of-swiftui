# Day Nine

## Copy a function to a variable:

To copy a functions code to a variable, use the name of the function without the `()`. For example:

``` swift
func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()
```

## Closures

But what if you wanted to skip creating a separate function, and just assign the functionality directly to a constant or variable? Well, it turns out you can do that too:

``` swift
let sayHello = {
    print("Hi there!")
}

sayHello()
```

Swift gives this the grandiose name closure expression, which is a fancy way of saying we just created a closure – a chunk of code we can pass around and call whenever we want. This one doesn’t have a name, but otherwise it’s effectively a function that takes no parameters and doesn’t return a value.
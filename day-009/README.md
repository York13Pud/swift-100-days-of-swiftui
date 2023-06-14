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


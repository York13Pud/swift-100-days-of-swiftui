# Day Five

## If Statements

If statements are the same in Swift as they are in Python with the only differences being `elif` is `else if` and it uses `{}` for the code block of an if statement. For example:

``` swift
let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}
```

An example of a nested if:

``` swift
let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}
```

Or logic operation example:

``` swift
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}
```

And logic operation example:

``` swift
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}
```

## Switch Statements

Take the following if:

``` swift
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .rain {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}
```

A switch can be used instead to cut down on the amount of code needed as `forecast ==` is repeated many time. Using the above example, it can be rewritten using a switch like this:

``` swift
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
    case .sun:
        print("It should be a nice day.")
    case .rain:
        print("Pack an umbrella.")
    case .wind:
        print("Wear something warm")
    case .snow:
        print("School is cancelled.")
    case .unknown:
        print("Our forecast generator is broken!")
    default:
        print("We haven't got a clue!")
}
```

Let’s break that down:

1. We start with switch forecast, which tells Swift that’s the value we want to check.
2. We then have a string of case statements, each of which are values we want to compare against forecast.
3. Each of our cases lists one weather type, and because we’re switching on forecast we don’t need to write Weather.sun, Weather.rain and so on – Swift knows it must be some kind of Weather.
4. After each case, we write a colon to mark the start of the code to run if that case is matched.
5. `default` is used when there is no value set against the `forecast` constant. This must be at the bottom as switches run in the order they are written and then stop when a match is made. If `default` is above a `case`, then the default will be hit first and then stop.
6. We use a closing brace to end the switch statement.

If you explicitly want Swift to carry on executing subsequent cases, use fallthrough. For example:

``` swift
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}
```

When a case is hit, it will carry on.

## Ternary Operator

A ternary operator will check a condition and return back a value based on if it is true or false.

``` swift
let age = 18

let canVote = age >= 18 ? "Yes" : "No"
print(canVote)
```

The condition is `age >= 18`. If the condition is true, the response is `Yes` and if it is false, the response is "No".

One case where a ternary is used where an if or a switch can't be used is in a print statement. They aren't allowed in print but ternary operations are. You can get around that by putting the print in the response for each condition in the if statement.

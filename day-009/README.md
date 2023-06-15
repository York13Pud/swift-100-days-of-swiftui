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

Every function’s type depends on the data it receives and sends back. That might sound simple, but it hides an important catch: the names of the data it receives are not part of the function’s type.

We can demonstrate this with some more code:

``` swift
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)
```

That starts off easily enough: it’s a function that accepts an integer and returns a string. But when we take a copy of the function the type of function doesn’t include the for external parameter name, so when the copy is called we use data(1989) rather than data(for: 1989).

Cunningly this same rule applies to all closures – you might have noticed that I didn’t actually use the sayHello closure we wrote earlier, and that’s because I didn’t want to leave you questioning the lack of a parameter name at the call site. Let’s call it now:

``` swift
sayHello("Taylor")
```

That uses no parameter name, just like when we copy functions. So, again: external parameter names only matter when we’re calling a function directly, not when we create a closure or when we take a copy of the function first.

You’re probably still wondering why all this matters, and it’s all about to become clear. Do you remember I said we can use sorted() with an array to have it sort its elements?

It means we can write code like this:

``` swift
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)
```

That’s really neat, but what if we wanted to control that sort – what if we always wanted one person to come first because they were the team captain, with the rest being sorted alphabetically?

Well, sorted() actually allows us to pass in a custom sorting function to control exactly that. This function must accept two strings, and return true if the first string should be sorted before the second, or false if the first string should be sorted after the second.

If Suzanne were the captain, the function would look like this:

``` swift
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
```

So, if the first name is Suzanne, return true so that name1 is sorted before name2. On the other hand, if name2 is Suzanne, return false so that name1 is sorted after name2. If neither name is Suzanne, just use < to do a normal alphabetical sort.

Like I said, sorted() can be passed a function to create a custom sort order, and as long as that function a) accepts two strings, and b) returns a Boolean, sorted() can use it.

That’s exactly what our new captainFirstSorted() function does, so we can use it straight away:

``` swift
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)
```

When that runs it will print ["Suzanne", "Gloria", "Piper", "Tasha", "Tiffany"], exactly as we wanted.

We’ve now covered two seemingly very different things. First, we can create closures as anonymous functions, storing them inside constants and variables:

``` swift
let sayHello = {
    print("Hi there!")
}

sayHello()
```

And we’re also able to pass functions into other functions, just like we passed captainFirstSorted() into sorted():

let captainFirstTeam = team.sorted(by: captainFirstSorted)

The power of closures is that we can put these two together: sorted() wants a function that will accept two strings and return a Boolean, and it doesn’t care if that function was created formally using func or whether it’s provided using a closure.

So, we could call sorted() again, but rather than passing in the captainFirstTeam() function, instead start a new closure: write an open brace, list its parameters and return type, write in, then put our standard function code.

This is going to hurt your brain at first. It’s not because you’re not smart enough to understand closures or not cut out for Swift programming, only that closures are really hard. Don’t worry – we’re going to look at ways to make this easier!

Okay, let’s write some new code that calls sorted() using a closure:

``` swift
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
```

That’s a big chunk of syntax all at once, and again I want to say it’s going to get easier – in the very next chapter we’re going to look at ways to reduce the amount of code so it’s easier to see what’s going on.

But first I want to break down what’s happening there:

- We’re calling the sorted() function as before.
- Rather than passing in a function, we’re passing a closure – everything from the opening brace after by: down to the closing brace on the last line is part of the closure.
- Directly inside the closure we list the two parameters sorted() will pass us, which are two strings. We also say that our closure will return a Boolean, then mark the start of the closure’s code by using in.
- Everything else is just normal function code.

## Trailing Closures

Best option is to read [this link]("https://www.hackingwithswift.com/quick-start/beginners/how-to-use-trailing-closures-and-shorthand-syntax") to cover it over again.

In short, use shorthand when it can be reduced to one line. For example:

``` swift
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

// Do a reverse sort on the team array:
let reverseTeam = team.sorted { $0 > $1 }

// Show only members starting with a "T":
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// Convert team members names to uppercase in a new array:
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
```

## Functions as Parameters

You can pass functions as parameters very easily. Two examples:

``` swift
func doImportantWork(first: () -> Void,
                     second: () -> Void,
                     third: () -> Void) {
    
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
    }
    second: {
        print("This is the second work")
    }
    third: {
        print("This is the third work")
    }
```

``` swift
// Passing a function as a parameter that will call another function:
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)
```
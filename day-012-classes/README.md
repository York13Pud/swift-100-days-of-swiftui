## Classes And Inheritance

Swift uses structs for storing most of its data types, including String, Int, Double, and Array, but there is another way to create custom data types called classes. These have many things in common with structs, but are different in key places.

First, the things that classes and structs have in common include:

- You get to create and name them.
- You can add properties and methods, including property observers and access control.
- You can create custom initializers to configure new instances however you want.

However, classes differ from structs in five key places:

- You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too. This is called *inheritance*.
- Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
- *Key Point*: When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
- When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer to delete that data.
- Even if you make a class constant, you can still change its properties as long as they are variables.

On the surface those probably seem fairly random, and there’s a good chance you’re probably wondering why classes are even needed when we already have structs.

However, SwiftUI uses classes extensively, mainly for point 3: all copies of a class share the same data. This means many parts of your app can share the same information, so that if the user changed their name in one screen all the other screens would automatically update to reflect that change.

The other points matter, but are of varying use:

    Being able to build one class based on another is really important in Apple’s older UI framework, UIKit, but is much less common in SwiftUI apps. In UIKit it was common to have long class hierarchies, where class A was built on class B, which was built on class C, which was built on class D, etc.
    Lacking a memberwise initializer is annoying, but hopefully you can see why it would be tricky to implement given that one class can be based upon another – if class C added an extra property it would break all the initializers for C, B, and A.
    Being able to change a constant class’s variables links in to the multiple copy behavior of classes: a constant class means we can’t change what pot our copy points to, but if the properties are variable we can still change the data inside the pot. This is different from structs, where each copy of a struct is unique and holds its own data.
    Because one instance of a class can be referenced in several places, it becomes important to know when the final copy has been destroyed. That’s where the deinitializer comes in: it allows us to clean up any special resources we allocated when that last copy goes away.

Before we’re done, let’s look at just a tiny slice of code that creates and uses a class:

``` swift
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
```

Yes, the only difference between that and a struct is that it was created using class rather than struct – everything else is identical.

## Class Inheritance

Swift lets us create classes by basing them on existing classes, which is a process known as inheritance. When one class inherits functionality from another class (its “parent” or “super” class), Swift will give the new class access (the “child class” or “subclass”) to the properties and methods from that parent class, allowing us to make small additions or changes to customize the way the new class behaves.

To make one class inherit from another, write a colon after the child class’s name, then add the parent class’s name. For example, here is an Employee class with one property and an initializer:

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
}

We could make two subclasses of Employee, each of which will gain the hours property and initializer:

``` swift
class Employee {
    let hours: Int

    func printSummary() {
        print("I work \(hours) hours a day.")
    }

    init(hours: Int) {
        self.hours = hours
    }
}

// Next, create two classes that inherit from the Employee class:
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }

    // Adding override to the begining will allow printSummary to override the one that was inherited from the Employee class.
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

// Adding final before class will indicate that this class cannot be inherited from. It will still inherit from
// the Emplyee class but nothing can inherit from the Manager class:
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()
```

Notice how those two child classes can refer directly to hours – it’s as if they added that property themselves, except we don’t have to keep repeating ourselves.

Each of those classes inherit from Employee, but each then adds their own customization. So, if we create an instance of each and call work(), we’ll get a different result:

As well as sharing properties, you can also share methods, which can then be called from the child classes. In the above example, printSummary() is inherited.

Things get a little more complicated when you want to change a method you inherited. For example, we just put printSummary() into Employee, but maybe one of those child classes wants slightly different behavior.

This is where Swift enforces a simple rule: if a child class wants to change a method from a parent class, you must use override in the child class’s version. This does two things:

- If you attempt to change a method without using override, Swift will refuse to build your code. This stops you accidentally overriding a method.
- If you use override but your method doesn’t actually override something from the parent class, Swift will refuse to build your code because you probably made a mistake.

 If you know for sure that your class should not support inheritance, you can mark it as `final`.

 ## Initialisers

Class initializers in Swift are more complicated than struct initializers, but with a little cherrypicking we can focus on the part that really matters: if a child class has any custom initializers, it must always call the parent’s initializer after it has finished setting up its own properties, if it has any.

Like I said previously, Swift won’t automatically generate a memberwise initializer for classes. This applies with or without inheritance happening – it will never generate a memberwise initializer for you. So, you either need to write your own initializer, or provide default values for all the properties of the class.

Let’s start by defining a new class:
``` swift 
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
```

That has a single Boolean property, plus an initializer to set the value for that property. Remember, using self here makes it clear we’re assigning the isElectric parameter to the property of the same name.

Now, let’s say we wanted to make a Car class inheriting from Vehicle – you might start out writing something like this:

``` swift 
class Car: Vehicle {
    let isConvertible: Bool

    init(isConvertible: Bool) {
        self.isConvertible = isConvertible
    }
}
```

But Swift will refuse to build that code: we’ve said that the Vehicle class needs to know whether it’s electric or not, but we haven’t provided a value for that.

What Swift wants us to do is provide Car with an initializer that includes both isElectric and isConvertible, but rather than trying to store isElectric ourselves we instead need to pass it on – we need to ask the super class to run its own initializer.

Here’s how that looks:

``` swift 
class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
```

super is another one of those values that Swift automatically provides for us, similar to self: it allows us to call up to methods that belong to our parent class, such as its initializer. You can use it with other methods if you want; it’s not limited to initializers.

Now that we have a valid initializer in both our classes, we can make an instance of Car like so:

``` swift 
let teslaX = Car(isElectric: true, isConvertible: false)
```

## Copying Classes

In Swift, all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.

## Deinitialisers

wift’s classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer in that it gets called when the object is destroyed rather than when it’s created.

This comes with a few small provisos:

- Just like initializers, you don’t use func with deinitializers – they are special.
- Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
- Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
- We never call deinitializers directly; they are handled automatically by the system.
- Structs don’t have deinitializers, because you can’t copy them.

Exactly when your deinitializers are called depends on what you’re doing, but really it comes down to a concept called scope. Scope more or less means “the context where information is available”, and you’ve seen lots of examples already:

- If you create a variable inside a function, you can’t access it from outside the function.
- If you create a variable inside an if condition, that variable is not available outside the condition.
- If you create a variable inside a for loop, including the loop variable itself, you can’t use it outside the loop.

If you look at the big picture, you’ll see each of those use braces to create their scope: conditions, loops, and functions all create local scopes.

When a value exits scope we mean the context it was created in is going away. In the case of structs that means the data is being destroyed, but in the case of classes it means only one copy of the underlying data is going away – there might still be other copies elsewhere. But when the final copy goes away – when the last constant or variable pointing at a class instance is destroyed – then the underlying data is also destroyed, and the memory it was using is returned back to the system.
# Day Three

## Arrays

Arrays are used to store multiple, addressable pieces of data. These are the same as a Python list but they can only hold one data type. If the first item is a string, the others will need to be strings. Some examples of arrays:

``` swift
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]
var scores = Array<Int>() // creates an empty array.
// or
var scores [String]() // Another way to create an empty array.
```

To view an item in an array, you use the arrays index. For example:

``` swift
print(beatles[0])
print(numbers[1])
print(temperatures[2])
```

As with Python, the index starts at 0.

To add items to an array, use the append method. For example:

``` swift
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])
```

To remove an item from an array, use the remove method. For example:

``` swift
scores.remove(at: 2)
```

Show the number of items in an array:
``` swift
print(scores.count)
```

## Dictionaries

A simple dictionary:

``` swift
let employee = ["name": "John Smith", "job": "Cleaner", "location": "Doncaster"]
print(employee["name"])
```

When you access data inside a dictionary, it will tell you that “you might get a value back, but you might get back nothing at all.” Swift calls these optionals because the existence of data is optional - it might be there or it might not.

Optionals are a pretty complex issue that we’ll be covering in detail later on, but for now a simple approach: when reading from a dictionary, you can provide a default value to use if the key doesn’t exist.

Here’s how that looks:

``` swift
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])
```

Because each dictionary item must exist at one specific key, dictionaries don’t allow duplicate keys to exist. Instead, if you set a value for a key that already exists, Swift will overwrite whatever was the previous value.

## Sets

There is a third very common way to group data, called a set – they are similar to arrays, except you can’t add duplicate items, and they don’t store their items in a particular order.

Creating a set works much like creating an array: tell Swift what kind of data it will store, then go ahead and add things. There are two important differences, though, and they are best demonstrated using some code.

``` swift
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)
```

Notice how that actually creates an array first, then puts that array into the set? That’s intentional, and it’s the standard way of creating a set from fixed data. Remember, the set will automatically remove any duplicate values, and it won’t remember the exact order that was used in the array.

Sets are faster to search with the `.contains()` method that on an array.

The `.count`, `.remove("value to remove")` and `.sorted()` methods also work with sets.

## Enums

An enum – short for enumeration – is a set of named values we can create and use in our code. They don’t have any special meaning to Swift, but they are more efficient and safer, so you’ll use them a lot in your code.

For example, create a list of weekdays that can be accessed: 

``` swift
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
```

`case` Is a way to declare a value to enumerate. If we want to get the value for monday, simply do:

``` swift
var day = Weekday.monday
print(day) // Returns monday
```

Another way to build an enum is with `,` instead of multiple case statements:

``` swift
enum WeekdayTwo {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}
print(WeekdayTwo.Tuesday)
```

The benefit here is that the list is pre-defined and as such, a person cannot then deviate from it and mess things up. They also cannot add to it like and array, set or dictionary. To add to it, you have to do it inside the enum itself (hardcoded).

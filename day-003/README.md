# Day Two

## Arrays

Arrays are used to store multiple, addressable pieces of data. These are the same as a Python list but they can only hold one data type. If the first item is a string, the others will need to be strings. Some examples of arrays:

``` swift
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]
var scores = Array<Int>() // creates an empty array
```

To view an item in an array, you use the arrays index. For example:

``` swift
print(beatles[0])
print(numbers[1])
print(temperatures[2])
```

As with Python, the index starts at 0.

To add items to an array, use the append method. For example:


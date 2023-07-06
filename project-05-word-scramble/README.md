# Project 5

## Lists

Lists are used for presentation of data, whereas forms are used for data entry.

You can mix dynamically generated rows with statically created rows in a list.

An example of a list with just dynamic data:

``` swift
struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        VStack {
            List(people, id: \.self) {
                    Text($0)
                }
            }
    }
}
```

`id: \.self` will present the data that is stored in the index of the array, rather than the index number.

An example of mixing dynamic and static content in a list. Note, the above method of using a short hand `foreach` loop in `List` is not available when mixing both static and dynamic. In this case, a `foreach` loop is needed to loop through dynamic content:

``` swift
List {
    Text("Static Row")

    ForEach(people, id: \.self) {
        Text($0)
    }

    Text("Static Row")
}
```

## Splitting Up Strings

One way to split up a string is to use the `.components` method against a var or let. For example:

``` swift
func test() {
    let input = "a,b,c"
    let letters = input.components(separatedBy: ",")
    print(letters)
}
```

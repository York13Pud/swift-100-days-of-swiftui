# Day Eleven

## Struct Access Control

Swift provides us with several options, but when you’re learning you’ll only need a handful:

- Use *public* for “let anyone, anywhere use this.” This is the default if nothing is specified.
- Use *private* for “don’t let anything outside the struct use this.”
- Use *private(set)* to allow for read-only access to a private var or let.
- Use *fileprivate* for “don’t let anything outside the current file use this.”

``` swift
struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
```

In the above example, if you try to call the `funds` var, swift will not allow it as it is marked as private. The only things that can access it is anything inside the struct.

If you change `private var funds = 0` to `private(set) var funds = 0`, you can read the value of it but not write to it.


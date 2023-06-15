import Cocoa

// The long way:

// Create an array of numbers:
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


// Filter out any numbers that are even

let oddLuckyNumbers = luckyNumbers.filter( {number in
    return number % 2 > 0 } )

print(oddLuckyNumbers)

// Sort the array in ascending order
let sortedOddLuckyNumbers = oddLuckyNumbers.sorted()
print(sortedOddLuckyNumbers)

// Map them to strings in the format “7 is a lucky number”
let luckyNumberStrings = sortedOddLuckyNumbers.map {"\($0) is a lucky number"}
// print(luckyNumberStrings)

// Print the resulting array, one item per line
for i in luckyNumberStrings {
    print(i)
}


// One shorter method:
func printLuckyNumbers(_ dataSet: [Int]) {
    dataSet.filter { !$0.isMultiple(of: 2) }
        .sorted()
        .map { print("\($0) is a lucky number") }
}

printLuckyNumbers(luckyNumbers)


// Another method (no function):
let isLucky = luckyNumbers
    .filter{ number in !number.isMultiple(of: 2) }
    .sorted()
    .map{"\($0) is a lucky number!"}

for i in isLucky {
    print(i)
}


// Last method (quickest):
luckyNumbers.filter { $0 % 2 != 0 }
            .sorted()
            .map { print("\($0) is a lucky number!!") }

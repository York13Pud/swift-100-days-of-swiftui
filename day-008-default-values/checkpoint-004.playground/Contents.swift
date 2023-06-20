import Cocoa

enum NumberError: Error {
    case outOfBound, noRoot
}

func getSquare(_ number:Int) throws -> Int {
    if (number < 1 || number > 10000) {
        throw NumberError.outOfBound
    }
    
    for i in 1...100 {
        if i*i == number {
            return i
        }
    }
    
    throw NumberError.noRoot
}


do {
    let result = try getSquare(64)
    print("Result: \(result)")
} catch NumberError.outOfBound {
    print("out of bounds")
} catch NumberError.noRoot {
    print("no Root")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

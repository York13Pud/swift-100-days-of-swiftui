//
//  ContentView.swift
//  word-scramble
//
//  Created by Neil Allwood on 06/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    func test() {
        let input = "a,b,c"
        let letters = input.components(separatedBy: ",")
        print(letters)
        
        let letter = letters.randomElement() // Get a single character
        print(letter ?? "a")
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines) // Remove whitespace
        print(trimmed ?? "")
        
        // Run a word through a spell checker:
        let word = "swift"
        let checker = UITextChecker() // The spell checker
        let range = NSRange(location: 0, length: word.utf16.count) // Specify the length of the word to check
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        print(allGood) // Returns true if word is spelled correctly, false otherwise.
    }
    
    var body: some View {
        VStack {
            List {
                Text("Static Row")
                
                ForEach(people, id: \.self) {
                    Text($0)
                }
                
                Text("Static Row")
            }
            Button("Click Me", action: {test()})
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

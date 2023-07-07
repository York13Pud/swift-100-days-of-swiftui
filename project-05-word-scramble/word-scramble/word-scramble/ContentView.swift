//
//  ContentView.swift
//  word-scramble
//
//  Created by Neil Allwood on 06/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle") // Adds a circle with the char count in it.
                            Text(word)
                        }
                    }
                }
            }
        }
        .navigationTitle(rootWord)
        .onSubmit(addNewWord)
        
    }
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return } // Checks that the word is > 0. If true, carry on. If false, stop
        
        withAnimation { // Make the item in the list show up in a nicer way.
            usedWords.insert(answer, at: 0) // Using insert rather than append will put the word at the beginning of
            // the array and show up at the top of the list of used words in the app.
            // Append would put the word at the bottom of the list in the app.
            newWord = "" // Blank out newWord to reset it.
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

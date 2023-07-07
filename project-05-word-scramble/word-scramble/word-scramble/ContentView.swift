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
    @State private var longestAnswer: Int = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                } header: {
                    Text("Enter your word")
                }
                
                Section {
                    HStack {
                        Text("Longest Word")
                        Spacer()
                        Text("\(longestAnswer)")
                    }
                } header: {
                    Text("Your Score")
                }
                
                Section {
                    Section {
                        Button("New Word Please Bob!", action: startGame)
                            .listRowBackground(Color.red)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
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
            .navigationTitle(rootWord)

            .onSubmit(addNewWord)
            .onAppear(perform: startGame)

            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }

        
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return } // Checks that the word is > 0. If true, carry on. If false, stop
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isRootWord(word: answer) else {
            wordError(title: "Same as starter", message: "You can't use the same word as the starter word!")
            return
        }
        
        guard isWordThreeOrMore(word: answer) else {
            wordError(title: "Word is too short", message: "You're word needs to be more than there characters long!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognised", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation { // Make the item in the list show up in a nicer way.
            usedWords.insert(answer, at: 0) // Using insert rather than append will put the word at the beginning of
            // the array and show up at the top of the list of used words in the app.
            // Append would put the word at the bottom of the list in the app.
            newWord = "" // Blank out newWord to reset it.
        }
        
        if let max = usedWords.max(by: {$1.count > $0.count}) {
            longestAnswer = max.count
        }
    }
    
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle:
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            
            // 2. Load start.txt into a string:
            if let startWords = try? String(contentsOf: startWordsURL) {
                
                // 3. Split the string up into an array of strings, splitting on line breaks:
                let allWords = startWords.components(separatedBy: "\n")
                
                // 4. Pick one random word, or use "silkworm" as a sensible default:
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // 5. Empty all of the values from the usedWords array:
                usedWords.removeAll()
                
                // 6. Reset longestAnswer to 0
                longestAnswer = 0
                
                // If we are here everything has worked, so we can exit:
                return
            }
            
        }
        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isRootWord(word: String) -> Bool {
        word != rootWord
    }
    
    func isWordThreeOrMore(word: String) -> Bool {
        word.count > 3
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

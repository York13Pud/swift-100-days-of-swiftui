//
//  ContentView.swift
//  WeSplit
//
//  Created by Neil Allwood on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    let characters = ["Ryu", "Ken", "Guile", "Chun-Li", "Zangief", "Dhalsim", "Blanka", "E. Honda"]
    @State private var selectedCharacter = "Ryu"
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section {
                        TextField("Enter your name", text: $name)
                        Text("Your name is \(name)")
                    } header: {
                        Text("An example of a textfield")
                    }
                    
                    Section {
                        Picker("Select your character", selection: $selectedCharacter) {
                            ForEach(characters, id: \.self) {
                                Text($0)
                            }
                        }
                    } header: {
                        Text("An example of a picker")
                    }
                    
                    Section {
                        Text("Hello, world!")
                    } header: {
                        Text("An example of a text box")
                    } footer: {
                        Text("Here is a footer of text")
                    }
                    
                    Section {
                        ForEach(1..<11) { number in
                            Text("Row \(number)")
                        }
                    } header: {
                        Text("An example of a foreach loop")
                    }
                }
                .navigationTitle("Example Elements")
            }
            
            Button("Tap Count \(tapCount)") {
                tapCount += 1
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

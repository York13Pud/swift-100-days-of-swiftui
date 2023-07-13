//
//  ContentView.swift
//  iexpense
//
//  Created by Neil Allwood on 10/07/2023.
//

import SwiftUI


class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

// This view will be used for a sheet that will pop-up.
struct SecondView: View {
    @Environment(\.dismiss) var dismiss // This will be used to dismiss the sheet
    
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello \(name)")
            Button("Dismiss Sheet") {
                dismiss()
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var user = User()

    @State public var showingSheet = false

    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    // This will save the tap count to user defaults with a key name of "Tap":
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    // This will do the same as the above but using AppStorage instead.
    // AppStorage allows for a default value to be assigned if the key does not exist:
    @AppStorage("tapCountAppStorage") private var tapCountAppStorage = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName).")

                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
                
                Button("Show Sheet") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SecondView(name: "Fred")
                }
                
                // Adds one to tapCount and shows the value from the UserDefaults "Tap" key:
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                    UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                }
                
                // Does the same as the above but uses AppStorage instead:
                Button("Tap count: \(tapCountAppStorage)") {
                    tapCountAppStorage += 1
                }
                
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }.onDelete(perform: removeRows)
                }
                
                Button("Add Number To List") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
            }.navigationTitle("Testing")
                .toolbar {
                    EditButton()
                }
            
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



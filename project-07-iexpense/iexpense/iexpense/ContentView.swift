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

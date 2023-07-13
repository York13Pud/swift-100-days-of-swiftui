//
//  ContentView.swift
//  iexpense
//
//  Created by Neil Allwood on 10/07/2023.
//

import SwiftUI

// Create a new datatype struct that comprises the data to store for an expense:
struct ExpenseItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}

// Create an array of expenses as a class that is published for updates:
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            
            // A list of all expenses:
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                    // Text("\(item.id)")
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                
                // A button to add an expense:
                Button {
                    showingAddExpense = true
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
        
    }
    
    // A function to remove an item from the expense array and list:
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



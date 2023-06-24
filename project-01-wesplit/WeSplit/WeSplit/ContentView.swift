//
//  ContentView.swift
//  WeSplit
//
//  Created by Neil Allwood on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    private let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Array<Double> {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = tipSelection * (checkAmount / 100)
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return [amountPerPerson, tipValue, grandTotal]
    }
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    
                    Section {
                        HStack {
                            Text("Enter Bill Amount")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .keyboardType(.decimalPad)
                                .focused($amountIsFocused)
                                .multilineTextAlignment(.trailing)
                        }
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<100) {
                                Text("\($0) People")
                            }
                        }
                    }
                    
                    Section {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        } .pickerStyle(.segmented)
                    } header: {
                        Text("Tip Amount")
                    }
                    
                    Section {
                        HStack {
                            Text("Total Tip Value")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(totalPerPerson[1], format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        HStack {
                            Text("Total Bill Value")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(totalPerPerson[2], format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        HStack {
                            Text("Total Per Person")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(totalPerPerson[0], format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                    } header: {
                        Text("Totals")
                    }
                    
                } .navigationTitle("We Split")
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                amountIsFocused = false
                            }
                        }
                    }
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

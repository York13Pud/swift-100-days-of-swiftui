//
//  ContentView.swift
//  temperature-converter
//
//  Created by Neil Allwood on 25/06/2023.
//
// Objectives:
// =============
// 1. Get the user to input the temperature).
// 2. User specifies the units (c, f or kelvin).
// 3. Show conversion to the other units).
//

import SwiftUI

struct ContentView: View {
    @State private var temperature: Double = 0
    private let temperatureUnits: Array = ["C", "F", "Kel"]

    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section {
                        HStack {
                            Text("Enter Temperature") .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("Amount", value: $temperature, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                                .multilineTextAlignment(.trailing)
                            
                            
                        }
                    } header: {
                        Text("Convert From")
                    }
                } .navigationTitle("We Split")
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isFocused = false
                            }
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

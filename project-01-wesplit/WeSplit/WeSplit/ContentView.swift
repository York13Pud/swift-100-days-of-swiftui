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
    @State private var tipPercentage: Int = 20
    
    private let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
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

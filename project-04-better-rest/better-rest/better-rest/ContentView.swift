//
//  ContentView.swift
//  better-rest
//
//  Created by Neil Allwood on 04/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount: Double = 8.0
    @State private var wakeUp: Date = Date.now
    @State private var coffeeAmount: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker("Please enter a date",
                           selection: $wakeUp,
                           in: Date.now...,
                           displayedComponents: .hourAndMinute)
                .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) Hours",
                        value: $sleepAmount,
                        in: 4...12,
                        step: 0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper(coffeeAmount == 1 ? "\(coffeeAmount) Cup" : "\(coffeeAmount) Cups",
                        value: $coffeeAmount,
                        in: 1...20)
            }
            .navigationTitle("Better Rest")
            .toolbar{
                Button("Calculate", action: calculateBedtime)
            }
        }
    }
    
    func calculateBedtime() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

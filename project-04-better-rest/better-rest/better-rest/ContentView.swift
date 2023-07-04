//
//  ContentView.swift
//  better-rest
//
//  Created by Neil Allwood on 04/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now

    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours",
                    value: $sleepAmount,
                    in: 4...12,
                    step: 0.25)
            DatePicker("Please enter a date",
                       selection: $wakeUp,
                       in: Date.now...,
                       displayedComponents: .date)
                .labelsHidden()
            Text(wakeUp, format: .dateTime.day().month().year())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

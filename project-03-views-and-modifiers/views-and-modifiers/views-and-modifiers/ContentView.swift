//
//  ContentView.swift
//  views-and-modifiers
//
//  Created by Neil Allwood on 29/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    var body: some View {
        VStack {
            // An example of modifier order. Change background to be after .frame for aa different look
            Text("Hello")
                .background(.red)
                .frame(maxWidth: 100, maxHeight: 100)
            
            Text("Hello")
                .frame(maxWidth: 100, maxHeight: 100)
                .background(.red)
            
            // An example of modifier order execution:
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            
            // An example of a conditional modifier:
            Button("Hello World") {
                        // flip the Boolean between true and false
                        useRedText.toggle()
                    }
                    .foregroundColor(useRedText ? .red : .blue)
            
            // An example of an environment modifier
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title) // This is an environment modifier.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

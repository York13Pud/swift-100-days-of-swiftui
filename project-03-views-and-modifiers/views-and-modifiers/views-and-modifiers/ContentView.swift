//
//  ContentView.swift
//  views-and-modifiers
//
//  Created by Neil Allwood on 29/06/2023.
//

import SwiftUI

// An example of a custom view composition:
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

// An example of a custom modifier:
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// Create an extension for view to add titleStyle that uses the above custom modifier.
// This will make it easier to call:
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

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
            
            // Example 1 of using a custom modifier:
            Text("Hello World")
                .modifier(Title())
            
            // Example 1 of using a custom modifier - Use the titleStyle extension:
            Text("Hello World")
                .titleStyle() // Both results are the same.
            
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
            
            // An example of calling a custom view composition:
            VStack(spacing: 10) {
                        CapsuleText(text: "First")
                        CapsuleText(text: "Second")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

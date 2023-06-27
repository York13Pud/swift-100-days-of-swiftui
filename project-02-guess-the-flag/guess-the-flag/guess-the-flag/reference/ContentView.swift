//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Neil Allwood on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.white
//            }
            VStack {
                // Text("Some Content")
                //.foregroundColor(.secondary) // secondary is a built-in system colour. Usually the opposite of primary.
                //    .foregroundStyle(.secondary) // Allows some of the background colour to mix in.
                //    .padding(50)
                //    .background(.ultraThinMaterial) // ultraThinMaterial adds a frosted effect.
               
                // Color.red //This will change the entire background to red
                //    .frame(width: 200, height: 200) // This allows you to control the size of the colour in a zstack.
                //    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200) // Sets a min width and a max to be as wide as posible.
                
                Button("Button 1") {}
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) {}
                    .buttonStyle(.bordered)
                Button("Button 3") {}
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                Button("Button 4", role: .destructive) {}
                    .buttonStyle(.borderedProminent)
                
                // A completely custom button style:
                Button {
                    print("Button was pressed")
                } label: {
                    Text("Press Me")
                        .padding()
                        .foregroundColor(.white)
                        .background(.purple)
                }
                
                Button("Show Alert") {
                    showingAlert = true
                } .buttonStyle(.borderedProminent)
                    .tint(.black)
                .alert("Message", isPresented: $showingAlert) {
                    Button("Ok", role: .cancel) {
                        print("Alert cleared")
                    }
                } message: {
                    Text("Here is some alert text")
                }
                
                // A custom button using system (SF Symbols) image:
                Button {
                    print("Compose Button was pressed")
                } label: {
                    Label("Compose", systemImage: "pencil") // The "Compose" text is optional if you just want the icon.
                }
                
                // Text("Some Text")
            } // .background(.blue) // This will change only the zstack text to blue if color.red is not active.
            .ignoresSafeArea() // Allows you to use the space near the notch and the bottom that is normally left.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Neil Allwood on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Some Content")
                //.foregroundColor(.secondary) // secondary is a built-in system colour. Usually the opposite of primary.
                .foregroundStyle(.secondary) // Allows some of the background colour to mix in.
                .padding(50)
                .background(.ultraThinMaterial) // ultraThinMaterial adds a frosted effect.
                // Color.red //This will change the entire background to red
                //    .frame(width: 200, height: 200) // This allows you to control the size of the colour in a zstack.
                //    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200) // Sets a min width and a max to be as wide as pobbible.
            
            // Text("Some Text")
        } // .background(.blue) // This will change only the zstack text to blue if color.red is not active.
        .ignoresSafeArea() // Allows you to use the space near the notch and the bottom that is normally left.
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

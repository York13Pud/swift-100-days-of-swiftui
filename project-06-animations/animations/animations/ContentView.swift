//
//  ContentView.swift
//  animations
//
//  Created by Neil Allwood on 10/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 0.25
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount) // Adds a scale factor to increase the size of the button
        .animation(.default, value: animationAmount) // Animates the size increase
        //.blur(radius: (animationAmount - 1) * 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

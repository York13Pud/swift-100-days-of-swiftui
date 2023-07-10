//
//  ContentView.swift
//  animations
//
//  Created by Neil Allwood on 10/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount1 = 1.0
    @State private var animationAmount2 = 1.0
    @State private var animationAmount3 = 1.0
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                animationAmount1 += 0.25
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount1) // Adds a scale factor to increase the size of the button
            .animation(.default,
                       value: animationAmount1) // Animates the size increase. .default has many alternatives.
            //.blur(radius: (animationAmount - 1) * 3)
            
            Button("Tap Me") {
                animationAmount2 += 0.25
            }
            .padding(50)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount2)
            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true),
                       value: animationAmount2)
            
            Button("Tap Me") {
                animationAmount3 += 0.25
            }
            .padding(50)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.green)
                    .scaleEffect(animationAmount3)
                    .opacity(2 - animationAmount3)
                    .animation(
                        .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount3
                    )
            )
            .onAppear {
                animationAmount3 = 2
            }
            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true),
                       value: animationAmount2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

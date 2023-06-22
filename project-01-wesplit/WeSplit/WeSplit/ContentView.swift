//
//  ContentView.swift
//  WeSplit
//
//  Created by Neil Allwood on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
            NavigationView {
                Form {
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                    } header: {
                        Text("This is a header")
                    }
                    
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                    } header: {
                        Text("This is another header")
                    } footer: {
                        Text("Here is a footer of text")
                    }
                }
                .navigationTitle("SwiftUI")
            }
            Button("Tap Count \(tapCount)") {
                tapCount += 1
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

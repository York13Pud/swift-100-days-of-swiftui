//
//  ContentView.swift
//  WeSplit
//
//  Created by Neil Allwood on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  rock-paper-scissors
//
//  Created by Neil Allwood on 30/06/2023.
//

import SwiftUI

let choices: Array<String> = ["rock", "paper", "scissors"]

struct ContentView: View {
    @State var playerChoice:String = ""
    @State var computerChoice:String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  word-scramble
//
//  Created by Neil Allwood on 06/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    func test() {
        let input = "a,b,c"
        let letters = input.components(separatedBy: ",")
        print(letters)
    }
    
    var body: some View {
        VStack {
            List {
                Text("Static Row")
                
                ForEach(people, id: \.self) {
                    Text($0)
                }
                
                Text("Static Row")
            }
            Button("Click Me", action: {test()})
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

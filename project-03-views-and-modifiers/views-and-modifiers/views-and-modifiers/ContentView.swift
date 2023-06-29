//
//  ContentView.swift
//  views-and-modifiers
//
//  Created by Neil Allwood on 29/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

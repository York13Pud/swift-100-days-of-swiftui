//
//  ContentView.swift
//  iexpense
//
//  Created by Neil Allwood on 10/07/2023.
//

import SwiftUI


class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

// This view will be used for a sheet that will pop-up.
struct SecondView: View {
    var body: some View {
        Text("Second View")
    }
}

struct ContentView: View {
    @StateObject private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

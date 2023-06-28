//
//  ContentView.swift
//  guess-the-flag
//
//  Created by Neil Allwood on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showingScore: Bool = false
    @State private var playerScore: Int = 0
    @State private var questionCount: Int = 1
    @State private var gameOver: Bool = false
    
    @State var correctAnswer: Int = Int.random(in: 0...2)
    @State var countries: Array = ["Estonia", "France", "Germany", "Ireland", "Italy",
                     "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.cyan, .purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the flag".capitalized)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Spacer()
                VStack(spacing: 15) {
                    
                    VStack {
                        
                        Text("Tap the flag of".capitalized)
                            .font(.subheadline.weight(.heavy))
                            .textCase(.uppercase)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .textCase(.uppercase)
                        
                    } .foregroundStyle(.secondary)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                        
                    }
                    if questionCount > 8 {
                        Text("Game OVer")
                            .font(.subheadline.weight(.heavy))
                            .textCase(.uppercase)
                            .foregroundStyle(.secondary)
                    } else {
                        Text("Question \(questionCount) of 8")
                            .font(.subheadline.weight(.heavy))
                            .textCase(.uppercase)
                            .foregroundStyle(.secondary)
                    }
                    
                } .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
//                Spacer()
                
                Text("Score: \(playerScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                
            } .padding()
            
        } .alert(alertTitle, isPresented: $gameOver) {
            Button("Restart", action: resetGame)
              
        } message: { Text(alertMessage) }
        
        .alert(alertTitle, isPresented: $showingScore) {
            Button("Restart", role: .destructive, action: resetGame)
            Button("Continue", role: .cancel, action: askQuestion)
            
            
        } message: { Text(alertMessage) }

          
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            alertTitle = "Correct"
            playerScore += 1
            alertMessage = "Your score is now \(playerScore)"
            
        } else {
            alertTitle = "Incorrect"
            alertMessage = "That was the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        questionCount += 1
        
        if questionCount > 8 {
            alertTitle = "Game Over"
            alertMessage = "Your score is \(playerScore) out of 8"
            gameOver = true
        }

        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        alertTitle = ""
        alertMessage = ""
        showingScore = false
        playerScore = 0
        questionCount = 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}

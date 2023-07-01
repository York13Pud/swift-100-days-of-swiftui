//
//  ContentView.swift
//  rock-paper-scissors
//
//  Created by Neil Allwood on 30/06/2023.
//

import SwiftUI

let choice: Array<String> = ["Rock", "Paper", "Scissors"]
let choiceEmoji: Array<String> = ["✊", "✋", "✌️"]
let choiceBeats: Array<String> = ["Scissors", "Rock", "Paper"]

// A custom modifier for most of the text:
struct subTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
    }
}

// Custom extension for subTitle:
extension View {
    func subTitleStyle() -> some View {
        modifier(subTitle())
    }
}

// A custom modifier for the choice buttons:
struct choiceButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// Custom extension for choiceButton:
extension View {
    func choiceButtonStyle() -> some View {
        modifier(choiceButton())
    }
}

struct choiceLabel: View {
    var choiceIcon: String
    var choiceText: String
    
    var body: some View {
        VStack {
            Text(choiceIcon)
                .font(.largeTitle)
            Text(choiceText)
                .font(.body)
                .foregroundColor(.primary)
        }
    }
}

struct ContentView: View {
    @State var playerChoice:String = ""
    @State var computerChoice:String = ""
    
    @State var playerScore:Int = 0
    @State var computerScore:Int = 0
    @State var roundCounter:Int = 0
    
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .red]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
         
            VStack {
                
                // App title:
                Text("rock - paper - scissors".capitalized)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                // End of app title.
                
                // Player choice area:
                VStack {
                    
                    Spacer()
                    
                    Text("Select your move".capitalized)
                    
                    HStack {
                        
                        ForEach(0..<3) { number in
                            Button {
                                print(choice[number])
                            }
                            label: {
                                choiceLabel(choiceIcon: choiceEmoji[number],
                                            choiceText: choice[number])
                                
                            } .choiceButtonStyle()
                        }
                        
                    }
                    // End of player choice area.
                    Text("Round 1 / 10".capitalized)
                    Spacer()
                    
                    // Scores area:
                    VStack {

                        HStack {
                            
                            VStack {
                                Text("Player".capitalized)
                                Text("\(playerScore)".capitalized)
                            }
                            Spacer()
                            
                            VStack {
                                Text("Scores".capitalized)
                                Text(" ")
                            }
                            
                            Spacer()
                            VStack {
                                Text("Device".capitalized)
                                Text("\(computerScore)".capitalized)
                            }
                            
                        }
                        
                    }
                    // End of scores area.
                    
                } .subTitleStyle()
            }
            .padding()
        }
    }
    
    // Functions in here
    
    // Check choices
    
    
    
    // Restart game
    func restartGame() {
        playerChoice = ""
        computerChoice = ""
            
        playerScore = 0
        computerScore = 0
        roundCounter = 0
            
        showAlert = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

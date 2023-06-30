//
//  ContentView.swift
//  rock-paper-scissors
//
//  Created by Neil Allwood on 30/06/2023.
//

import SwiftUI

let choice: Array<String> = ["rock", "paper", "scissors"]
let choiceEmoji: Array<String> = ["✊", "✋", "✌️"]
let choiceBeats: Array<String> = ["scissors", "rock", "paper"]

struct ContentView: View {
    @State var playerChoice:String = ""
    @State var computerChoice:String = ""
    
    @State var playerScore:Int = 0
    @State var computerScore:Int = 0
    
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.cyan, .purple]), startPoint: .top, endPoint: .bottom)
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
                        .font(.title)
                        .foregroundColor(.white)
                    
                    HStack {
                        Button {
                            print("rock")
                        }
                        label: {
                            VStack {
                                Text("✊")
                                    .font(.largeTitle)
                                Text("Rock")
                                    .foregroundColor(.primary)
                            }
                            
                        }.frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Spacer()
                        
                    Button {
                            print("paper")
                        }
                        label: {
                            VStack {
                                Text("✋")
                                    .font(.largeTitle)
                                Text("Paper")
                                    .foregroundColor(.primary)
                            }
                        }
                        .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))

                    Spacer()
                    
                    Button {
                        print("Scissors")
                    }
                    label: {
                        VStack {
                            Text("✌️")
                                .font(.largeTitle)
                            Text("Scissors")
                                .foregroundColor(.primary)
                        }
                    }
                    .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    // End of player choice area.

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
                    }.font(.title)
                        .foregroundColor(.white)
                    // End of scores area.
                    
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

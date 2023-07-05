//
//  ContentView.swift
//  better-rest
//
//  Created by Neil Allwood on 04/07/2023.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var coffeeAmount: Int = 1
    @State private var sleepAmount: Double = 8.0
    @State private var wakeUp: Date = defaultWakeTime
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var bedTime: Date = defaultWakeTime
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    DatePicker("Please enter a time".capitalized,
                               selection: $wakeUp,
                               // in: Date.now...,
                               displayedComponents: .hourAndMinute)
                    
                    .onChange(of: wakeUp) { value in
                        calculateBedtime()
                    }

                } header: {
                    Text("When do you want to wake up?")
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) Hours",
                            value: $sleepAmount,
                            in: 4...12,
                            step: 0.25)
                    .onChange(of: sleepAmount) { newValue in
                        calculateBedtime()
                    }
                } header: {
                    Text("Desired amount of sleep")
                }
                
//                Section {
//                    Stepper(coffeeAmount == 1 ? "\(coffeeAmount) Cup" : "\(coffeeAmount) Cups",
//                            value: $coffeeAmount,
//                            in: 1...20)
//                    .onChange(of: coffeeAmount) { newValue in
//                        calculateBedtime()
//                    }
//                } header: {
//                    Text("Daily coffee intake")
//                }
                
                Section {
                    Picker("Cups Per Day", selection: $coffeeAmount) {
                        ForEach(0..<21) {
                            if $0 == 0 {
                                // Do nothing as we don't need to see it.
                            } else if $0 == 1 {
                                Text("\($0) Cup")
                            } else {
                                Text("\($0) Cups")
                            }
                        }
                    }.pickerStyle(.navigationLink)
                    .onChange(of: coffeeAmount) { newValue in
                        calculateBedtime()
                    }
                } header: {
                    Text("Daily coffee intake")
                }

//                Button(action: {
//                    calculateBedtime()
//                }, label: {
//                    Text("Show Bedtime")
//                        .frame(maxWidth: .infinity)
//                })
                HStack {
                    Text("Your Bedtime Is: ")
                    Spacer()
                    Text(bedTime.formatted(date: .omitted, time: .shortened))
                    
                }.font(.title2)
                    .foregroundColor(.red)
                
            }
            .navigationTitle("Better Rest")
//            // Setup the alert message:
//            .alert(alertTitle, isPresented: $showingAlert) {
//                Button("OK") { }
//            } message: {
//                Text(alertMessage)
//            }
            
        }
    
    }
        
    func calculateBedtime() {
        
        do {
            
//            if coffeeAmount >= 10 {
//                alertTitle = "Info"
//                alertMessage = "You need HELP!!"
//            } else {
                
                // Instantiate the SleepCalculator model:
                let config = MLModelConfiguration()
                let model = try SleepCalculator(configuration: config)
                
                // Gate the components for the time:
                let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
                let hour = (components.hour ?? 0) * 60 * 60 // Convert hours to seconds
                let minute = (components.minute ?? 0) * 60 // Convert minutes to seconds
                
                // Run a prediction:
                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
                
                // Define the time to sleep:
                let sleepTime = wakeUp - prediction.actualSleep
                
                bedTime = sleepTime
                
                // Specify the settings for the alert:
//                alertTitle = "Your ideal bedtime is…"
//                alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            //}
            
        } catch {
            // Specify the settings for the error alert:
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            
        }
        // Show the alert:
        showingAlert = true
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


//
//  ContentView.swift
//  temperature-converter
//
//  Created by Neil Allwood on 25/06/2023.
//
// Objectives:
// =============
// 1. Get the user to input the temperature).
// 2. User specifies the units (c, f or kelvin).
// 3. Show conversion to the other units).
//

import SwiftUI

struct ContentView: View {
    // Define required vars and constants:
    
    let temperatureUnits: Array = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @State private var temperature: Double = 0.00
    @State private var temperatureUnit: String = "Celsius"
    @State private var convertTemperatureToUnit: String = "Fahrenheit"
    
    @FocusState private var isFocused: Bool
    
    // This variable performs the conversion from one unit to another:
    var convertedTemperatures: Double {
        
        if temperatureUnit == "Celsius" && convertTemperatureToUnit == "Fahrenheit" {
            let convertedValue = (temperature * 9/5) + 32
            return convertedValue
        } else if temperatureUnit == "Celsius" && convertTemperatureToUnit == "Kelvin" {
            let convertedValue = temperature + 273.15
            return convertedValue
        } else if temperatureUnit == "Fahrenheit" && convertTemperatureToUnit == "Celsius" {
            let convertedValue = (temperature - 32) * 5/9
            return convertedValue
        } else if temperatureUnit == "Fahrenheit" && convertTemperatureToUnit == "Kelvin" {
            let convertedValue = (temperature - 32) * 5/9 + 273.15
            return convertedValue
        } else if temperatureUnit == "Kelvin" && convertTemperatureToUnit == "Celsius" {
            let convertedValue = temperature - 273.15
            return convertedValue
        } else if temperatureUnit == "Kelvin" && convertTemperatureToUnit == "Fahrenheit" {
            let convertedValue = (temperature - 273.15) * 9/5 + 32
            return convertedValue
        }
        
        return temperature
    }
        
    var body: some View {
        VStack {
            NavigationView {
                
                Form {
                    
                    Section {
                        
                        HStack {
                            Text("Enter Temperature") .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("Temperature", value: $temperature, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        Picker("Convert From", selection: $temperatureUnit) {
                            ForEach(temperatureUnits, id: \.self ) { unit in
                                // Show only the units that are not the same as Convert To:
                                if unit != convertTemperatureToUnit {
                                    Text(unit)
                                }

                            }
                        }
                        
                        Picker("Convert To", selection: $convertTemperatureToUnit) {
                            ForEach(temperatureUnits, id: \.self ) { unit in
                                // Show only the units that are not the same as Convert From:
                                if unit != temperatureUnit {
                                    Text(unit)
                                }
                            }
                        }
                        
                    } header: {
                        Text("Convert From")
                    }
                    
                    Section {
                        
                        HStack {
                            Text("Temperature in \(convertTemperatureToUnit)") .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(convertedTemperatures, specifier: "%.2f")")
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                                .multilineTextAlignment(.trailing)
                        }
                        
                    } header: {
                        Text("Converted Temperature")
                    }
                    
                } .navigationTitle("Temp Converter V0")
                    
                    // Show a Done button on the keyboard in the top right:
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isFocused = false
                            }
                        }
                    }
            }
        }
    }
}

// Show a preview of the ContentView:

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


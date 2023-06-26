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
    private let temperatureUnits: Array = ["Celsius", "Fahrenheit", "Kelvin"]

    @State private var temperature: Double = 0.00
    @State private var temperatureUnit: String = "Celsius"

    @FocusState private var isFocused: Bool
    
    var convertedTemperatures: Dictionary<String, Double> {
        var convertedC: Double = 0
        var convertedF: Double = 0
        var convertedKelvin: Double = 0
        
        if temperatureUnit == "Celsius" {
            convertedC = temperature
            convertedF = (temperature * 9/5) + 32
            convertedKelvin = temperature + 273.15
        } else if temperatureUnit == "Fahrenheit" {
            convertedC = (temperature - 32) * 5/9
            convertedF = temperature
            convertedKelvin = (temperature - 32) * 5/9 + 273.15
        } else if temperatureUnit == "Kelvin" {
            convertedC = temperature - 273.15
            convertedF = (temperature - 273.15) * 9/5 + 32
            convertedKelvin = temperature
        }
        
        return ["Celsius": convertedC, "Fahrenheit": convertedF, "Kelvin": convertedKelvin]
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
                                ForEach(temperatureUnits, id: \.self ) {
                                    Text($0)
                                }
                            }
                    } header: {
                        Text("Convert From")
                    }
                    
                    Section {
                        ForEach(Array(convertedTemperatures.keys.sorted()), id: \.self) {key in
                            if key != temperatureUnit {
                                HStack {
                                    Text("Converted To \(key)") .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(convertedTemperatures[key] ?? 0.0, specifier: "%.2f")")
                                }
                            }
                        }
                        
                    } header: {
                        Text("Converted Temperatures")
                    }
                    
                } .navigationTitle("Temperature Converter")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

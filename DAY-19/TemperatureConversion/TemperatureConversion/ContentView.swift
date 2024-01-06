//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Laxman Singh Koranga on 06/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tempInCelsius: Double = 0.0
    @State private var tempInFahrenheit: Double = 0.0
    
    // Conversion of Celsius -> Fahrenheit.
    var celsiusToFahrenheit: Double {
        let Fahrenheit = Double((tempInCelsius * 9/5) + 32)
        return Fahrenheit
    }
    // Conversion of Fahrenheit -> Celsius.
    var fahreheitToCelsius: Double {
        let Celsius = Double((tempInFahrenheit - 32) * (5/9))
        return Celsius
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Temperature in C°") {
                    TextField("C°", value: $tempInCelsius, format: .number)
                }
                
                Section("Temperature in F°") {
                    Text(celsiusToFahrenheit, format: .number)
                }
            }
            .navigationTitle("Temperature")
        }
        
    }
}

#Preview {
    ContentView()
}

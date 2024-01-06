//
//  ContentView.swift
//  LengthConversion
//
//  Created by Laxman Singh Koranga on 06/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var meters: Double = 0.0
    @State private var kilometers: Double = 0.0
    @State private var conversionInputMethod: String = "m"
    @State private var conversionOutputMethod: String = "m"
    
    let conversionMethods = ["m","km","feet","yard","miles"]
    
    var meterToKilometer: Double {
        let km = (meters / 1000)
        return km
    }
    var meterToFeet: Double {
        let feet = (meters * 3.28084)
        return feet
    }
    var meterToYard: Double {
        let yard = (meters *  1.0936)
        return yard
    }
    var meterToMiles: Double {
        let miles = (meters * 0.00062137)
        return miles
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("INPUT") {
                    TextField("Length in m", value: $meters, format: .number)
                    Picker("Type", selection: $conversionInputMethod) {
                        ForEach(conversionMethods, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("OUTPUT") {
                    Picker("Type", selection: $conversionOutputMethod) {
                        ForEach(conversionMethods, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
//                    Text(, format: .number)
                }
            }
            .navigationTitle("Length Conversion")
        }
    }
}
#Preview {
    ContentView()
}

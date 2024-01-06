//
//  ContentView.swift
//  LengthConversion
//
//  Created by Laxman Singh Koranga on 06/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber: Double?
    @State private var inputUnits: UnitLength = .meters
    @State private var outputUnits: UnitLength = .feet
    @FocusState private var inputNumberIsFocused: Bool
    
    var outputNumber: Double? {
        guard let inputNumber = inputNumber else { return nil }
        let inputMeasurement = Measurement(value: inputNumber, unit: inputUnits)
        
        return inputMeasurement.converted(to: outputUnits).value
    }
    
    let units: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    var body: some View {
        NavigationStack {
            Form {
                // First Section -> INPUT NUMBER
                Section {
                    TextField("Enter a number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputNumberIsFocused)
                }
                // Second Section -> INPUT UNIT
                Section("INPUT UNITS") {
                    Picker("Input Units", selection: $inputUnits) {
                        ForEach(units, id: \.self) {
                            Text("\($0.symbol)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                // Third Section -> OUTPUT UNIT
                Section("OUTPUT UNITS") {
                    Picker("Output Units", selection: $outputUnits) {
                        ForEach(units, id: \.self) {
                            Text("\($0.symbol)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                // Fourth Section -> Result
                Section("Result") {
                    Text(outputNumber?.formatted() ?? "")
                }
            }
            .navigationTitle("Length Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputNumberIsFocused = false
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

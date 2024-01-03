//
//  ContentView.swift
//  WeSplit
//
//  Created by Laxman Singh Koranga on 03/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            Picker("Number of people", selection: $numberOfPeople) {
                ForEach(2 ..< 100) {
                    Text("\($0) people")
                }
            }
//            .pickerStyle(.navigationLink)
            
//            Section {
//                Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//            }
        }
    }
}

#Preview {
    ContentView()
}

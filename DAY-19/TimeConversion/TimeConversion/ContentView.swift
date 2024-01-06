//
//  ContentView.swift
//  TimeConversion
//
//  Created by Laxman Singh Koranga on 06/01/2024.
//

import SwiftUI

func calculateSecond(value: Int, source: String, target: String) -> Double {
    let dict = [
        "second": 1,
        "minutes": 60,
        "hour": 3600,                   // 60 * 60
        "day": 86400,                   // 3600 * 24
        "week": 604800,                 // 86400 * 7
        "month": 2629743.83,
        "year": 31556926,
        "century": 3155692600,
        "Average human life": 2208984820
    ]
    return Double(value) * dict[source]! / dict[target]!
}
struct ContentView: View {
    @State private var time = 0
    @State private var selectedTime = 0
    @State private var timeValue = ""
    
    var amount = 0
    let timeUnits = ["second","minutes","hour","day","week","month","year","century","Average human life"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input"){
                    TextField("Enter the value", text: $timeValue)
                        .keyboardType(.numberPad)
                }
                Section {
                    Picker("From", selection: $time) {
                        ForEach(0..<timeUnits.count) {
                            Text(timeUnits[$0])
                        }
                    }
                }
                Section {
                    Picker("To", selection: $selectedTime) {
                        ForEach(0..<timeUnits.count) {
                            Text(timeUnits[$0])
                        }
                    }
                }
                Section("OUTPUT") {
                    Text("\(timeValue == "" ? "0": timeValue) \(timeUnits[time]) = \(calculateSecond(value: Int(timeValue) ?? 0, source: timeUnits[time], target: timeUnits[selectedTime]), specifier: "%.2f") \(timeUnits[selectedTime])")
                }
            }
            .navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    ContentView()
}

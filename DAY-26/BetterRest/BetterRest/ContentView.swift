//
//  ContentView.swift
//  BetterRest
//
//  Created by Laxman Singh Koranga on 14/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    @State private var coffeeAmount = 1
    
    var body: some View {
//        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
//            .labelsHidden()
//        Text(Date.now, format: .dateTime.day().month().year())
//        Text(Date.now.formatted(date: .long, time: .shortened))
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
    }
    
//    func exampleDates() {
//        let now = Date.now
//        let tommorow = Date.now.addingTimeInterval(86400)
//        let range = now...tommorow
        
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
//        
//        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
        func calculateBedTime() {
            
        }
    }
}

#Preview {
    ContentView()
}

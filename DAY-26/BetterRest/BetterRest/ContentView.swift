//
//  ContentView.swift
//  BetterRest
//
//  Created by Laxman Singh Koranga on 14/01/2024.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 6
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
//        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
//            .labelsHidden()
//        Text(Date.now, format: .dateTime.day().month().year())
//        Text(Date.now.formatted(date: .long, time: .shortened))
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
//                    Text("When do you want to wake up?")
//                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section("Desired amount of sleep") {
//                    Text("Desired amount of sleep")
//                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                Section("Daily coffee intake") {
//                    Text("Daily coffee intake")
//                        .font(.headline)
//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                }
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
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
            do {
                let config = MLModelConfiguration()
                let model = try SleepCalculator(configuration: config)
                
                let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
                let hour = (components.hour ?? 0) * 60 * 60
                let minute = (components.minute ?? 0) * 60
                
                let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
                let sleepTime = wakeUp - prediction.actualSleep
                
                alertTitle = "Your ideal bedtime is..."
                alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            } catch {
                alertTitle = "Error"
                alertMessage = "Sorry, there was a problem calculating your bedtime."
            }
            showingAlert = true
        }
    }
#Preview {
    ContentView()
}

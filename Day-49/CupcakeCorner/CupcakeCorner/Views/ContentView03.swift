//
//  ContentView03.swift
//  CupcakeCorner
//
//  Created by Laxman Singh Koranga on 04/03/2024.
//

// Adding Haptic effects.
import SwiftUI

struct ContentView03: View {
    @State private var counter = 0
    
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        // we should feel gentle haptic taps whenever we press the button.
        // .increase, .success, .warning, .error, .start, .stop and more.
//        .sensoryFeedback(.increase, trigger: counter)
        
        // more control over haptic feedback.
        // request a middling collision between two soft objects.
//        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        // intense collision between two heavy objects.
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
    }
}

#Preview {
    ContentView03()
}

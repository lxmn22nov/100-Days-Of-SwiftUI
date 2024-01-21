//
//  AnimationView.swift
//  Animation
//
//  Created by Laxman Singh Koranga on 22/01/2024.
//

import SwiftUI

struct AnimationView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)), in: 1...10)
            Spacer()
            Button("Tap Me.") {
                animationAmount += 1
            }
            .padding(40)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            Spacer()
        }
    }
}

#Preview {
    AnimationView()
}

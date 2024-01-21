//
//  ContentView.swift
//  Animation
//
//  Created by Laxman Singh Koranga on 21/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Button("Tap Me.") {
                // code
//                animationAmount += 1
            }
            .padding(50)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//            .blur(radius: (animationAmount - 1) * 3)
//            .animation(.default, value: animationAmount)
//            .animation(.linear, value: animationAmount)
//            .animation(.spring(duration: 0.3, bounce: 0.9), value: animationAmount)
//            .animation(.easeIn(duration: 2), value: animationAmount)
//            .animation(.easeOut(duration: 2), value: animationAmount)
//            .animation(.easeInOut(duration: 2), value: animationAmount)
//            .animation(
//                .easeInOut(duration: 2)
//                    .delay(0.6),
//                value: animationAmount)
//            .animation(
//                .easeInOut(duration: 2)
//                    .repeatCount(3, autoreverses: true),
//                value: animationAmount)
//            .animation(
//                .easeInOut(duration: 2)
//                    .repeatForever(autoreverses: true),
//                value: animationAmount)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount))
            .onAppear {
                animationAmount = 2
            }
        }
    }
}

#Preview {
    ContentView()
}

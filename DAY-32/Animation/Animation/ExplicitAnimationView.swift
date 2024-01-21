//
//  ExplicitAnimationView.swift
//  Animation
//
//  Created by Laxman Singh Koranga on 22/01/2024.
//

import SwiftUI

struct ExplicitAnimationView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me.") {
            // code
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.blue)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    ExplicitAnimationView()
}

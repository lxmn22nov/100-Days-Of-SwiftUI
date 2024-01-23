//
//  ContentView.swift
//  Animation1
//
//  Created by Laxman Singh Koranga on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Button("Tap Me.") {
                // code
                enabled.toggle()
            }
            // modifiers order matters.
            .frame(width: 120, height: 80)
            // when button is enabled, it's bg color changes to blue, otherwise it'll remain red.
            .background(enabled ? .blue : .red)
            .animation(nil, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
        }
    }
}

#Preview {
    ContentView()
}

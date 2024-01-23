//
//  ContenteView3.swift
//  Animation1
//
//  Created by Laxman Singh Koranga on 23/01/2024.
//

import SwiftUI

// Showing and hiding views with transitions.

struct ContenteView3: View {
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me.") {
                // code
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .scale))
            }
        }
    }
}

#Preview {
    ContenteView3()
}

//
//  ContentView1.swift
//  Animation1
//
//  Created by Laxman Singh Koranga on 23/01/2024.
//

import SwiftUI

/* Animating Gestures.
 1. Creating a card to drag over the screen.
 2. need State to store the amount of their drag.
 3. using the size, to influence the card's position on-screen, with the help of modifier "offset()".
 4. will create a drag gesture & attach it to the card. DragGrsture have two extra modifiers, "onChanged(): lets run a closure whenever the user moves their finger." and "onEnded(): lets run a closure when the user lifts their finger off the screen, ending the drag."
 5. adding implicit animation.
 */
struct ContentView1: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        // Creates a card at the center of the screen.
        VStack {
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(.rect(cornerRadius: 9))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged {dragAmount = $0.translation }
//                        .onEnded { _ in dragAmount = .zero }
                        .onEnded { _ in
                            withAnimation(.bouncy) {
                                dragAmount = .zero
                            }
                        }
                )
//                .animation(.bouncy, value: dragAmount)
        }
    }
}

#Preview {
    ContentView1()
}

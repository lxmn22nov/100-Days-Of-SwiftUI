//
//  ContentView2.swift
//  Animation1
//
//  Created by Laxman Singh Koranga on 23/01/2024.
//

import SwiftUI

struct ContentView2: View {
    
    let letters = Array("Workspace.exe")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(6)
                    .font(.title)
                    .background(enabled ? .white : .gray)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 21), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

#Preview {
    ContentView2()
}

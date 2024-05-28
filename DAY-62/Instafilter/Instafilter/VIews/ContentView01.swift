//
//  ContentView01.swift
//  Instafilter
//
//  Created by Laxman Singh Koranga on 28/05/2024.
//

// 01: How property wrappers become structs.
// 02: Responding to state changes using onChange().

import SwiftUI

struct ContentView01: View {
    @State private var blurAmount = 0.0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("New value is \(newValue)")
                }
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    ContentView01()
}

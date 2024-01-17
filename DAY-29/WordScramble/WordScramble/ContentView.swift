//
//  ContentView.swift
//  WordScramble
//
//  Created by Laxman Singh Koranga on 17/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    let friends = ["Himanshu", "Ashish", "Eklavya", "Lakshay", "Tanishq", "Aditi"]
    
    var body: some View {
        List {
            // Static Row.
            Section("Section 1") {
                Text("Hello, XCode.")
                Text("Hello, Swift.")
                Text("Hello, SwiftUI.")
            }
            // Dynamic Row.
            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic Row \($0)")
                }
            }
            // Static Row.
            Section("Section 3") {
                Text("Hi, Friend.")
                Text("Hi, Brother.")
            }
            ForEach(friends, id: \.self) {
                Text($0)
            }
            
        }
    }
}

#Preview {
    ContentView()
}

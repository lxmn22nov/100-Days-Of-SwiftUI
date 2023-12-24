//
//  ContentView.swift
//  WeSplit
//
//  Created by Laxman Singh Koranga on 24/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
        NavigationStack {
            Form {
//                Text("Hello, Swift.")
//                Text("I'm Laxman Singh Koranga.")
//                Text("I'm iOS Dev.")
                Section {
                    Text("Hello, Swift.")
                    Text("I'm Laxman Singh Koranga.")
                    Text("I'm iOS Dev.")
                }
//                Section {
//                    Text("I'm Laxman Singh Koranga.")
//                }
//                Section {
//                    Text("I'm iOS Dev.")
//                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    ContentView()
}

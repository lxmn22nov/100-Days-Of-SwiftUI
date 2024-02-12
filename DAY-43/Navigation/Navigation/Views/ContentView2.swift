//
//  ContentView2.swift
//  Navigation
//
//  Created by Laxman Singh Koranga on 12/02/2024.
//

// Programmatic navigation with NavigationStack: allows us to move from one view to another just using code, rather than waiting for the user to take a specific action.

import SwiftUI

struct ContentView2: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                // code
                Button("Show 32") {
                    path = [32]
//                    path.append(32)
                }
                Button("Show 64") {
                    path.append(64)
                }
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView2()
}

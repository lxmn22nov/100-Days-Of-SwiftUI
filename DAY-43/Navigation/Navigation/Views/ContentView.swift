//
//  ContentView.swift
//  Navigation
//
//  Created by Laxman Singh Koranga on 09/02/2024.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body:  some View {
        Text("Detail View \(number)")
    }
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(1..<100) { i in
                NavigationLink("Tap Me") {
                    // Text("Detail View.")
                    DetailView(number: i)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

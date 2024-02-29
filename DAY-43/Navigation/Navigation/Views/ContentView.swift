//
//  ContentView.swift
//  Navigation
//
//  Created by Laxman Singh Koranga on 09/02/2024.
//

import SwiftUI

//struct DetailView: View {
//    var number: Int
//    
//    var body:  some View {
//        Text("Detail View \(number)")
//    }
//    init(number: Int) {
//        self.number = number
//        print("Creating detail view \(number)")
//    }
//}

// Making a NavigationStack return to its root view Programmatically:
// 1. When using simple array: we can call "removeAll()" on that array to remove everything in our path.
// 2. When using NavigationPath for our path: we can set it to a new, empty instance of NavigationPath. Eg: path = NavigationPath().

struct DetailView1: View {
    
    var number: Int
//    @Binding var path: [Int]
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
//                    path.removeAll()
                    path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {

//    @State private var path = [Int]()
    @State private var path = NavigationPath()
    
    var body: some View {
//        NavigationStack {
//            List(1..<100) { i in
//                NavigationLink("Tap Me") {
//                    // Text("Detail View.")
//                    DetailView(number: i)
//                }
//            }
//        }
        
        NavigationStack(path: $path) {
            DetailView1(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView1(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}

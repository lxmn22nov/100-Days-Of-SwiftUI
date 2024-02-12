//
//  ContentView3.swift
//  Navigation
//
//  Created by Laxman Singh Koranga on 13/02/2024.
//

// Navigating to different data types using NavigationPath.
import SwiftUI

struct ContentView3: View {
    // ContentView2 we used path of array type, to use for integers, now there is integers and strings as well. we'll use NavigationPath() as path, it'll help us to hold a variety of data types in a single path.
    // NavigationPath is called "type-eraser", it stores any kind of Hashable data without exposing exactly what type of data each item is.
    @State private var path = NavigationPath()
    
    var body: some View {
        // binding NavigationStack().
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 22") {
                    path.append(3)
                }
                Button("Push Hello.") {
                    path.append("Hi.")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the number \(selection)")
            }
        }
    }
}

#Preview {
    ContentView3()
}

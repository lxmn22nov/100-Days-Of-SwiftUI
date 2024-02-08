//
//  ContentView1.swift
//  Navigation
//
//  Created by Laxman Singh Koranga on 09/02/2024.
//

import SwiftUI

// Handling navigation the smart way with navigationDestination().

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView1: View {
    var body: some View {
        NavigationStack {
            List(1..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
    }
}

#Preview {
    ContentView1()
}

//
//  ContentView2.swift
//  Bookworm
//
//  Created by Laxman Singh Koranga on 11/03/2024.
//

// Accepting multi-line text input with "TextEditor".

import SwiftUI

struct ContentView2: View {
    // @AppStorage is not designed to store secure info, so never use it for anything private.
    @AppStorage("notes") private var notes = "Hello, Swift."
    
    var body: some View {
        NavigationStack {
            // 1 Approach:
//            TextEditor(text: $notes)
//                .navigationTitle("Notes")
//                .padding()
            // 2 Approach:
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView2()
}

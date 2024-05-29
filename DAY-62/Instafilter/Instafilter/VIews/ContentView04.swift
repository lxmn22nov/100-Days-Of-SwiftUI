//
//  ContentView04.swift
//  Instafilter
//
//  Created by Laxman Singh Koranga on 29/05/2024.
//

// Showing empty states with ContentUnavailableView.

import SwiftUI

struct ContentView04: View {
    var body: some View {
//        ContentUnavailableView("No Snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        // To get full control, we can provide individual views for the title and description, along with some buttons to display to help the user get started.
        ContentUnavailableView {
            Label("No Snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet.
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView04()
}

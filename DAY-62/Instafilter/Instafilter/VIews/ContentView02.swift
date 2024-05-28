//
//  ContentView02.swift
//  Instafilter
//
//  Created by Laxman Singh Koranga on 28/05/2024.
//

// 03: Showing multiple options with confirmationDialog().
// NOTE: Although, they look very different, but are created almost identically: alert() for alerts & confirmationDialog() for confirmation dialogs.

import SwiftUI

struct ContentView02: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello, World!") {
            showingConfirmation = true
        }
        .frame(width: 100, height: 60)
        .background(backgroundColor)
        .confirmationDialog("Change Background", isPresented: $showingConfirmation) {
            Button("Red") {backgroundColor = .red}
            Button("Green") {backgroundColor = .green}
            Button("Blue") {backgroundColor = .blue}
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")
        }
    }
}

#Preview {
    ContentView02()
}

//
//  ContentView1.swift
//  Bookworm
//
//  Created by Laxman Singh Koranga on 11/03/2024.
//

// @Binding: It allows us to create a two-way connection between PushButton and whatever is using it, so that one value changes the other does too.
import SwiftUI

struct PushButton: View {
    let title: String
//    @State var isOn: Bool
    @Binding var isOn: Bool
    
    var onColors = [Color.green]
    var offColors = [Color(white: 0.5), Color(white: 0.5)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}
struct ContentView1: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

#Preview {
    ContentView1()
}

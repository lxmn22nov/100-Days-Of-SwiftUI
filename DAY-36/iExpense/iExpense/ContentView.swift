//
//  ContentView.swift
//  iExpense
//
//  Created by Laxman Singh Koranga on 27/01/2024.
//

import SwiftUI
import Observation

// struct: if we have two SwiftUI views & we send them both the same struct to work with, they actually each have a unique copy of that struct, if one changes it, the other won't see that change.
/*
struct User {
    var firstName = "Jon"
    var lastName = "Snow"
}
*/
// class: if we create an instance of a class & send that to both views, they will share changes.
@Observable
class User {
    var firstName = "Aegon"
    var lastName = "Targaryen"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView02.swift
//  CupcakeCorner
//
//  Created by Laxman Singh Koranga on 04/03/2024.
//

// Validating and disabling forms.
import SwiftUI

struct ContentView02: View {
    @State private var username = ""
    @State private var email = ""
    var disableForm: Bool {
        username.isEmpty || email.count < 6
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ContentView02()
}

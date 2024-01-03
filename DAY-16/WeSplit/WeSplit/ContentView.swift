//
//  ContentView.swift
//  WeSplit
//
//  Created by Laxman Singh Koranga on 24/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State var tapCount = 0
    
    let students = ["Laxman","Himanshu","Ashish","Deep"]
    @State private var selectedStudent = "Laxman"
    var body: some View {
        Form {
            TextField("Enter your Name", text: $name)
            Text("Your name is \(name).")
            
            // Creating views in a loop.
            ForEach(0..<100) { number in
                Text("Row \(number)")
            }
        }
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            Form {
                Text("I'm Laxman Singh Koranga.")
                Text("I'm iOS Dev.")
                Section {
                    Text("Hello, Swift.")
                    Text("I'm Laxman Singh Koranga.")
                    Text("I'm iOS Dev.")
               }
               Section {
                   Text("I'm Laxman Singh Koranga.")
               }
              Section {
                   Text("I'm iOS Dev.")
              }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    ContentView()
}

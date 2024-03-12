//
//  ContentView3.swift
//  Bookworm
//
//  Created by Laxman Singh Koranga on 11/03/2024.
//

import SwiftData
import SwiftUI

struct ContentView3: View {
    // accessing the model context that was created earlier.
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasly"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    // created student object.
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    // we need to ask modelContext to add that student, which means it'll be saved.
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView3()
}

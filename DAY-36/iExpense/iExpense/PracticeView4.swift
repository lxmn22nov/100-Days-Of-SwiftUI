//
//  PracticeView4.swift
//  iExpense
//
//  Created by Laxman Singh Koranga on 28/01/2024.
//

import SwiftUI

struct User0: Codable {
    let firstName: String
    let lastName: String
}

struct PracticeView4: View {
    @State private var user = User0(firstName: "Aegon", lastName: "Targeryen")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    PracticeView4()
}

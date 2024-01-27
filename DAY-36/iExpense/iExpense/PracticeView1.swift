//
//  PracticeView1.swift
//  iExpense
//
//  Created by Laxman Singh Koranga on 28/01/2024.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello, \(name).")
        Button("Dismiss") {
            dismiss()
        }
    }
}
struct PracticeView1: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            // show the sheet
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            // contents of our sheet.
            SecondView(name: "Laxman Singh Koranga")
        }
    }
}

#Preview {
    PracticeView1()
}

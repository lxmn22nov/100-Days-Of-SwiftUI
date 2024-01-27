//
//  PracticeView3.swift
//  iExpense
//
//  Created by Laxman Singh Koranga on 28/01/2024.
//

import SwiftUI

struct PracticeView3: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    PracticeView3()
}

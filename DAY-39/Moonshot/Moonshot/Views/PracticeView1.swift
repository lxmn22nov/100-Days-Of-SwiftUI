//
//  PracticeView1.swift
//  Moonshot
//
//  Created by Laxman Singh Koranga on 01/02/2024.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    init(text: String) {
        print("Creating a new CustomText.")
        self.text = text
    }
}

struct PracticeView1: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 9) {
                ForEach(1..<20) {
                    Text("List \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    PracticeView1()
}

//
//  PracticeView2.swift
//  Moonshot
//
//  Created by Laxman Singh Koranga on 01/02/2024.
//

import SwiftUI

struct PracticeView2: View {
    var body: some View {
//        NavigationStack {
//            NavigationLink("Tap Me.") {
//                Text("Detail View.")
//            }
//            .navigationTitle("SwiftUI")
//        }
        
        // Simple text view as label, we can use two trailing closures with NavigationLink.
//        NavigationStack {
//            NavigationLink {
//                Text("Details View.")
//            } label: {
//                VStack {
//                    Text("This is the label.")
//                    Text("So, is this.")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
//        }
        
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    PracticeView2()
}

//
//  ContentView5.swift
//  Navigation
//
//  Created by Laxman Singh Koranga on 29/02/2024.
//

// 1. Customizing the Navigation bar appearance.
// 2. Placing toolbar buttons in exact locations.
// 3. Making our navigation title editable.

import SwiftUI

struct ContentView5: View {
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
            //            List(0..<21) { i in
            //                Text("Row \(i)")
            //            }
            //            .navigationTitle("No. of Rows")
            //            .navigationBarTitleDisplayMode(.inline)
            //            // changes solid black color heading to white.
            //            .toolbarBackground(.blue, for: .navigationBar)
            //            .toolbarColorScheme(.dark, for: .navigationBar)
            
            Text("Hello, SwiftUI.")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Tap me") {
//                            // code button action.
//                        }
//                    }
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Or Tap me") {
//                            // code button action.
//                        }
//                    }
//                    // With this, we don't have to define multiple ToolbarItem for every Button.
//                    ToolbarItemGroup(placement: .topBarLeading) {
//                        Button("Tap me") {
//                            // code button action.
//                        }
//                        Button("Or Tap me") {
//                            // code button action.
//                        }
//                    }
//                }
        }
    }
}

#Preview {
    ContentView5()
}

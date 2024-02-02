//
//  PracticeView3.swift
//  Moonshot
//
//  Created by Laxman Singh Koranga on 02/02/2024.
//

import SwiftUI

struct PracticeView3: View {
    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
        GridItem(.adaptive(minimum: 80)),
    ]
    var body: some View {
//        ScrollView {
        ScrollView(.horizontal) {
//            LazyVGrid(columns: layout) {
            LazyHGrid(rows: layout) {
                ForEach(0..<500) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    PracticeView3()
}

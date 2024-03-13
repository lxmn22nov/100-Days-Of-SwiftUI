//
//  RatingView.swift
//  Bookworm
//
//  Created by Laxman Singh Koranga on 12/03/2024.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImagae = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            roffImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}

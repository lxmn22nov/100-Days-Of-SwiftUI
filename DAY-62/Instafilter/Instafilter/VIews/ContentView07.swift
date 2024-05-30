//
//  ContentView07.swift
//  Instafilter
//
//  Created by Laxman Singh Koranga on 30/05/2024.
//

// Objective: How to ask the user to leave an App Store Review.

import StoreKit
import SwiftUI

struct ContentView07: View {
    // (.requestReview) environment key, which lets us ask the user to leave a review for our app on the app store.
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    ContentView07()
}

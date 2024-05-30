//
//  ContentView06.swift
//  Instafilter
//
//  Created by Laxman Singh Koranga on 30/05/2024.
//

// How to let the user share content with ShareLink.

import SwiftUI

struct ContentView06: View {
    var body: some View {
        // 01: We can share a URL like this:
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
        
        // 02: We can attach a subject & message to the shared data like this:
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift Here"), message: Text("Check out the 100 Days of SwiftUI!"))
        
        // 03: We can customize the button itself by providing whatever lavel we want:
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
//            Label("Spread the word about Swift.", systemImage: "swift")
//        }
        
        // 04: We can provide preview to attach, which is important when we're sharing something more complex.
        let example = Image(.example)
        
        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ContentView06()
}

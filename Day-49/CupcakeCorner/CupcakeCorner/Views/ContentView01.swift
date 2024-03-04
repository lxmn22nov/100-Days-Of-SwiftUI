//
//  ContentView01.swift
//  CupcakeCorner
//
//  Created by Laxman Singh Koranga on 04/03/2024.
//

// Loading an image from a remote server.
import SwiftUI

struct ContentView01: View {
    var body: some View {
        // Loading remote image from internet.
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
        // Precised image.
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//            Color.white
//        }
//        .frame(width:200, height: 200)
        
        // third way, whether the image was loaded, hit an error or hasn't finished yet.
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView01()
}

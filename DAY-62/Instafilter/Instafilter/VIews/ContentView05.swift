//
//  ContentView05.swift
//  Instafilter
//
//  Created by Laxman Singh Koranga on 29/05/2024.
//

// Loading photos from the user's photo library.

import PhotosUI
import SwiftUI

struct ContentView05: View {
    /*
     Two properties: 
     1. One to store the item that was selected.
     2. One to store that selected item as a SwiftUI Image.
     */
//    @State private var pickerItem: PhotosPickerItem?
    @State private var pickerItems = [PhotosPickerItem]()
//    @State private var selectedImage: Image?
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
//            PhotosPicker("Choose an image", selection: $pickerItems, maxSelectionCount: 3, matching: .images)
            // To limit the kinds of pic that can be imported. We've used .images here, which means we'll get regular photos, screenshots, panoramas & more. We can apply more advanced filter using (.any(), .all(), & .not()) & passing them an array.
//            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images) {
//                Label("Select a picture", systemImage: "photo")
//            }
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Choose an image", systemImage: "photo")
            }
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView05()
}

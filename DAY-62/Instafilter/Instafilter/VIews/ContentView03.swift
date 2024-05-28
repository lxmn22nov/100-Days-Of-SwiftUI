//
//  ContentView03.swift
//  Instafilter
//
//  Created by Laxman Singh Koranga on 28/05/2024.
//

// Integrating Core Image with SwiftUI.
/* Apple gives us three types to work with:
01: UIImage: comes form UIKit.powerful image type capable of working with a variety of image types, like bitmaps(PNG), vectors(SVG) & even sequeces that form an animation.
02: CGImage: comes from Core Graphics.Its just a 2D array of pixels.
03: CIImage: comes from Core Image. stores all the info required to produce an image but doesn't actually turn that into pixels unless it's asked to.
*/
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView03: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
//        image = Image(.example)
        let inputImage = UIImage(resource: .example)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
//        let currentFilter = CIFilter.sepiaTone()
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
        
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//        currentFilter.scale = 100
        
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 200
        
//        let currentFilter = CIFilter.twirlDistortion()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 1000
//        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)}
        
        // get a CIImage from our filter or exit if that fails.
        guard let outputImage = currentFilter.outputImage else { return }
        // attempt to get a CGImage from our CIImage.
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        // convert that to a UIImage.
        let uiImage = UIImage(cgImage: cgImage)
        // and convert that to a SwiftUI image.
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView03()
}

//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Laxman Singh Koranga on 03/03/2024.
//

// Loading some eg. music JSON data from Apple's iTunes API & show it all in a SwiftUI List.
import SwiftUI

// Response struct will store an array of Results.
struct Response: Codable {
    var results: [Result]
}
// Result struct will store the trackId, its name, album it belongs.
struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        // created the url, we want to read.
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        // fetching the data from the url.
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // code.
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
            
        } catch {
            print("Invalid data.")
        }
    }
}

#Preview {
    ContentView()
}

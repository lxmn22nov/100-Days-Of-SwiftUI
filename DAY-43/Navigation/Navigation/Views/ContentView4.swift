//
//  ContentView4.swift
//  Navigation
//
//  Created by Laxman Singh Koranga on 29/02/2024.
//

// Saving the NavigationStack paths using "Codable".
import SwiftUI

@Observable
class PathStore {
//    var path: [Int] {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
//            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
//                path = decoded
                path = NavigationPath(decoded)
                return
            }
        }
//        path = []
        path = NavigationPath()
    }
    func save() {
        guard let representation = path.codable else { return }
        
        do {
//            let data = try JSONEncoder().encode(path)
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data.")
        }
    }
}

struct DetailView2: View {
    
    var number: Int
//    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
//            .toolbar {
//                Button("Home") {
//                    path = NavigationPath()
//                }
//            }
    }
}

struct ContentView4: View {
    
//    @State private var path = NavigationPath()
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
//            DetailView2(number: 0, path: $path)
            DetailView2(number: 0)
                .navigationDestination(for: Int.self) { i in
//                    DetailView2(number: i, path: $path)
                    DetailView2(number: i)
                }
        }
    }
}

#Preview {
    ContentView4()
}

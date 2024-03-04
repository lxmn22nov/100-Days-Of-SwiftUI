//
//  ContentView04.swift
//  CupcakeCorner
//
//  Created by Laxman Singh Koranga on 04/03/2024.
//

// Adding Codable conformance to an @Observable class.
import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    var name = "M.S.Dhoni"
}

struct ContentView04: View {
    var body: some View {
        Button("Encode M.S.Dhoni", action: encodeName)
    }
    
    func encodeName() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentView04()
}

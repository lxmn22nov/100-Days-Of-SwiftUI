//
//  Mission.swift
//  Moonshot
//
//  Created by Laxman Singh Koranga on 04/02/2024.
//

import Foundation

struct Mission: Codable, Identifiable {
    // Nested Struct. 
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    let displayName: String {
        "Apollo \(id)"
    }
}

//
//  Student.swift
//  Bookworm
//
//  Created by Laxman Singh Koranga on 12/03/2024.
//

import Foundation
import SwiftData

// Previously, we described data by creating file Student.swift and following code:
//@Observable
//class Student {
//    var id: UUID
//    var name: String
//    
//    init(id: UUID, name: String) {
//        self.id = id
//        self.name = name
//    }
//}

// All it takes to give SwiftData all the information it needs to load and save students.
@Model
// This class is called SwiftData Model.
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

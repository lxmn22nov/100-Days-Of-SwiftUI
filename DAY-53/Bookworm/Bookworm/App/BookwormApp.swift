//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Laxman Singh Koranga on 11/03/2024.
//

import SwiftData
import SwiftUI

// @main: tells Swift this is what launches our app, from the iOS home scree.
// WindowGroup: tells SwiftUI our app can be displayed in many windows. This doesn't do much on iPhone, but on iPad and macOS.
@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView3()
        }
        .modelContainer(for: Student.self)
    }
}

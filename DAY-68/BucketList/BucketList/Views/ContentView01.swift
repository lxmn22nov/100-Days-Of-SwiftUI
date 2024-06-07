//
//  ContentView01.swift
//  BucketList
//
//  Created by Laxman Singh Koranga on 07/06/2024.
//

// OBJECTIVE: Writing data to the documents directory.
import SwiftUI

struct ContentView01: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                /*
                 1 .atomic: saving means the whole file should be written in one lump.
                 Atomic writing causes the system to write our full file to a temporary filename & when that's finished it does a simple rename to our target filename. This means either the whole file is there or nothing is.
                 2 .completeFileProtection: Asking for complete file protection means iOS automatically and transparently encrypts the file, and only allows our app to read it while the device is unlocked. iOS does a great job of keeping user data secure, but there's no harm being extra safe.
                 */
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

//func test() {
//    print(URL.documentsDirectory)
//}
#Preview {
    ContentView01()
}

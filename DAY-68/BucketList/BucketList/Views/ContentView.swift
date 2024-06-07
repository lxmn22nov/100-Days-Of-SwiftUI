//
//  ContentView.swift
//  BucketList
//
//  Created by Laxman Singh Koranga on 06/06/2024.
//

// Adding conformance to Comparable for custom types.
import SwiftUI

//struct ContentView: View {
//    let values = [1,5,3,6,2,9].sorted()
//    
//    var body: some View {
//        List(values, id: \.self) {
//            Text(String($0))
//        }
//    }
//}

// "Identifiable": A protocol in swift that enforces types to include a unique identifier property, helps differentiate individual instances of the type from one another within collections/arrays, making it easier to handle, update & manage specific instances.

//struct User: Identifiable {
//    let id = UUID()
//    var firstName: String
//    var lastName: String
//}

struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
//    let users = [
//        User(firstName: "Laxman", lastName: "Koranga"),
//        User(firstName: "Himanshu", lastName: "Koranga"),
//        User(firstName: "Ashish", lastName: "Kumar Singh")
//    ].sorted {
//        // "sorted()": this function will not work in this array. so,
//        $0.lastName < $1.firstName
//    }
    // That absolutely works, but it's not an ideal solution for two reasons.
    // Swift has a better solution, "Comparable" protocol, which means it defines a function that takes two integers & returns "true" if the first should be sorted before the second.
    let users = [
        User(firstName: "Laxman", lastName: "Koranga"),
        User(firstName: "Himanshu", lastName: "Koranga"),
        User(firstName: "Ashish", lastName: "Kumar Singh")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}
#Preview {
    ContentView()
}

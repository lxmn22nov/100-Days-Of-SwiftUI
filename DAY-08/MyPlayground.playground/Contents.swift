// FUNCTIONS-02
func printTables(for number: Int, end: Int = 20) {
    for i in 1...end {
        print("\(number) x \(i) = \(number * i)")
    }
}
printTables(for: 5)
printTables(for: 9, end: 10)

//
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// How to handle errors in functions.

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}
// NOTE:  Swift Playgrounds are pretty lax about error handling because they are mostly meant for learning, but when it comes to working with real Swift projects you’ll find there are three steps: do, try, catch.
/* 
 do {
    try someRiskyWork()
} catch {
    print("Handle Errors here!")
}
*/
let String = "12345"

do {
    let result = try checkPassword(String)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

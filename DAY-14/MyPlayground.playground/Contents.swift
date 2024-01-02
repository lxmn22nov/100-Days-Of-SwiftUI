// OPTIONALS: are like a box that may/L  have something inside it.
// How to handle missing data with optionals.
let opposites = [
    "Mario": "Wario",
    "Name": "Eman"
]
let peachOpposite = opposites["Peach"]
    
// The value attached to the key "Peach", which doesn't exist and we haven't provided a default value to send back in place of missing data. The code will not going to return anything. Here, comes "Optionals" which means that might be present or might not, represented by placing a question mark after the data-type.
// So, "String?" means there might be a string waiting inside for us or there might be nothing at all, a special value called "nil"(no value).
// Any sort of datat can be optional, including Int, Double, Bool as well as instances of enums, structs and classes.
// In case of optionals, we need to "unwrap"  the optional in order to use it, we need to look inside the box to see if there's a value and if there is, take it out and use it.

// Swift gives us two primary ways of unwrapping optionals, most used one is:
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite).")
}
/*
 "if let" syntax combines creating a condition with creating a constant,
 1. reads the optional value from the dictionary.
 2. If the optional has a string inside, it gets unwrapped, that means the string inside gets placed into the marioOpposite constant.
 3. The condition has succeeded, able to unwrap the optional, so the condition's body is run.
 */

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// Trying to pass an optional integer into a function that requires a non-optional integer.
func square(number: Int) -> Int {
    number * number
}
var number: Int? = nil
print(square(number: 9))

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

// Why does Swift have optionals?
// Swift’s optionals are one of its most powerful features, while also being one of the most confusing. Their core job is simple: they allow us to represent the absence of some data – a string that isn’t just empty, but literally doesn’t exist.

// Why does Swift make us unwrap optionals?

// How to unwrap optionals with guard?
// There is a second way to unwrap optionals, "guard let".

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input!")
        return
    }
    print("\(number) x \(number) is \(number * number).")
}

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside.")
}
//guard let unwrapped = myVar else {
//    print("Run if myVar doesn't have a value inside.")
//    return
//}

// When to use "guard let" rather than "if let"?
// Swift gives us an alternative to if let called guard let, which also unwraps optionals if they contain a value, but works slightly differently: guard let is designed to exit the current function, loop, or condition if the check fails, so any values you unwrap using it will stay around after the check.

// How to unwrap optionals with nil coalescing?
// Third way of unwrapping optionals. Lets us unwrap an optional & provide a default value if the optional was empty.
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]
//let new = captains["Serenity"] ?? "N/A"
let new = captains["Serenity", default: "N/A"]

// OPTIONAL CHAINING: access members of an optional value without unwrapping.

// How to handle multiple optionals using optional chaining?
struct Book {
    let little: String
    let author: String?
}
var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

// Why is optional chaining so important?
    // Swift’s optional chaining lets us dig through several layers of optionals in a single line of code, and if any one of those layers is nil then the whole line becomes nil.
let names = ["Vincent": "van Gogh", "Pablo": "Picasso", "Claude": "Monet"]
let surnameLetter = names["Vincent"]?.first?.uppercased() ?? "?"

// How to handle fucntion failure with optionals?

enum UserError: Error {
    case badId, networkFailed
}
func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}
let user = (try? getUser(id: 33)) ?? "Anonymous"
print(user)

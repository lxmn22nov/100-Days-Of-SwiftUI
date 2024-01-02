/* 
 PROTOCOLS: like contracts in Swift.
 - defines a blueprint of methods, properties and other requirements that suit a particular task/piece of functionality.
 - protocols can then be adopted by a class, structure or enumeration to provide an actual implementation of those requirements.
 - SYNTAX:
 protocol SomeProtocol {
    // definition
 }
*/

/* Example:Someone commuting from their home to their office.

func commute(distance: Int, using Vehicle: Car) {
    // code
}
func commute(distance: Int, using Vehicle: Train) {
    // code
}
func commute(distance: Int, using Vehicle: Bus) {
    // code
}
 
 - For now, we don't care how this trip happens. What matters is, how long it take the user to commute using each option.
 - This is where protocols come into play, they let us define a series of properties and methods that we want to use. They don’t implement those properties and methods, they don’t actually put any code behind it, they just say that the properties and methods must exist, a bit like a blueprint.
 
 - Eg: a new Vehicle protocol.
 
 protocol Vehicle {
     func estimateTime(for distance: Int) -> Int
     func travel(distance: Int)
 }

 - Eg: We could make a "Car" struct that conforms to "Vehicle".
 
 struct Car: Vehicle {
     func estimateTime(for distance: Int) -> Int {
         distance / 50
     }
     func travel(distance: Int) {
         print("I'm driving \(distance)km.")
     }
     func openSunroof() {
         print("It's a nice day!")
     }
 }
    -  Now we’ve created a protocol, and made a Car struct that conforms to the protocol. To finish off, let’s update the commute() function from earlier so that it uses the new methods we added to Car:
 
 func commute(distance: Int, using Vehicle: Car) {
     if Vehicle.estimateTime(for: distance) > 100 {
         print("That's too slow! I'll try a different vehicle.")
     } else {
         Vehicle.travel(distance: distance)
     }
 }
 let car = Car()
 commute(distance: 100, using: car)
 */

// Why does Swift need protocols?
    // - Protocols let us define how structs, classes, and enums ought to work: what methods they should have, and what properties they should have. Swift will enforce these rules for us, so that when we say a type conforms to a protocol Swift will make sure it has all the methods and properties required by that protocol.

// How to use opaque return types?
/*
func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}
func getRandomNumber() -> Bool {
    Bool.random()
}
*/

// NOTE: "getRandomNumber()" and "getRandomBool()" returns a random Integer and random Boolean.
// Both "Int" and "Bool" conform to a comman Swift protocol called "Equatable" which means can be compared for equality. The Equatable protocol allows us to use (==).
//print(getRandomNumber() == getRandomBool())

/*
func getRandomNumber() -> Equatable {
    Int.random(in: 1...6)
}
func getRandomBool() -> Equatable {
    Bool.random()
}
*/

// This is where opaque return types come in: they let us hide information in our code, but not from the Swift compiler. This means we reserve the right to make our code flexible internally so that we can return different things in the future, but Swift always understands the actual data type being returned and will check it appropriately. To upgrade our two functions to opaque return types, add the keyword some before their return type, like this:
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}
func getRandomBool() -> some Equatable {
    Bool.random()
}
//print(getRandomNumber() == getRandomBool())

/* How to create and use extensions?
    - Extensions: Adds functionality to an existing class, structure, enumeration, protocol type, includes the ability to extend types for which we don't have access to the original source code(retroactive modeling).
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
var quote = "   The quick lazy brown fox jumps over the stones.    "
let trimmed = quote.trimmed()
*/

// How to create and use protocol extensions?
/*
 extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
*/
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}
let Avengers = ["BlackWidow", "CaptainAmerica", "HawkEye","IronMan", "Thor", "BlackPanther"]

if Avengers.isEmpty == false {
    print("No.of Avengers are: \(Avengers.count)")
}
if !Avengers.isEmpty {
    print("No.of Avengers are: \(Avengers.count)")
}

// putted extension to the top of array, cuz xcode run their code from top to bottom.
if Avengers.isNotEmpty {
    print("No.of Avengers are: \(Avengers.count)")
}

// We just added "isNotEmpty" to arrays, but what about sets and dictionaries? we could repeat ourself and copy the code into extensions for those, but there’s a better solution: Array, Set, and Dictionary all conform to a built-in protocol called "Collection", through which they get functionality such as contains(), sorted(), reversed(), and more. This is important, because Collection is also what requires the isEmpty property to exist. So, if we write an extension on Collection, we can still access isEmpty because it’s required. This means we can change Array to Collection.

// When are protocol extensions useful in Swift?
    // Protocol extensions are used everywhere in Swift, which is why you’ll often see it described as a “protocol-oriented programming language.” We use them to add functionality directly to protocols, which means we don’t need to copy that functionality across many structs and classes.

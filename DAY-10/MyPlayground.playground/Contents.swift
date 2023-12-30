/*
 STRUCTS: Model custom types that encapsulates data.
- we define properties and methods to add functionality using the same syntax you use to define constants, variables and functions.
- An instance of class is traditionally known as an object. In swift, more general term "instance" is used.
*/

// How to create your own structs?
// Swift's structs let us create our own custom, complex data types, complete with their own variables and their own functions.

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title), \(year) by \(artist).")
    }
}
// At this point, Album is just like String or Int – we can make them, assign values, copy them, and so on. For example, we could make a couple of albums, then print some of their values and call their functions:
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

// Things get more interesting is when we want to have values that can change. Eg: We could create an Employee struct that can take vacation as needed.
struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remainging: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}
/* 
NOTE: Swift will refuse to build the code.
If we create an employee as a constant using let, Swift makes the employee and all its data constant – we can call functions just fine, but those functions shouldn’t be allowed to change the struct’s data because we made it constant. As a result, Swift makes us take an extra step: any functions that only read data are fine as they are, but any that change data belonging to the struct must be marked with a special "mutating" keyword.
*/
// let emp1 = Employee(name: "Laxman Singh Koranga", vacationRemaining: 20)
var emp1 = Employee(name: "Laxman Singh Koranga", vacationRemaining: 20)
var emp2 = Employee.init(name: "Himanshu Koranga", vacationRemaining: 15)
emp1.takeVacation(days: 9)
emp2.takeVacation(days: 14)

// Now our code will work fine, but swift will stop us from calling takeVacation() from constant structs.

/* IMPORTANT:
- Variables and constants that belong to structs are called "properties".
- Functions that belond to structs are called "methods".
- When we create a constatnt or variable out of a struct, we call that an instance -you might create a dozen unique instances of the above created struct "Album".
- Swift silently creates a special function inside the struct called "init()", using all the properties of the struct as its parameters.
*/

// How to compute property values dynamically?
/*
 Structs have two kind of property:
 1. STORED PROPERTY: A variable/constant that holds a piece of data inside an instance of the struct.
 2. COMPUTED PROPERTY: Calculates the value of the property dynamically every time it's accessed. It means computed properties are a blend of both stored properties and functions, they are accessed like stored properties, but work like functions.
 */

// How to take action when a property changes?
/* Swift lets us create property observers, which are special piece of code that run when properties change.
 - There are two forms:
 - 1. "didSet" observer to run when the property just changed.
 - 2. "willSet" observer to run before the property changed.
*/

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score).")
        }
    }
}
var game = Game()
game.score += 10
game.score -= 3
game.score += 1

// "willSet"
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}
var app = App()
app.contacts.append("Laxman")
app.contacts.append("Himanshu")
app.contacts.append("Ashish")

//  appending to an array will trigger both willSet and didSet, so that code will print lots of text when run. "willSet" is used much less than "didSet". Try to avoid putting too much work  into property observers.

/*
Ques: When should you use property observers?
    - It let us attach functionality to be run before or after a property is changed.

Ques: When should you use willSet rather than didSet?
    - Both willSet and didSet let us attach observers to properties, meaning that Swift will run some code when they change so that we have a chance to respond to the change. The question is: do you want to know before the property changes, or after?
*/

// How to create custom initializers?
// Initializers are specialized methods that are designed to prepare a new struct instance to be used. Swift silently generates one for us based on the properties we place inside a struct, but we can also create our own as long as we follow one golden rule: All properties must have a value by the time the initializer ends.

// Example: Creates a Player instance by providing values for its tow properties. Swift calls it "memberwise initializer".

struct Player {
    let name: String
    let number: Int
}
let player = Player(name: "Virat", number: 18)

// This kind of code is possible because Swift silently generates an initializer accepting those two values, but we could write our own to do the same thing. The only catch here is that you must be careful to distinguish between the names of parameters coming in and the names of properties being assigned.

struct Player1 {
    let name1: String
    let number1: Int
    
    init(name1: String, number1: Int) {
        self.name1 = name1
        self.number1 = number1
    }
}

// That works the same as our previous code, except now the initializer is owned by us so we can add extra functionality there if needed.
/*
 1. There is no "func" keyword. Yes, this looks like a function in terms of its syntax, but Swift treats initializers specially.
 2. Even though this creates a new Player instance, initializers never explicitly have a return type –they always return the type of data they belong to.
 3. I’ve used "self" to assign parameters to properties to clarify we mean “assign the name parameter to my name property”.
 - That last point is particularly important, because without self we’d have name = name and that doesn’t make sense – are we assigning the property to the parameter, assigning the parameter to itself, or something else? By writing self.name we’re clarifying we mean “the name property that belongs to my current instance,” as opposed to anything else.
 */

// How do Swift's memberwise initializers work?
// By default, all Swift structs get a synthesized memberwise initializer by default, which means that we automatically get an initializer that accepts values for each of the struct’s properties. This initializer makes structs easy to work with, but Swift does two further things that make it especially clever.

// When would you use self in a method?
// Inside a method, Swift lets us refer to the current instance of a struct using self, but broadly speaking you don’t want to unless you specifically need to distinguish what you mean.

struct Student {
    var name: String
    var bestFriend: String
    
    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class...")
        self.name = name
        self.bestFriend = bestFriend
    }
}

// we don't have to use that, of course, but it gets a little clumsy adding some sort of prefix to the parameter names.
struct Student1 {
    var name: String
    var bestFriend: String

    init(name studentName: String, bestFriend studentBestFriend: String) {
        print("Enrolling \(studentName) in class…")
        name = studentName
        bestFriend = studentBestFriend
    }
}
// Outside of initializers, the main reason for using self is because we’re in a closure and Swift requires it so we’re clear we understand what’s happening. This is only needed when accessing self from inside a closure that belongs to a class, and Swift will refuse to build your code unless you add it.



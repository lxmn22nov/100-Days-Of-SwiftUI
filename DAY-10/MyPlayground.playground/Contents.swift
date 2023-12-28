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

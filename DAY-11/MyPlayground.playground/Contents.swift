/*
 - Structs let us combine individual pieces of data to make something new, then attach methods so we can manipulate that data.
 - Some advanced features of structs that make them more powerful, including "static properties" and "access control"- the art of stopping other parts of our code from meddling in places they ought not to be.
 - Both of these things are used extensively in SwiftUI.
*/

// How to limit access to internal data using access control?
// By default, Swift’s structs let us access their properties and methods freely, but often that isn’t what you want – sometimes you want to hide some data from external access.

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)
//account.funds -= 1000
if success {
    print("Withdrew money successfully!")
} else {
    print("Failed to withdraw!")
    print(account.funds)                    // we can read the available balance by setting private(set).
}
/*
 - The "funds" property is exposed to us externally.
 - That completely bypasses the logic we put in place to stop people taking out more money than they have, and now our program could behave in weird ways. To solve this, we can tell Swift that funds should be accessible only inside the struct – by methods that belong to the struct, as well as any computed properties, property observers, and so on.
 - "private" var funds = 0
 - And now accessing funds from outside the struct isn’t possible, but it is possible inside both deposit() and withdraw(). If you try to read or write funds from outside the struct Swift will refuse to build your code.
 - This is called access control, because it controls how a struct’s properties and methods can be accessed from outside the struct.
 - Swift provides several other options-
    1. "private" - don't let anything outside the struct use this.
    2. "fileprivate" - don't let anything outside the current file use this.
    3. "public" - anyone can use this from anywhere.
    4. "private(set)" - let anyone read this property, but only let my methods write it.
*/
//
/*
 - What's the point of access control?
 * sometimes access control is used in code you don’t own, so you can’t remove the restriction. This is common when you’re building apps with Apple’s APIs, for example: they place restrictions about what you can and cannot do, and you need to abide by those restrictions.
*/

// Static properties and methods:

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
School.add(student: "Himanshu Koranga")
print(School.studentCount)

// We haven’t created an instance of School, we can literally use add() and studentCount directly on the struct. This is because those are both static, which means they don’t exist uniquely on instances of the struct.

/*
    - If you want to mix and match static and non-static properties and methods, there are two rules:
        1. To access non-static code from static code… you’re out of luck: static properties and methods can’t refer to non-static properties and methods because it just doesn’t make sense – which instance of School would you be referring to?
        2. To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.
 
    Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.

    Tip: It’s easy to forget the difference between self and Self, but if you think about it it’s just like the rest of Swift’s naming – we start all our data types with a capital letter (Int, Double, Bool, etc), so it makes sense for Self to start with a capital letter too.
 */

// CHECKPOINT-06
// Create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly?
struct CarInfo {
    private let modelNumCar: String
    private let numOfSeats: Int
    var currentGear: Int
    
    mutating func changeGear(gearUp: Int, gearDown: Int ) {
        if gearUp > 0 {
            print("Vehicle started moving.")
        } else if gearDown <= 0 {
            print("Vehicle is slowing down.")
        } else {
            print("Vehicle is not moving.")
        }
    }
}

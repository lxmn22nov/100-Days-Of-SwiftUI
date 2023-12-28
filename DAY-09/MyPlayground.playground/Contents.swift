// CLOSURES: are like "Anonymous Functions", function we can create and assign directly to a variable or pass into other functionality to customize how they work. Or, passing one function into another as a parameter.
// SwiftUI uses closures extensively.

func greetUser() {
    print("Hello!")
}
greetUser()

// var greetCopy: () -> Void = greetUser
var greetCopy = greetUser
greetCopy()

// Example:
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}
let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

// NOTE: We can call functions, pass in values, and return data. Assign them to variables, pass function into functions and even return function from function.
// That creates a trivial function and calls it, but then creates a copy of that function and calls the copy. As a result, it'll print the same message twice.
// Important: When we are copying a function, we don't have to write parenthesis after it. If we put the parenthesis, there we are calling the function, and assigning its return value back to something else.

let sayHello = { (name: String) -> String in
    "Hi, \(name)!"
}
sayHello("Laxman")

// NOTE: no parameter name, just like when we copy functions. So, external parameter names only matter when we’re calling a function directly, not when we create a closure or when we take a copy of the function first.

// Example02:

let team = ["Himanshu", "Ashish", "Laxman", "Ayush"]
let sortedTeam = team.sorted()
print(sortedTeam)

// That's neat, but what if we wanted to control that sorting, what if we wanted "leader" come first because they were the team of developers, with rest being sorted alphabetically?
// Well, sorted() actually allows us to pass in a custom sorting function to control exactly that. This function must accept two strings, and return true if the first string should be sorted before the second, or false if the first string should be sorted after the second. If "Himanshu" were the captain, the function would look like this:

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Himanshu" {
        return true
    } else if name2 == "Himanshu" {
        return false
    }
    return name1 < name2
}

// sorted() can be passed a function to create a custom sort order, and as long as that function a) accepts two strings, and b) returns a Boolean, sorted() can use it.

// directly used the function as a parameter.
let leaderTeam = team.sorted(by: captainFirstSorted)
print(leaderTeam)
/* 
 COVERED SO-FAR:
1. Can create closures as Anonymous Functions, storing them inside constants and variable.
2. We also able to pass functions into other functions.
*/

// now we can declare the closure directly inside the sorted() method.
let leaderTeam1 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Himanshu" {
        return true
    } else if name2 == "Himanshu" {
        return false
    }
    return name1 < name2
})
print(leaderTeam1)

// We’re calling the sorted() function as before. Rather than passing in a function, we’re passing a closure – everything from the opening brace after by: down to the closing brace on the last line is part of the closure. Directly inside the closure we list the two parameters sorted() will pass us, which are two strings. We also say that our closure will return a Boolean, then mark the start of the closure’s code by using in. Everything else is just normal function code.

// How do your return a value from a closure that takes no parameters?
// closure with one parameter and returns nothing.
let payment = { (user: String) in
    print("Paying \(user)...")
}

// closure with one parameter and returns boolean.
let payment1 = { (user: String) -> Bool in
    print("Paying \(user)...")
    return true
}

// closure without parameter and returning boolean.
let payment2 = { () -> Bool in
    print("Paying an anonymous person...")
    return true
}
// NOTE: If we think about it, that works just the same as a standard function where’d write func payment() -> Bool.

//  How to use trailing closures and shorthand syntax?

// Rather than passing the closure in as a parameter, we just go ahead and start the closure directly – and in doing so remove (by: from the start, and a closing parenthesis at the end. Hopefully you can now see why the parameter list and in come inside the closure, because if they were outside it would look even weirder!

// Trailing closure syntax:
let team1 = ["Himanshu", "Ashish", "Laxman", "Ayush"]
let captainFirstTeam = team1.sorted { name1, name2 in
    if name1 == "Laxman" {
        return true
    } else if name2 == "Laxman" {
        return false
    }
    return name1 < name2
}
print(captainFirstTeam)

// There’s one last way Swift can make closures less cluttered: Swift can automatically provide parameter names for us, using shorthand syntax. With this syntax we don’t even write name1, name2 in any more, and instead rely on specially named values that Swift provides for us: $0 and $1, for the first and second strings respectively.

let captainFirstTeam1 = team1.sorted {
    if $0 == "Ashish" {
        return true
    } else if $1 == "Ashish" {
        return false
    }
    return $0 < $1
}
print(captainFirstTeam1)

// Two more examples, power of closures.

// filter() function lets us run some code on every item in the array and will send back a new array containing every item that returns true for the function. Lets say team players whose name befins with "A" like this:
let aOnly = team1.filter { $0.hasPrefix("A")}
print(aOnly)

// map() function lets us transform every item in the array using some code of our choosing and sends back a new array of all the transformed items.
let upperCaseTeam = team1.map { $0.uppercased() }
let lowerCaseTeam = team1.map { $0.lowercased() }

print(upperCaseTeam)
print(lowerCaseTeam)

// NOTE: When working with map(), the type we return doesn't have to be the same as the type you started with - you could convert an array of integers to an array of strings.

// Like I said, you’re going to be using closures a lot with SwiftUI:

// When you create a list of data on the screen, SwiftUI will ask you to provide a function that accepts one item from the list and converts it something it can display on-screen.
// When you create a button, SwiftUI will ask you to provide one function to execute when the button is pressed, and another to generate the contents of the button – a picture, or some text, and so on.
// Even just putting stacking pieces of text vertically is done using a closure.

// How to accept functions as parameters?

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

// CHECKPOINT-05:
/*
 Your job is to:
 - Filter out any numbers that are even.
 - Sort the array in ascending order.
 - Map them to strings in the format “7 is a lucky number”.
 - Print the resulting array, one item per line.
 */
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let sortedLuckyNumbers = luckyNumbers.sorted()
print("Lucky number in ascending order: ",sortedLuckyNumbers)
let filteredEvenNumbers = luckyNumbers.filter { $0.isMultiple(of: 2)}
print("Even numbers from Lucky numbers: ",filteredEvenNumbers)

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

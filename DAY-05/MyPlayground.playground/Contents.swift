// CONDITIONAL STATEMENTS

var age: Int = 20

if age >= 18 {
    print("Eligible for voting.")
}

var numbers: [Int] = [11, 22, 33]
numbers.append(4)
print(numbers)
if numbers.count > 3 {
    print(numbers.remove(at: 2))
}
print(numbers)

// can use compound operators in conditional statements.
let country: String = "India"

if country == "Pakistan" {
    print("Abu = \(country)")
}

var name = "Laxman"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

var userName: String = "lxmn03"

if userName == "" {
    userName = "Username not found!"
}
print("Welcome, \(userName)")

// we don't have to mention the boolean value in the if statement, if the given statement is correct the statement work otherwise terminate itself.
var UserName: String = ""

if UserName.isEmpty {
    UserName = "UserName not found!"
}
print("Welcome, \(UserName)")

let firstName = "Dhoni"
var secondName = "Ronaldo"

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)
print(second < first)
// because, small comes before large in the enum case list.

// How to check multiple conditions?
var Age: Int = 21
if Age >= 18 {
    print("Eligible for voting.")
} else {
    print("Not Eligible for voting.")
}

// Logical operator AND(&&)
var marks = 69

if marks > 90 {
    print("Grade A")
} else if marks >= 75 && marks <= 90 {
    print("Grade B")
} else if marks >= 33 && marks <= 75 {
    print("Grade C")
} else if marks < 33 {
    print("Fail!")
}

// OR(||)
let userAge = 14
let parentPermission = true

if age >= 18 || parentPermission {
    print("Can buy the toffe.")
}

enum transportOption {
    case bicycle, aeroplane, car, horse, helicopter
}

let transport = transportOption.aeroplane

if transport == .aeroplane || transport == .helicopter {
    print("Let's Fly.")
} else if transport == .bicycle || transport == .horse {
    print("I hope there's a road.")
} else if transport == .car {
    print("Traffic Issue.")
} else {
    print("All means of transport are useless.")
}

// SWITCH CASE:


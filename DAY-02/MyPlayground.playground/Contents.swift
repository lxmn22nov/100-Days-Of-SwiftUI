// How to store truth with Booleans.
// Some examples that returns the boolean response.

let filename = "marvel.png"
print(filename.hasSuffix(".png"))                   // true

let number = 33
print(number.isMultiple(of: 3))                     // true

//NOTE: In booleans we cannot perform arithmetic operations.
 
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)

isAuthenticated = !isAuthenticated
print(isAuthenticated)

// Instead, NOT(!) operator we can use ".toggle" method.
var badHuman = false
print(badHuman)
badHuman.toggle()
print(badHuman)

// How to join strings together?
// 1. By using (+) operator concatenation, this is good for short string operation, but for bigger strings it'll cause operator overload.

var first = "Hello,"
var second = " Everyone."

var greeting = (first + second)
print(greeting)

// 2. String Interpolation.
var name = "Laxman Singh Koranga"
let age = 27
let message = "Hello, I'm \(name) and I'm \(age) years old."
print(message)

// can perform mathematical operation inside string interpolation.
print("5 + 5 = \(5 + 5)")
print("5 - 5 = \(5 - 5)")
print("5 * 5 = \(5 * 5)")
print("5 / 5 = \(5 / 5)")
print("5 % 5 = \(5 % 5)")

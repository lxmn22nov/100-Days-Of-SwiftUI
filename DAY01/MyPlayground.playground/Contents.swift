// NOTE: Swift allows semicolan, but best practice not to use it.
// Declaration of variable by keywords(var, let).
// variable means it can vary(change) once declared or overtime and "var" keyword does the same. And, old value gets discarded every time.
var name = "Lucky"
name = "Laxman Singh Koranga"
print(name)

// If we don't want the variable to be changed. Then, the keyword "let" comes into play.
let age = 27
// age = 21
print(age)

// STRING: When we assign text to a constant or variable, we call that a String.
let designation = "Developer"

// can use double quotes in string for certain word.
let quote = "I \"love\" to code in Swift."
print(quote)

// MULTI-LINE STRING: with triple quotes at the start and end on their own line, with string in between.
let movie = """
A day in
the life of an
Apple Engineer.
"""
print(movie)
// STRING FUNCTIONALITIES.
// Length of String: counts alphabet and spaces.
print(movie.count)

// UPPER-CASE: makes every alphabet Uppercase except already uppercased letter.
print(movie.uppercased())

// hasPrefix(): checks whether a string starts with some letters of our choice, returns "boolean value".
print(movie.hasPrefix("A Day"))

// hasSuffix(): checks end with provided text, returns "boolean value".
print(movie.hasSuffix("Apple Engineer."))

// Operations on Integer: which provides whole numbers in return.
let score = 10

let lowerScore = score - 2
let higherScore = score + 2
let doubledScore  = score * 2
let squaredScore = score * score
let halvedScore  = score / 2
print(score)

// Decimal:
let number = 0.1 + 0.2
print(number)

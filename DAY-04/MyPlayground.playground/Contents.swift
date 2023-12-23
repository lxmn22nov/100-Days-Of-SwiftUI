// TYPE INFERENCE: swift infers that "profession" is a string cuz we're assigning text to it and same with "age" is a Int cuz we're assinging a whole number to it.
let profession = "Developer"
var age = 29

// TYPE ANNOTATION: let us be explicitly about what data types we want.
let Profession: String = "Cricketer"
var Age: Int = 27
let pi: Double = 3.14
var isAuthenticated: Bool = false

// ARRAY
var colours: [String] = ["Red", "Green", "Blue"]

// DICTIONARY
var user: [String: Int32] = ["id": 111]

//SETS
var books: Set<String> = Set(["C++", "Java", "Python"])

// CHECKPOINT-02
// Create an array of strings, then write code that prints the number of items in the array and also the number of unique items in the array.

var legends: [String] = ["MSDhoni", "ChristianoRonaldo", "LebronJames", "Novak", "TigerWoods", "LouisHamilton", "ConnerMcGregor", "SteveJobs"]
print(legends)
print(legends.count)

// for unique elements used sets.
var Legends: Set<String> = Set(["MSDhoni", "ChristianoRonaldo", "LebronJames", "LouisHamilton", "ConnerMcGregor", "SteveJobs", "MSDhoni", "ChristianoRonaldo", "LebronJames"])
print(Legends)
print(Legends.count)

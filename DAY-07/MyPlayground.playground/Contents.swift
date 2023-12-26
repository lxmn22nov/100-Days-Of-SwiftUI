// FUNCTIONS: chunk of code, we've split off from the rest of the program and provide a name so we can refer to them easily.
// "func" keyword for function, "greeting()" function name, which later helps us in calling that particular function, value inside function name parenthesis, is "parameters" and value inside the function calling are "arguements".
func greeting() {
    print("Welcome to the App.")
}
greeting()

// creating a function printTables().
func printTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(number) * \(i) = \(number * i)")
    }
}
printTables(number: 9, end: 10)

// How to return values from functions.
func square(number: Int) -> Int{
    return number * number
}
print("Square of the number is",square(number: 5))

// Another function which if returning.
func rollDice() -> Int {
    return Int.random(in: 1...6)
}
print("Number rolled in the Dice:",rollDice())

// Question: Are the given two strings are identical?
func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
//  string1.sorted == string2.sorted()
}
print("Are Letters Identical:",areLettersIdentical(string1: "laxman", string2: "laxman"))

// How to return multiple values from functions.
// with the help of tuples.
func getUser() -> (firstName: String, middleName: String, lastName: String) {
    (firstName: "Laxman", middleName: "Singh", lastName: "Koranga")
}
let user = getUser()
print("\(user.firstName) \(user.middleName) \(user.lastName).")
print("\(getUser().firstName) \(getUser().middleName) \(getUser().lastName).")

// DESTRUCTURING:
let (firstName, middleName, lastName) = getUser()
print("Name: \(firstName) \(middleName) \(lastName).")

// can declare function with tuples, without defining the parameters.
func getUser1() -> (String, String,String) {
    ("Laxman","Singh","Koranga")
}
print("\(getUser1().0) \(getUser1().1) \(getUser1().2)")

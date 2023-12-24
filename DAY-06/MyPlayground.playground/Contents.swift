// LOOPS:
var avengers: [String] = ["IronMan","CaptainAmerica","Thor","BlackWidow","HawkEye"]

for marvelHeroes in avengers {
//    print("These are Marvel SuperHeroes: \(avengers)")
    print("These are Marvel SuperHeroes: \(marvelHeroes)")
}
// NOTE: marvelHeroes is "Loop variable", one cycle through the loop body is a "Loop iteration", code inside the braces is "Loop body".

// RANGE in for loop: both range values are inclusive.
for i in 1...10 {
    print("5 x \(i) = \(5 * i)")
}

// NESTED LOOP.
for i in 1...10 {
    print("The \(i) times table.")
    for j in 1...10 {
        print(" \(j) x \(i) = \(j * i)")
    }
}

// NOTE: When you see "x...y" you know it creates a range that starts at whatever number x is and counts up to and including whatever number y is. Swift has a similar-but-different type of range that counts up to but excluding the final number: "..<".
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting 1 upto 5: \(i)")
}

// Underscore(_) in for loop.
var lyric: String = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

// WHILE LOOP: continuosly execute the loop body until the condition is false.

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("BlastOff!")

// NOTE: The main difference is that for loops are generally used with finite sequences: we loop through the numbers 1 through 10, or through the items in an array. On the other hand, while loops can loop until any arbitrary condition becomes false, which allows them until we tell them to stop.

// Break and Continue in Loops: "continue" skips the current loop iteration and "break" skips all remaining iterations.

let fileNames: [String] = ["me.jpg","work.txt","sophie.jpg","logo.png"]

for fileName in fileNames {
    if fileName.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(fileName)")
}

let num1: Int = 2
let num2: Int = 10
var multiples = [Int]()

for i in 1...100 {
    if i.isMultiple(of: num1) && i.isMultiple(of: num2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)

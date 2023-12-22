// DataTypes: Arrays, Dictionaries, Sets, Enums.

// How to store ordered data in Arrays.

var marvelHeroes = ["Thor", "Black Widow", "Captain America"]           // array of strings.
var numbers = [3,6,7,1,2,5]                                              // array of numbers.
var temperature = [3.3, 4.6, 55.4, 54.1]                                 // array of decimals.

// accessing array elements with index values.
print(marvelHeroes[1])
print(numbers[3])
print(temperature[3])

// we can add elements to the array with ".append" method.
marvelHeroes.append("IronMan")
print(marvelHeroes)
temperature.append(66.6)
print(temperature)

// NOTE: We cannot add the element of array string to the array of numbers/decimals, vice-versa.
// And, we cannot add two different type of array elements to the third array too.

let firstMarvelHero = marvelHeroes[2]
let firstTemperature = temperature[4]
// let notAllowed = firstMarvelHero + firstTemperature             // code will broke, type string and Double can't be concatenated.
// print(notAllowed)

// Specialized Arrays of Integers.
var evenNum = Array<Int>()
print(evenNum)                                                      // empty array.
evenNum.append(2)
evenNum.append(4)
evenNum.append(6)
evenNum.append(8)
print(evenNum)

// Specialized Arrays of Strings.
var planets = Array<String>()
print(planets)
planets.append("Mars")
planets.append("Earth")
planets.append("Saturn")
planets.append("Neptune")
print(planets)

// Arrays methods: count, remove, removeAll(), contains, sorted(), reversed().
print(planets.count)

print(planets.remove(at: 3))

// print(planets.removeAll())

print(planets.contains("Earth"))

print(planets.sorted())

// Dictionaries.
// How to store & find data in dictionaries.

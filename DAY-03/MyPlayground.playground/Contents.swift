// DataTypes: Arrays, Dictionaries, Sets, Enums.
// ARRAYS: elements can be stored in the order we add them and can have duplicates.
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

// Dictionaries: don't allow duplicate keys, if we set a value for a key that already exists, swift overwrites the previous assigned value.
// How to store & find data in dictionaries.
 
let employee = [
    "name": "Himanshu",
    "job": "BankPO",
    "location": "Delhi"
]
// In case of dictionaries, always provide the default values, in case the desired element was not found, default value will be shown as the output.
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

var hasGraduated = [
    "CaptainAmerica": false,
    "WonderWomen": true,
    "Batman": true,
    "IronMan": true,
    "Thor": false
]
// NOTE: default values has to be the same type like key datatype.
print(hasGraduated["CaptainAmerica", default: false])

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]
print(olympics[2012, default: "Unknown"])

// We can create an empty dictionary using explicit types, we want to store.
var height = [String: Int]()
height["Lebron James"] = 206
height["Micheal Phelps"] = 205
height["Micheal Jordan"] = 208
print(height)
print(height["Lebron James", default: 0])

// some dictionaries methods.
print(height.count)
print(height.keys)
print(height.values)

/*
 CLASSES-
    - Swift uses structs for storing most of its data types, including String, Int, Double, and Array, but there is another way to create custom data types called classes.
*/
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score).")
        }
    }
}
var newGame = Game()
newGame.score += 10

// How to make one class inherit from another?
// When one class inherits functionality from another class (its “parent” or “super” class), Swift will give the new class access (the “child class” or “subclass”) to the properties and methods from that parent class, allowing us to make small additions or changes to customize the way the new class behaves. To make one class inherit from another, write a colon after the child class’s name, then add the parent class’s name.

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a dev, who'll sometimes work \(hours) hours a day and rest afterwards.")
    }
}
class Manager: Employee {
    func work(hours: Int) {
        print("I'm going to meetings for \(hours) hours.")
    }
}

// Those two classes can refer directly to "hours".
// creating an instance of each.
let Laxman = Developer(hours: 9)
let Pankaj = Manager(hours: 5)
Laxman.work()
Pankaj.work(hours: 5)
Laxman.printSummary()
Pankaj.printSummary()

/*
    - We can add methods to parent class, which can then be called by child classes. eg: "printSummary"
    - Cuz, Developer inherits from Employee, we can call printSummary() on instances of Developer.
    - Things get little more complicated when we want to change a method we inherited meaning what if one of those child classes wants slightly different behaviour.
    - So, if a child classes wants to change the behaviour of the particular method, we have to use "override" keyword to that child class method.
    - Swift is smart about how method overrides work: if your parent class has a work() method that takes no parameters, but the child class has a work() method that accepts a string to designate where the work is being done, that does not require override because you aren’t replacing the parent method.
    - If you know for sure that your class should not support inheritance, you can mark it as "final". This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.
 */

// How to add initializers for classes?
    // Class initializers in Swift are more complicated than struct initializers.
    // If a child class has any custom initializers, it must always call the parent’s initializer after it has finished setting up its own properties, if it has any.
    // Swift won’t automatically generate a memberwise initializer for classes, it'll never generate a memberwise initializer for us. So, we either need to write our own initializer, or provide default values for all the properties of the class.
    // "super" keyword allows us to call up to methods that belong to our parent class, such as init, we can use it with other methods if we want.

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
// instance
let tesla = Car(isElectric: true, isConvertible: true)

// NOTE: If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class.

// How to copy classes?
    // In Swift, all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.

class User {
    var userName = "Anonymous"
}
var user1 = User()
var user2 = user1
user2.userName = "Dixon"
print(user1.userName)
print(user2.userName)

class user {
    var username = "Ronaldo"
    
    func copy() -> user {
        let USER = user()
        USER.username = username
        return USER
    }
}
// Now we can safely call copy() to get an object with the same starting data, but any future changes won’t impact the original.

// How to create a deinitializer for a class?

class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    deinit {
        print("User \(id): I'm dead!")
    }
}

// How to work with variables inside classes?
    // Swift's classes work a bit like signposts, every copy of a class instance points to the same piece of data.
class Person {
    var name = "Julia"
}
//let Person = Person()
//Person.name = "Robert"
//print(Person.name)
// We created a constant "Person" instance, but then changes it, we can't change the constant value.

class Person1 {
    var name1 = "Evans"
}
var person = Person1()
person.name1 = "CaptainAmerica"
person = Person1()
print(person.name1)

// NOTE: One upside to all this is that classes don’t need to use the mutating keyword with methods that change their data. This keyword is really important for structs because constant structs cannot have their properties changed no matter how they were created, so when Swift sees us calling a mutating method on a constant struct instance it knows that shouldn’t be allowed.

// CHECKPOINT-07
/*
 Make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog and Persian and Lion as subclasses of Cat.

 But there’s more:
 - The Animal class should have a legs integer property that tracks how many legs the animal has.
 - The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
 - The Cat class should have a matching speak() method, again with each subclass printing something different.
 - The Cat class should have an isTame Boolean property, provided using an initializer.
 */
class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    func speak() {
        print("Animal speaks!")
    }
}
class Dog: Animal {
    override func speak() {
        print("Dogs barks!")
    }
}
class Cat: Animal {
    override func speak() {
        print("Cats do meow!")
    }
}
class Corgi: Dog {
    override func speak() {
        print("Corgi barks in his voice!")
    }
}
class Poodle: Dog {
    override func speak() {
        print("Poodle barks in his voice!")
    }
}
class Persian: Cat {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    override func speak() {
        print("Persian cat meow in his voice!")
    }
}
class Lion: Cat {
    override func speak() {
        print("Lion cat meow in his voice.")
    }
}

import UIKit

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

// Inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

let dory = Poodle(name: "Dory")

// Overriding methods
class Puppy {
    func makeNoise() {
        print("Woof!")
    }
}

class Husky: Puppy {
    override func makeNoise() {
        print("Yip!")
    }
}

let hubert = Husky()
hubert.makeNoise()
print()

// Final classes
final class Cat {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// Copying objects
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)
print()

// Deinitializers
class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// Mutability
class Rocker {
    // let name = "Axl Rose" // value can't be changed
    var name = "Axl Rose"
}

let ed = Rocker()
ed.name = "Ed Sheeran" // value of a constant (let) can be changed in a class
print(ed.name)

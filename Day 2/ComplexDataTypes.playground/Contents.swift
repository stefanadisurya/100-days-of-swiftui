import UIKit

// Arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]

// Sets -> item must be unique.
//      -> items aren't stored in any order.
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "green", "blue", "red", "green", "blue"])

// Tuples -> can't add or remove items from a tuple.
//        -> can't change the type of items in a tuple.
//        -> can access items in a tuple using numerical positions or by naming them.
var name = (first: "Taylor", last: "Swift")
name.0
name.first = "LOL"
name.first

// Arrays vs sets vs tuples
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
let set = Set(["aardvark", "astronaut", "azalea"])
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

// Dictionary -> collections of values just like arrays, but rather than storing things with an integer position you can access them using anything you want.
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]

let weights : [String: Double] = [
    "Stefan Adisurya": 80.0,
    "Joko Amin": 75.0
]
weights["Joko"]

// Dictionary default value
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["paul", default: "Unknown"]

let planets = [1: "Mercury", 2: "Venus"]
let venus = planets[2, default: "Planet X"]

// Creating empty collections
var teams = [String: String]() // Empty dictionary
teams["Paul"] = "Red"
var scores = Dictionary<String, Int>() // Empty dictionary

var results = [Int]() // Empty integer array
var results2 = Array<Int>() // Empty integer array

var words = Set<String>() // Empty string set
var numbers = Set<Int>() // Empty integer set

// Enumerations -> a way of defining groups of related values in a way that makes them easier to use.
let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure
result4

// Enum assoicated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}


let talking = Activity.talking(topic: "Football")

// Enum raw values
enum Planet: Int {
    case mercury = 1 // if not assigned a value, it will start from 0
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)

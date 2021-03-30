import UIKit

// Variables and constants
var name = "Tim McGraw"
name = "Romeo"

let name2 = "Tim Tom"

// Types of data
var address: String
address = "String Street 18"

var age: Int
age = 25

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

var stayOutTooLate: Bool
stayOutTooLate = false

var nothingInBrain: Bool
nothingInBrain = true

var missABeat: Bool
missABeat = false

// Operators
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var c = 1.1
var d = 2.2
var e = c + d

e > 3
c >= 3
e > 4
e < 4

var n1 = "Tim McGraw"
var n2 = "Romeo"
var both = n1 + " and " + n2

n1 == "tim mcgrAw"
n1 != "tIm mcgraw"

var thisIsBoolean = true
thisIsBoolean
!thisIsBoolean

// String interpolation
var desc = "I am a developer"
"My name is \(n1), \(desc). I am \(age) years old. If you multiply my age by 2, my age is \(age * 2)"

// Arrays
var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
type(of: songs)
songs[0]
songs[1]
songs[2]

var songs2: [String] = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var songs3: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]

var songs4: [String] = []
var songs5 = [String]()

var combinedArray = songs + songs2
combinedArray += ["Everything has Changed"]

// Dictionaries
var person = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]
person["middle"]
person["month"]


// Conditional statements
var action: String
var people = "hater"

if people == "hater" {
    action = "hate"
} else if people == "player" {
    action = "play"
} else {
    action = "cruise"
}

var aBoolean = true
var alsoABoolean = true

if aBoolean && alsoABoolean {
    action = "cruise"
}

if !aBoolean && !alsoABoolean {
    action = "swim"
}

// Loops
var songs6 = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs6 {
    print("My favorite song is \(song)")
}

for i in 1 ... 10 {
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 0 ..< 5 {
    str += " fake"
}
print(str)

var roles = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ..< roles.count {
    var str = "\(roles[i]) gonna"
    
    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }
    
    print(str)
}

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1
    
    if counter == 10 {
        break
    }
}

// Switch case
let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")
    
case 1:
    print("You just released iTunes Live From SoHo")
    
case 2:
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}

let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star")

case 4...5:
    print("You're world famous!")

default:
    print("Have you done something new?")
}

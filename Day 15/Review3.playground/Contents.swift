import UIKit

// Properties
struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I am changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    var shoes: String
    var age: Int
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes).")
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "T-shirts", shoes: "sneakers", age: 20)
let other = Person(clothes: "short skirts", shoes: "high heels", age: 21)
taylor.describe()
other.describe()
taylor.clothes = "short skirts"
print()

// Static properties and methods
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)
print()

// Access control
struct Fan {
    private var name: String // property is available only inside methods that belong to the type, or its extensions
    fileprivate var age: Int // only Swift code in the same file as the type can read and write the property
    public var address: String // everyone can read and write the property
    internal var hobby: String // only your Swift code can read and write the property
}

// Polymorphism
class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

let taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studio")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
}
print()

// Typecasting
let number = 5
let text = String(number)
print(text)
print()

// Closures
let vw = UIView()

UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

// Trailing closure syntax -> if the last parameter to a method takes a closure, you can eliminate that parameter and instead provide it as a block of code inside braces.

// Protocol
protocol Employee {
    var name: String { get set }
    var jobTitle: String { get set }
    func doWork()
}

struct Executive: Employee {
    var name = "Steve Jobs"
    var jobTitle = "CEO"
    
    func doWork() {
        print("I'm strategizing!")
    }
}

struct Manager: Employee {
    var name = "Maurice Moss"
    var jobTitle = "Head of IT"

    func doWork() {
        print("I'm turning it off and on again.")
    }
}

let staff: [Employee] = [Executive(), Manager()]

for person in staff {
    person.doWork()
}
print()

// Extensions
var myInt = 0

extension Int {
    func returnPlusOne() -> Int {
        return self + 1
    }
    
    mutating func plusOne() {
        self += 1
    }
}
myInt.plusOne()

extension String {
    mutating func trim() {
        self = trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var str: String = "I got whitespaces here!"
print(str.trim())
print()

// Protocol extensions
extension BinaryInteger {
    func clamp(low: Self, high: Self) -> Self {
        if (self > high) {
            return high
        } else if (self < low) {
            return low
        }
        
        return self
    }
}

let i: Int = 8
print(i.clamp(low: 0, high: 5))

let j: UInt64 = 8
print(j.clamp(low: 0, high: 5))

extension Employee {
    func doWork() {
        print("I'm busy!")
    }
}

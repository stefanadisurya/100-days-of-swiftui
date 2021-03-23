import UIKit

// Closures
let driving = {
    print("I'm driving in my car")
}

driving()

// Accepting parameters in a closure
let standing = { (place: String) in
    print("I'm standing in \(place)")
}

standing("London") // closure doesn't using parameter labels

// Retuning values from a closure
let sitting = { (place: String) -> String in
    return "I'm going to sit in \(place)"
}

let message = sitting("New York")
print(message)

// Closures as parameters
let driving2 = {
    print("I'm driving in my car")
}

func travel(letUs: () -> Void) {
    print("I'm getting ready to go.")
    letUs()
    print("I arrived!")
}

travel(letUs: driving2)

// Trailing closure syntax
// Example 1
travel() {
    print("Trailing closure syntax 🔥")
    print("I'm driving in my car now!")
}

// Example 2
func jumping(name: String, count: Int, action: () -> Void) {
    print("Let's jump, \(name)!")
    for _ in 0..<count {
        action()
    }
}

jumping(name: "Stefan", count: 5) {
    print("I'm jumping!")
}

// Example 3
func goOnVacation(to destination: String, _ activities: () -> Void) {
    print("Packing bags...")
    print("Getting on plane to \(destination)...")
    activities()
    print("Time to go home!")
}
goOnVacation(to: "Mexico") {
    print("Go sightseeing")
    print("Relax in sun")
    print("Go hiking")
}

import UIKit

// Using closures as parameters when they accept parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}

func getDirections(to destination: String, then travel: ([String]) -> Void) {
    let directions = [
        "Go straight ahead",
        "Turn left onto Station Road",
        "Turn right onto High Street",
        "You have arrived at \(destination)"
    ]
    travel(directions)
}
getDirections(to: "London") { (directions: [String]) in
    print("I'm getting my car.")
    for direction in directions {
        print(direction)
    }
}
print()

// Using closures as parameters when they return values
func travel2(action: (String) -> String) {
    print("I'm getting ready to go")
    let description = action("New York")
    print(description)
    print("I arrived!")
}

travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
print()

// Shorthand parameter names
func travel3(action: (String) -> String) {
    print("I'm getting ready to go")
    let description = action("Chicago")
    print(description)
    print("I arrived!")
}

// Only works with 1 parameter
travel3 { place in
    return "I'm going to \(place) in my car"
}

// Only works with 1 parameter
travel3 { place in
    "I'm going to \(place) in my car"
}

// Only works with 1 parameter
travel3 {
    "I'm going to \($0) in my car"
}
print()

// Closures with multiple parameters
func travel4(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel4 {
    "I'm going to \($0) at \($1) miles per hour."
}
print()

// Returning closures from functions
func travel5() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel5()
result("London")
print()

// Capturing values
func travel6() -> (String) -> Void {
    var counter = 1
    
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let res = travel6()
res("London")
res("London")
res("London")

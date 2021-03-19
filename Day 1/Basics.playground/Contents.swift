import UIKit

// Variables
var str = "Hello, playground"
str = "Goodbye"

// Strings and integers
var age = 38
var population = 8_000_000

// Multi-line strings --> uses """ at the start and end of the string (on different lines)
var str1 = """
This goes
over multiple
lines
"""

var str2 = """
This goes \
over multiple \
lines
"""

var burns = """
The best laid schemes
o' mice an' men
gang aft agley
"""

// Doubles and booleans
var pi = 3.141
var awesome = true

// String interpolation --> we can actually run code inside
var score = 85
var word = "Your score was \(score)"
var results = "The test results are here: \(word)"

// Constants
let taylor = "swift"

// Type annotations
let sentence = "Hello, World!"
let album: String = "Reputation"
let year: Int = 1988
let height: Double = 1.78
let taylorRocks: Bool = true

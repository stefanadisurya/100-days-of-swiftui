import UIKit


// Operators
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore
let moodulo = 13 % secondScore

// Operator overloading -> what an operator does depends on the values you use it with.
let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

// Compound assignment operators
var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

// Comparison operators
let score1 = 6
let score2 = 4

score1 == score2
score1 != score2

score1 < score2
score1 >= score2

"Taylor" <= "Swift"

// Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces - Lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// Combining conditions
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("One of them is over 18")
}

// Ternary operator
let card1 = 11
let card2 = 10
print(card1 == card2 ? "Cards are the same" : "Cards are different")

// Switch statements
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
    fallthrough
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen!")
    fallthrough // executes next case
default:
    print("Enjoy your day")
}

// Range operators -> ..< excludes the final value.
//                 -> ... includes the final value.
let nilai = 85
switch nilai {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

let passingGrade = 70...100

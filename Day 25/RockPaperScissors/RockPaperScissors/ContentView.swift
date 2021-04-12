//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Stefan Adisurya on 11/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pickMove = Int.random(in: 0 ..< 2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    
    @State private var moves: [String] = ["Rock", "Paper", "Scissor"].shuffled()
    
    @State private var computerChoice: String = ""
    @State private var playerChoice: String = ""
    @State private var turns = 0
    
    @State private var showAlert = false
    
    func calculateResult() {
        if turns < 10 {
            computerChoice = moves[pickMove]
            
            if shouldWin {
                if computerChoice == "Rock" {
                    playerChoice = "Paper"
                } else if computerChoice == "Paper" {
                    playerChoice = "Scissor"
                } else {
                    playerChoice = "Rock"
                }
                score += 1
            } else {
                if computerChoice == "Rock" {
                    playerChoice = "Scissor"
                } else if computerChoice == "Paper" {
                    playerChoice = "Rock"
                } else {
                    playerChoice = "Paper"
                }
                
                if score <= 0 {
                    score = 0
                } else {
                    score -= 1
                }
            }
            
            moves.shuffle()
            shouldWin = Bool.random()
            
            turns += 1
        } else {
            showAlert = true
            score = 0
        }
    }
    
    var body: some View {
        VStack {
            Text("Score")
                .font(.callout)
            
            Text("\(score)")
                .bold()
                .font(.largeTitle)
            
            Spacer()
            
            VStack {
                Image(computerChoice)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("Computer")
                    .bold()
                    .padding()
                    .font(.callout)
            }
            
            Spacer()
            
            VStack {
                Image(playerChoice)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("You")
                    .bold()
                    .padding()
                    .font(.callout)
            }
            
            Spacer()
            
            Button(action: {
                calculateResult()
            }) {
                Text("Play")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50, alignment: .center)
            }
            .background(Color.purple)
            .cornerRadius(15)
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Game over"), message: Text("Your score is \(score)"), dismissButton: .default(Text("Done")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

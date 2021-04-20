//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Stefan Adisurya on 06/04/21.
//

import SwiftUI

struct FlagImage: View {
    var countryList = [String]()
    var index = 0
    
    var body: some View {
        Image(countryList[index])
            .resizable()
            .renderingMode(.original)
            .frame(width: 300, height: 150, alignment: .center)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    
    @State private var animationAmount = 0.0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreDescription = ""
    @State private var score = 0
    
    @State private var isCorrect = false
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreDescription = "Your score is \(score)"
            self.isCorrect = true
        } else {
            scoreTitle = "Wrong"
            score += 0
            scoreDescription = "That's the flag of \(countries[number])"
            self.isCorrect = false
        }
        
        withAnimation {
            self.animationAmount += 360
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(countryList: countries, index: number)
                    }
                    .if(isCorrect) { $0.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0)) }
                    .if(!isCorrect) { $0.rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0)) }
                }
                Spacer()
                
                Text("Score")
                    .bold()
                    .font(.callout)
                    .foregroundColor(.white)
                    .padding(.bottom, -20)
                
                Text("\(score)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle), message: Text(scoreDescription), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

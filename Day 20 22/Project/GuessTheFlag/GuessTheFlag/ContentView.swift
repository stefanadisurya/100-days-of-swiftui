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

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreDescription = ""
    @State private var score = 0
    
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreDescription = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            score += 0
            scoreDescription = "That's the flag of \(countries[number])"
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

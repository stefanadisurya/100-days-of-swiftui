//
//  ContentView.swift
//  Edutainment
//
//  Created by Stefan Adisurya on 21/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var multiplication = 1
    @State private var selectedIndex = 1
    @State private var answer = ""
    var questionsToBeAsked = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Multiplication")) {
                    Stepper(value: $multiplication, in: 1...12, step: 1) {
                        Text("\(multiplication)")
                    }
                }
                
                Section(header: Text("Questions to be asked")) {
                    Picker("Questions to be asked", selection: $selectedIndex) {
                        ForEach(0 ..< questionsToBeAsked.count) {
                            Text("\(self.questionsToBeAsked[$0])")
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                ForEach(0..<questionsToBeAsked[selectedIndex]) { i in
                    Section(header: Text("What's \(multiplication) x \(i+1)?")) {
                        TextField("Answer", text: $answer)
                            .keyboardType(.numberPad)
                    }
                }
            }
            .navigationBarTitle("Edutainment")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

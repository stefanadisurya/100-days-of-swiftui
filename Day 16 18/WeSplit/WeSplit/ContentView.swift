//
//  ContentView.swift
//  WeSplit
//
//  Created by Stefan Adisurya on 04/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
//    @State private var numberOfPeople = 2 // index
    @State private var peopleNum = ""
    @State private var tipPercentage = 2 // index
    let tipPercentages = [10, 15, 20, 25, 0]
    
    @State private var isZeroTip = false
    
    var totalPerPerson: Double {
        let peopleCount = Double((Double(peopleNum) ?? 0) + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = Double(orderAmount) / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = Double(orderAmount) / 100 * tipSelection
        let totalAmount = orderAmount + tipValue
        
        return totalAmount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $peopleNum)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .onReceive([self.tipPercentage].publisher.first(), perform: { (value) in
                        if value == 4 {
                            isZeroTip = true
                        } else {
                            isZeroTip = false
                        }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Total Check Amount")) {
                    Text("\(totalAmount, specifier: "%.2f")")
                        .foregroundColor(isZeroTip ? .red : .black)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

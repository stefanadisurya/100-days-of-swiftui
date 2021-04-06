//
//  ContentView.swift
//  Challenge1
//
//  Created by Stefan Adisurya on 05/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var number = ""
    @State private var inputSelection = 1
    @State private var outputSelection = 1
    let inputOpt = ["C", "F", "K"]
    let outputOpt = ["C", "F", "K"]
    
    var result: Double {
        let celciusToKelvin = Double((Double(number) ?? 0) + 273.15)
        let celciusToFahrenheit = Double(((Double(number) ?? 0)  * (9/5)) + 32.0)

        let fahrenheitToCelcius = Double(((Double(number) ?? 0) - 32.0) * (5/9))
        let fahrenheitToKelvin = fahrenheitToCelcius + 273.15

        let kelvinToCelcius = Double((Double(number) ?? 0) - 273.15)
        let kelvinToFahrenheit = (kelvinToCelcius * 9/5) + 32.0
        
        var total: Double
        
        switch inputSelection {
        case 0:
            if outputSelection == 0 {
                total = Double(number) ?? 0
            } else if outputSelection == 1 {
                total = celciusToFahrenheit
            } else {
                total = celciusToKelvin
            }
            
        case 1:
            if outputSelection == 0 {
                total = fahrenheitToCelcius
            } else if outputSelection == 1 {
                total = Double(number) ?? 0
            } else {
                total = fahrenheitToKelvin
            }
            
        case 2:
            if outputSelection == 0 {
                total = kelvinToCelcius
            } else if outputSelection == 1 {
                total = kelvinToFahrenheit
            } else {
                total = Double(number) ?? 0
            }
            
        default:
            total = 0
            
        }
        
        return total
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input unit")) {
                    Picker("Input unit", selection: $inputSelection) {
                        ForEach(0 ..< inputOpt.count) {
                            Text("\(self.inputOpt[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output unit")) {
                    Picker("Output unit", selection: $outputSelection) {
                        ForEach(0 ..< outputOpt.count) {
                            Text("\(self.outputOpt[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Number")) {
                    TextField("Enter number to be converted", text: $number)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Result")) {
                    Text("\(result, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Unit Converter")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

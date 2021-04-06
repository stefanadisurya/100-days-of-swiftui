//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Stefan Adisurya on 06/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
        
//        RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 20, endRadius: 200)
        
//        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        
//        Button(action: {print("Button was tapped")}) {
//            HStack(spacing: 10) {
//                Image(systemName: "pencil")
//                Text("Edit")
//            }
//        }
        
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI"), message: Text("This is some detail mesage"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

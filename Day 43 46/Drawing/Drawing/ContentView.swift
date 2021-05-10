//
//  ContentView.swift
//  Drawing
//
//  Created by Stefan Adisurya on 29/04/21.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 100))
        
        return path
    }
}

struct ContentView: View {
    var body: some View {
        Arrow()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

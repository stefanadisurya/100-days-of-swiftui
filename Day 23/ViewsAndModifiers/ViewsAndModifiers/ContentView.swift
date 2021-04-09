//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Stefan Adisurya on 09/04/21.
//

import SwiftUI

// Custom modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

// View composition
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    @State private var useRedText = false
    
    let motto1 = Text("Draco dormiens")
    var motto2: some View { Text("nunquam titillandus") }
    
    var body: some View {
        VStack {
            // Conditional modifiers
            Button("Hello, World!") {
                self.useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
            
            Spacer()
            
            // Environment modifiers
            VStack {
                Text("Gryffindor")
                    .blur(radius: 0)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .blur(radius: 5)
            
            Spacer()
            
            motto1
                .foregroundColor(.pink)
            
            motto2
            
            Spacer()
            
            VStack(spacing: 10) {
                CapsuleText(text: "First")
                    .foregroundColor(.white)
                CapsuleText(text: "Second")
                    .foregroundColor(.yellow)
            }
            
            Text("Hello, World!")
                .modifier(Title())
            
            Text("Hello, Wolrd!")
                .titleStyle()
        }
//        Color.blue
//            .frame(width: 30, height: 300)
//            .watermarked(with: "Hacking with Swift")
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    // To create an implicit HStack
//    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
//        self.rows = rows
//        self.columns = columns
//        self.content = content
//    }
}

struct NewContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

// Challenge
struct CustomViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewContentView()
    }
}

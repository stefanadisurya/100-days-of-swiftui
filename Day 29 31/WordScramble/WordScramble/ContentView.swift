//
//  ContentView.swift
//  WordScramble
//
//  Created by Stefan Adisurya on 15/04/21.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        
        // List
        List {
            ForEach(people, id: \.self) {
                Text($0)
            }
        }
        .listStyle(InsetGroupedListStyle())
        
        // Loading resources from app bundle
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle!
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

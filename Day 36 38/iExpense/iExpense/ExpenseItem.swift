//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Stefan Adisurya on 23/04/21.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

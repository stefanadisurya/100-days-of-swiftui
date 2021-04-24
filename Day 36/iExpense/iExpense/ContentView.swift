//
//  ContentView.swift
//  iExpense
//
//  Created by Stefan Adisurya on 22/04/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    func removeitems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            
            List {
                Section(header: Text("Info")) {
                    VStack {
                        HStack {
                            Circle()
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundColor(.green)
                            
                            Text("Amount under $10  ")
                                .padding(.leading, 4)
                        }
                        
                        HStack {
                            Circle()
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundColor(.orange)
                            
                            Text("Amount under $100")
                                .padding(.leading, 4)
                        }
                        
                        HStack {
                            Circle()
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundColor(.red)
                            
                            Text("Amount above $100")
                                .padding(.leading, 4)
                        }
                    }
                }
                
                Section(header: Text("Expenses")) {
                    ForEach(expenses.items) { item in
                        HStack {
                            Circle()
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundColor(item.amount < 10 ? .green : (item.amount < 100 ? .orange : .red))
                            
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                Text(item.type)
                                    .font(.subheadline)
                            }
                            .padding(.leading, 4)
                            
                            Spacer()
                            
                            Text("$\(item.amount)")
                        }
                    }
                    .onDelete(perform: removeitems)
                }
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.showingAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    }
                    
                    EditButton()
                }
            )
        }
        .sheet(isPresented: $showingAddExpense, content: {
            AddView(expenses: self.expenses)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

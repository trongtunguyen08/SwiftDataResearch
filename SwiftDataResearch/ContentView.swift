//
//  ContentView.swift
//  SwiftDataResearch
//
//  Created by Tu Nguyen on 15/6/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showAddNewItemModal: Bool = false
    @Query private var items: [Expense]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { expense in
                    HStack {
                        Text(expense.name)
                        Text(expense.date.formatted(date: .numeric, time: .omitted))
                        Spacer()
                        Text(expense.value, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        context.delete(items[index])
                    }
                })
            }
            .overlay(content: {
                if items.isEmpty {
                    VStack {
                        emptyListView
                    }
                }
            })
            .sheet(isPresented: $showAddNewItemModal, content: {
                AddExpenseView()
            })
            .navigationTitle("Expenses")
        }
        
    }
}

extension ContentView {
    private var emptyListView: some View {
        VStack {
            ContentUnavailableView("No Expenses", systemImage: "list.bullet.rectangle.portrait", description: {
                Text("Start adding expenses to see your list")
            }())
            
            Button("Add Expense") {
                self.showAddNewItemModal = true
            }
        }
    }
}

#Preview {
    ContentView()
}

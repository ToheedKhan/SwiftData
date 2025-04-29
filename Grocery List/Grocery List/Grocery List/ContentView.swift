//
//  ContentView.swift
//  Grocery List
//
//  Created by Toheed Khan on 28/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    /*
     this query is really smart.
     It will load all the grocery items immediately when the view appears, and it will also watch the database
     for changes so that whenever any object gets added, deleted or changed, then the items property will
     also be updated.
     */
    @Query private var items: [Item]
    
    var body: some View {
       NavigationStack
        {
            List {
                ForEach(items) {
                    item in
                    Text(item.title)
                }
            }
            .navigationTitle("Grocery List")
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView("Empty Cart", systemImage: "cart.circle", description: Text("Add some items to the shopping list."))
                }
            }
        }
    }
}

#Preview("Sample Date") {
    let sampleData = [
        Item(title: "Bakery & Bread", isCompleted: true),
        Item(title: "Apple", isCompleted: false),
        Item(title: "Vegetable", isCompleted: .random()),
        Item(title: "Soap", isCompleted: .random()),
        Item(title: "Cereals", isCompleted: .random())
    ]
    //Container to access the database
    let container = try! ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    //Insert all asmple data into database
    
    for item in sampleData {
        container.mainContext.insert(item)
    }
    
    return ContentView().modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

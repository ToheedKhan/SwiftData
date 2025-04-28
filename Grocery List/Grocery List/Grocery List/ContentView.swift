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

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

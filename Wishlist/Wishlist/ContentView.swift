//
//  ContentView.swift
//  Wishlist
//
//  Created by Toheed Khan on 23/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var wishes: [Wish]
    
    var body: some View {
        NavigationStack {
        
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                }
            } //: LIST
            .navigationTitle("Wishlist")
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist",systemImage: "heart.circle", description: Text("No wishes yet. Add one to get started"))
                }
            }
        }
    }
}

#Preview("List with Sample Data") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    container.mainContext.insert(Wish(title: "Master SwiftData"))
    container.mainContext.insert(Wish(title: "Travel to Europe"))

    container.mainContext.insert(Wish(title: "Make a positive impact"))

    container.mainContext.insert(Wish(title: "Buy a new iPhone"))

    container.mainContext.insert(Wish(title: "Practive DSA"))
    
    return ContentView().modelContainer(container)
        
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}

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
                }
            } //: LIST
        }.navigationTitle("Wishlist")
    }
}

#Preview {
    ContentView()
}

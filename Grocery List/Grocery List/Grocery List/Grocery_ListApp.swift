//
//  Grocery_ListApp.swift
//  Grocery List
//
//  Created by Toheed Khan on 28/04/25.
//

import SwiftUI
import SwiftData

@main
struct Grocery_ListApp: App {
    var body: some Scene {
        WindowGroup {
            /*
             This model container creates and sets up a storage for the grocery list item objects.
             Also, it enables access to the storage inside the window group, which is the entire app.
             */
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}

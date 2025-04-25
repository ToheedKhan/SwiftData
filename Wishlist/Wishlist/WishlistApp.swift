//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Toheed Khan on 23/04/25.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}

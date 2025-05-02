//
//  WatchlistApp.swift
//  Watchlist
//
//  Created by Toheed Khan on 01/05/25.
//

import SwiftUI
import SwiftData

@main
struct WatchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: Movie.self)
        }
    }
}

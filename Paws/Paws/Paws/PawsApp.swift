//
//  PawsApp.swift
//  Paws
//
//  Created by Toheed Khan on 30/04/25.
//

import SwiftUI
import SwiftData

/*
 Here we integrate this Swift data model into this iOS application.
 */
@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: Pet.self)
        }
    }
}

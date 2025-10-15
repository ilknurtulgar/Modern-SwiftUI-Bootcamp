//
//  task11App.swift
//  task11
//
//  Created by İlknur Tulgar on 15.10.2025.
//

import SwiftUI
import SwiftData

@main
struct Task11App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: FavoriteLocation.self)
    }
}


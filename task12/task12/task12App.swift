//
//  task12App.swift
//  task12
//
//  Created by İlknur Tulgar on 31.10.2025.
//

import SwiftUI
import SwiftData

@main
struct task12App: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [WaterIntake.self])
        }
    }
}

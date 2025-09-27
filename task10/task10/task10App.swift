//
//  task10App.swift
//  task10
//
//  Created by İlknur Tulgar on 24.09.2025.
//

import SwiftUI

@main
struct task10App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CharacterView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  task8App.swift
//  task8
//
//  Created by İlknur Tulgar on 19.09.2025.
//

import SwiftUI
import CoreData

@main
struct task8App: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            NotesView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //viewContext, core data ile ui arasındaki köprü
        }
    }
}

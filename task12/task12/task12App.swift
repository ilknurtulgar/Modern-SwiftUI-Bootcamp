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

    let container: ModelContainer = {
        let schema = Schema([WaterIntake.self])
        let url = FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: "group.com.info.task12.watertracker")!
            .appendingPathComponent("water.sqlite")
        let config = ModelConfiguration(schema: schema, url: url)
        return try! ModelContainer(for: schema, configurations: [config])
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.modelContext, container.mainContext)
        }
    }
}



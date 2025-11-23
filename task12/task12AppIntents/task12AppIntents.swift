//
//  task12AppIntents.swift
//  task12AppIntents
//
//  Created by İlknur Tulgar on 24.11.2025.
//

import AppIntents

struct task12AppIntents: AppIntent {
    static var title: LocalizedStringResource { "task12AppIntents" }
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
